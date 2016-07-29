(function ($) {

    //Ordered list of permissions available.
    var permissions = [
        {permission: 'SYS_ADMIN', name: "Sysadmin", i18nName: AJS.I18n.getText('crowd.groups.sysadmin')},
        {permission: 'ADMIN', name: "Admin", i18nName: AJS.I18n.getText('crowd.groups.admin')}
    ];
    var container;

    function init() {
        container = $('#group-data');
        drawTable();
        populateTable();
    }

    function drawTable() {
        var table = $(crowd.permissionTable({
            permissionDataList: permissions,
            grantablePermissionDataList: permissions,
            noResultsText: AJS.I18n.getText('crowd.groups.nogroups')
        }));
        container.append(table);
    }

    function populateTable() {
        new Crowd.PermissionTable('#group-permissions-table', permissions, 'Sysadmin');
    }

    $(init);
})(AJS.$);
