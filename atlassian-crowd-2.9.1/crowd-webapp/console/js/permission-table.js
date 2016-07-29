(function($, _, ajax, Crowd){
    var restEndpoints = {
        getPermittedGroups: AJS.contextPath() + '/rest/permissions/admin',
        setPermission: AJS.contextPath() + '/rest/permissions/admin',
        revokePermission: AJS.contextPath() + '/rest/permissions/admin/revoke',
        getGroups: AJS.contextPath() + '/rest/permissions/admin/groups'
    };

    function normalizeGroupResults(groupsData) {
        return _.map(groupsData, function(group){
            //combine group-name and directory-id to account for dupe names across different directories.
            var compositeId = createGroupId(group['group-name'], group['directory-id']);
            var results = {};
            results['group-id'] = compositeId;
            return $.extend(group, results);
        });
    }

    function printableGroupName(group){
        var groupName = group['group-name'];
        if (group['directory-name']) {
            groupName += " (" + group['directory-name'] + ")";
        }
        return groupName;
    }

    function createGroupId(groupName, directoryId) {
        return directoryId + "/" + groupName;
    }

    function parseGroupId(groupId) {
        var separatorIndex = groupId.indexOf('/');
        var directoryId = groupId.substr(0, separatorIndex);
        var groupName = groupId.substr(separatorIndex+1);
        var groupData = {};
        groupData['group-name'] = groupName;
        groupData['directory-id'] = directoryId;
        return groupData;
    }

    function makeDataSource() {

        function handleUnauthorized(response) {
            if (response.responseText && JSON.parse(response.responseText).message) {
                AJS.messages.error({title: 'Error', body: JSON.parse(response.responseText).message});
            }
        }
        function getMembers(params) {
            var deferred = new $.Deferred();
            var request = $.ajax({
                url : restEndpoints.getPermittedGroups,
                type : 'GET',
                data : params
            });
            request.success(function(data){
                data.results = normalizeGroupResults(data.results);
                deferred.resolve(data);
            });
            return deferred.promise();
        }

        /**
         * @param permission Single permission to set across all pairs
         * @param groups List of objects {group-name:, directory-id:}.
         * @returns {*}
         */
        function setPermission(permission, groups) {
            return $.ajax({
                dataType: 'json',
                contentType: 'application/json',
                url : restEndpoints.setPermission + '?permission=' + encodeURIComponent(permission),
                data: JSON.stringify(groups),
                type : 'PUT'
            })
                .fail(handleUnauthorized);
        }

        function removePermissions(group) {
            return $.ajax({
                dataType: 'json',
                contentType: 'application/json',
                url : restEndpoints.revokePermission,
                data: JSON.stringify(group),
                type : 'POST'
            })
                .fail(handleUnauthorized);
        }

        function getGroups(page, prefix){
            var deferred = new $.Deferred();
            var pageSize = 30;
            var request = $.ajax({
                url: restEndpoints.getGroups,
                data: {
                    prefix: prefix,
                    start: (page - 1) * pageSize,
                    limit: pageSize
                },
                type: 'GET'
            });
            //use a second deferred to normalize the group names.
            request.success(function(data){
                data.results = normalizeGroupResults(data.results);
                deferred.resolve(data);
            });
            return deferred.promise();
        }

        return {
            getMembers : getMembers,
            setPermission : setPermission,
            removePermissions : removePermissions,
            getGroups: getGroups
        };
    }

    function PermissionTable(container, permissionsOrderedList, currentUserHighestPerm, opts) {
        this._entityType = 'group';

        this._text = PermissionTable.groupText;
        this._rowTemplate = crowd.groupPermissionRow;
        this._isEntityCurrentUser = function() { return false; };

        this._dataSource = makeDataSource();

        this._permissions = _.pluck(permissionsOrderedList, 'name');
        this._initialPermission = this._permissions[this._permissions.length - 1];
        this._permissionNames = _.pluck(permissionsOrderedList, 'i18nName');
        this._permissionIds = _.pluck(permissionsOrderedList, 'permission')

        this._currentUserHighestPerm = currentUserHighestPerm;

        this._pageSize = 50;

        this._addedEntities = [];

        this.opts = opts || {};

        this._wireComponents(container);
        this._initAddMultiSelector();
        this._initRows();
        this._initLoadMoreButton();

        this.refresh();
    }

    PermissionTable.text = {
        entityList : {
            buttonLoadMoreText: "Load more"
        },
        cantGrantHigherPerms : function(permName) { return 'You cannot grant the {0} permission'; },
        inheritedPerm : 'This permission is inherited from a higher permission'
    };

    PermissionTable.userText = $.extend(true, {
        inactiveEntity : function(name) {
            return name + ' is deleted or marked as inactive in a remote directory';
        },
        cantRevokeHigherPerms : function(permName) { return 'You cannot change permissions for a ' + permName; },
        cantGrantSelfHigherPerms : function(permName) { return 'You cannot grant yourself the ' + permName + ' permission.'; },
        implicitPerm : 'To remove this permission, click the X to the right to remove the entire row.',
        noMoreItemsText: "All users already have permissions set."
    }, PermissionTable.text);

    PermissionTable.groupText =  $.extend(true, {
        inactiveEntity : function(name) {
            return name + ' is deleted';
        },
        cantRevokeHigherPerms : function(permName) { return 'You cannot change permissions for a ' + permName + ' group'; },
        implicitPerm : 'To remove this permission remove the group row',
        noMoreItemsText: "All groups already have permissions set."
    }, PermissionTable.text);

    PermissionTable.prototype._wireComponents = function(container) {
        this._$container = $(container);
        this._$tbody = this._$container.find('tbody');
        this._$noResults = this._$container.find('.no-results-row');
        this._$loadMore = this._$container.find('.load-more');
        this._$spinner = $(this._$loadMore).parent().append('<div class="permissions-spinner" />').find('.permissions-spinner');
    };

    PermissionTable.prototype._initAddMultiSelector = function() {
        var self = this;
        var permissionDropdown = $('.permission-type-dropdown');
        var permission = permissionDropdown.find('li:last-child').attr('data-value');
        var groupField = $('.permission-multi-selector').auiSelect2({
            multiple: true,
            query: function(query){
                var dataRequest = self._dataSource.getGroups(query.page, query.term);
                dataRequest.then(function(data){
                    var resultSet = _.map(data.results, function(group){
                        //combine group-name and directory-id to account for dupe names across different directories.
                        return {
                            id: group['group-id'],
                            text: printableGroupName(group)
                        };
                    });
                    query.callback({
                        results: resultSet,
                        more: !(data['last-page'])
                    });
                })
            }
        });

        $('#permission-table-form').submit(function(e){
            e.preventDefault();
        });

        function addToList(payload){
            return self._dataSource.setPermission(payload.permission, payload.entities)
                .done(function() {
                    self._addedEntities.push.apply(self._addedEntities, _.map(payload.entities, function(entity) {
                        var permittedEntity = {
                            permission: payload.permission
                        };
                        permittedEntity[self._entityType] = entity;
                        return permittedEntity;
                    }));
                    self.refresh();
                });
        }

        $('.add-button').click(function(){
            var selectedGroups = groupField.auiSelect2("val");
            groupField.auiSelect2('val', '');
            var groupList = [];
            _.each(selectedGroups, function(groupId){
                groupList.push(parseGroupId(groupId));
            });
            addToList({
                permission: 'ADMIN',
                entities: groupList
            });
        });
    };

    PermissionTable.prototype._updateErrors = function ($trigger, jqXhr) {
        var $sourceRow = $trigger.closest('tr'),
            entityId = $sourceRow.attr('data-entity-id');

        //immediately remove all previous errors in the current table.
        $sourceRow.closest('tbody').find('.permission-error').remove();

        //if this request fails, add the new errors in.
        return jqXhr.fail(function(xhr, textStatus, errorThrown, data) {
            if (data && data.errors) {
                var numRows = $sourceRow.children('td').length;
                $.each(data.errors, function(i) {
                    $sourceRow.after(crowd.errorPermissionRow({ entityId: entityId, numRows : numRows, message: data.errors[i].message }));
                });
            }
        });
    };

    PermissionTable.prototype._spinWhilePending = function($trigger, promise) {

        if (promise && promise.state() === 'pending') {

            // disable all checkboxes for this row while request is pending
            $trigger.closest('tr').find("input[type='checkbox']").prop('disabled', true);

            var $spinner = $('<div class="spinner" />');
            $spinner.insertAfter($trigger);
            $trigger.addClass('hidden');

            $spinner.spin('small');

            promise.always(function() {
                $trigger.removeClass('hidden');
                $spinner.remove();
            });
        }
    };

    PermissionTable.prototype._getAllCheckboxes = function($checkbox) {
        return $checkbox.parent().parent().find(':checkbox');
    };

    PermissionTable.prototype._getCheckboxStates = function($checkboxes) {
        return $.map($checkboxes, function(checkbox) {
            return { 'checked': $(checkbox).prop('checked'), 'disabled': $(checkbox).prop('disabled') };
        });
    };

    PermissionTable.prototype._restoreCheckboxStates = function($checkboxes, $states) {
        //Restore checked and disabled states to what they were previously
        $.each($states, function(index, state) {
            var $checkbox = $($checkboxes.get(index));

            $checkbox
                .prop('checked', state.checked)
                .prop('disabled', state.disabled)
                .toggleClass('disabled', state.disabled);
        });
    };

    PermissionTable.prototype._setChecked = function($newCheckbox, $oldCheckbox, $originalStates) {
        //Restore the checkbox states first, then update based on the selection
        this._restoreCheckboxStates(this._getAllCheckboxes($newCheckbox), $originalStates);

        //Uncheck the old one.
        $oldCheckbox.prop('checked', false).prop('title', '');

        //Check lower perms
        var lowerPerms = $newCheckbox.parent().nextAll().children(':checkbox')
            .prop('checked', true)
            .prop('disabled', true)
            .addClass('disabled')
            .prop('title', this._text.inheritedPerm);

        //Make the tooltip for the final perm indicate it is implicit rather than inherited
        //but only if it is the last perm left checked
        $newCheckbox.prop('title', lowerPerms.length ? '' : this._text.implicitPerm);

        //Check the new one.
        $newCheckbox
            .prop('checked', true)
            .prop('disabled', !lowerPerms.length) // disable it if it's the last one.
            .toggleClass('disabled', !lowerPerms.length);

        var name = $newCheckbox.closest('[data-entity-id]').attr('data-entity-id');
        var entityType = this._entityType;
        _.each(this._addedEntities, function(entity) {
            if (entity[entityType].name === name) {
                entity.permission = $newCheckbox.val();
            }
        });
    };

    PermissionTable.prototype._initRows = function() {
        var self = this;

        this._$tbody.on('change', ':checkbox', function() {

            var $this = $(this);
            var $parent = $this.parent();
            var $next = $parent.next();

            var entityId = $parent.parent().attr('data-entity-id');
            var $oldCheckbox, $newCheckbox;
            var oldPerm, newPerm;

            if (this.checked) {
                // find the highest previously checked item.
                while($next.length && !$next.children(':checked').length) {
                    $next = $next.next();
                }

                $oldCheckbox = $next.children(':checkbox');
                $newCheckbox = $this;

                oldPerm = $oldCheckbox.prop('value');
                newPerm = this.value;
            } else {

                $oldCheckbox = $this;
                $newCheckbox = $next.children(':checkbox');

                oldPerm = this.value;
                newPerm = $newCheckbox.prop('value');
            }

            var requests = [];

            if (newPerm) {
                requests.push(self._dataSource.setPermission(newPerm, [parseGroupId(entityId)]));
            }

            //Capture states now prior to disabling them all
            var checkboxStates = self._getCheckboxStates(self._getAllCheckboxes($newCheckbox));

            var collectivePromise = $.when.apply($, requests);

            self._spinWhilePending($this, collectivePromise);
            self._updateErrors($this, collectivePromise);

            collectivePromise
                .done(function(){
                    //update permission level in UI
                    self._setChecked($newCheckbox, $oldCheckbox, checkboxStates);
                })
                .fail(function(xhr, textStatus, errorThrown, data) {
                    //revert to old permission level
                    self._setChecked($oldCheckbox, $newCheckbox, checkboxStates);
                });
        }).on('click', '.delete-button', function(e) {
                // This is wrong, rather than telling the server we want to remove a specific permission,
                // we need a way to say "remove all permissions". Until the new rest endpoints are implemented though,
                // this will tell the server to remove the highest currently assigned permission (that we know about).
                // This will not work as intended if the user's permission level was changed in another window without
                // refreshing the current window (it will attempt to remove a permission level the user no longer has,
                // meaning the user is not removed)

                var $this = $(this),
                    $parentRow = $this.parents('tr').first(),
                    groupId = $parentRow.attr('data-entity-id'),
                    groupData = parseGroupId(groupId),
                    $checkboxes = $parentRow.find(':checkbox'),
                    checkboxStates = self._getCheckboxStates($checkboxes);


                var request = self._dataSource.removePermissions(groupData);

                self._spinWhilePending($this, request);
                self._updateErrors($this, request);

                request
                    .done(function() {
                        self._numLoaded--;
                        // remove from addedEntities
                        self._addedEntities = _.filter(self._addedEntities, function(entity) {
                            var idMatches = createGroupId(entity[self._entityType].name, entity['directory-id']) === groupId;
                            if (idMatches && !entity.loaded) {
                                self._numLoaded++;
                            }
                            return !idMatches;
                        });

                        if (!$parentRow.siblings().length && !self._$loadMore.is(":visible")) {
                            var $noResultsInner = self._$noResults.find('div');

                            $noResultsInner.css('opacity', 0.0);
                            self._$noResults.show();
                            $noResultsInner.animate({'opacity': 1.0}, 500);
                        }

                        $parentRow.remove();
                    })
                    .fail(function(){
                        //revert to old permission level
                        self._restoreCheckboxStates($checkboxes, checkboxStates);
                    });

                e.preventDefault();
                return false;
            });
    };

    PermissionTable.prototype._initLoadMoreButton = function(e) {
        var self = this;

        this._$loadMore.click(function(e) {
            self._loadItems();
            e.preventDefault();
        });
    };

    PermissionTable.prototype._renderRow = function(entity, currentUserHighestPerm, isAdded) {
        var self = this;
        var grantedPermission = entity.permission;
        //Added users have no explicit granted perms - choose the last perm, the implicit perm
        var grantedPermissionIndex = _.isUndefined(grantedPermission) ? self._permissions.length - 1 : _.indexOf(this._permissionIds, grantedPermission);
        var currentUserHighestPermIndex = _.indexOf(this._permissions, currentUserHighestPerm);
        //This entity has a higher perm than the current user, their perms are unmodifiable
        var privilegedEntity = grantedPermissionIndex < currentUserHighestPermIndex;
        //The i18n permission name
        var grantedPermissionName = self._permissionNames[grantedPermissionIndex];
        return this._rowTemplate({
            entity : {name: printableGroupName(entity), id: createGroupId(entity[self._entityType + '-name'], entity['directory-id'])},
            entityPermissions :_.map(this._permissionIds, function(displayPermission, index, displayPermissions) {
                var permissionName = self._permissionNames[index];
                var isGranted = grantedPermissionIndex === index;
                //This privilege is higher than that of the current user
                var isPrivileged = index < currentUserHighestPermIndex;
                var isInherited = _.any(displayPermissions.slice(0, index), function(inheritingPermission, index) {
                    return index === grantedPermissionIndex;
                });
                return {
                    name : displayPermission,
                    granted : isGranted,
                    inherited : isInherited,
                    privileged : isPrivileged, //disabled if current user's highest perms not sufficient
                    tooltip : (function() {
                        if (privilegedEntity) {
                            return '';
                        } else if (isPrivileged && !isGranted) {
                            if (self._isEntityCurrentUser(entity)) {
                                return self._text.cantGrantSelfHigherPerms(permissionName);
                            } else {
                                return self._text.cantGrantHigherPerms(permissionName);
                            }
                        } else if (isInherited) {
                            return self._text.inheritedPerm;
                        } else if (index == self._permissions.length - 1) {
                            return self._text.implicitPerm;
                        } else {
                            return '';
                        }
                    }())
                };
            }),
            tooltip: privilegedEntity ? self._text.cantRevokeHigherPerms(grantedPermissionName) : '',
            showAddedLozenge : isAdded,
            showRemovePermsButton : isAdded || (grantedPermissionIndex >= currentUserHighestPermIndex),
            linkToEntities : true
        });
    };

    PermissionTable.prototype._loadItems = function() {
        var self = this;
        this._$spinner.spin('small');

        if (!this._numLoaded) {
            self._$tbody.empty();
            self._$noResults.hide();
        }

        self._dataSource.getMembers({
            start: self._numLoaded,
            limit: self._pageSize
        }).done(function(data) {
                if (self.opts.preProcessMembers) {
                    data = self.opts.preProcessMembers(data, self._entityType);
                }
                self._$spinner.spinStop();

                self._$loadMore.toggleClass('hidden disabled', data['last-page']);

                if (data.results.length) {
                    self._$noResults.hide();
                } else if (!data.start && !self._addedEntities.length) {
                    // There are now no entities, show the noResults
                    self._$noResults.show();
                }

                self._numLoaded += data.results.length;
                // pluck out any of the added entities since we've moved them to the top.
                var addedEntityIds = _.chain(self._addedEntities)
                    .pluck(self._entityType)
                    .map(function(group){
                        return createGroupId(group['group-name'], group['directory-id'])
                    })
                    .value();

                var addedRows = [];
                var values = _.chain(data.results)
                    .filter(function(entity) {
                        var addedEntityIndex = $.inArray(entity[self._entityType + "-id"], addedEntityIds);
                        if (addedEntityIndex !== -1) {
                            addedRows.push(entity);
                            self._addedEntities[addedEntityIndex].loaded = true;
                        }
                        return addedEntityIndex === -1;
                    }).value();

                // if we're starting fresh, render the newly added entities at the top.
                var allRows = "";
                if (self._addedEntities.length) {
                    allRows += _.reduce(addedRows, function(memo, item) {
                        return memo + self._renderRow(item, self._currentUserHighestPerm, true);
                    }, '');
                }

                if (values.length) {
                    allRows += _.reduce(values, function(memo, item) {
                        return memo + self._renderRow(item, self._currentUserHighestPerm);
                    }, '');
                }

                self._$tbody.append(allRows);

                self._$noResults.find("div").show();
            });

    };

    PermissionTable.prototype.refresh = function(hardRefresh) {
        // If it's a hard refresh, ignore the newly added entities
        if (hardRefresh) {
            this._addedEntities = [];
        }
        this._numLoaded = 0;
        _.each(this._addedEntities, function(entity) {
            entity.loaded = false;
        });
        this._loadItems();
    };
    Crowd.PermissionTable = PermissionTable;
})(AJS.$, _, AJS.$.ajax, window.Crowd = window.Crowd || {});
