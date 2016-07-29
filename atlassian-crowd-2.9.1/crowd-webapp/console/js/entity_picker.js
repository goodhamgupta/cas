var CROWD_PICKER = function ($) {
    var searchStringVal, activeVal, resultsPerPageVal;

    // Post the search form according to URL provided
    function postFormAndBindElements(URL, actionButtonName) {
        $.post(URL, {
            searchString: searchStringVal,
            activeFlag: activeVal,
            resultsPerPage: resultsPerPageVal
        }, function(data) {
            $("#results-table").html(data);
            bindElements(actionButtonName);
            $("button:contains('" + actionButtonName + "')").prop("disabled", true);
        });
    }

    function bindElements(actionButtonName) {
        var actionButton = $("button:contains('" + actionButtonName + "')");
        var allItems = $("input:checkbox[name=selectedEntityNames]");

        // Clicking on an individual checkbox
        allItems.click(function() {
            // Switch the 'check all' checkbox based on the result state
            $("#selectAllRelations").prop("checked", allItems.not(":checked").length == 0);

            actionButton.prop("disabled", !allItems.is(":checked"));

        });

        // Clicking on the 'check all' checkbox
        $("#selectAllRelations").click(function() {
            var isCheckAll = $(this).prop("checked");

            allItems.each(function() {$(this).prop("checked", isCheckAll)});
            actionButton.prop("disabled", !isCheckAll);
        });
    }

    // When the search form is submitted pass through form parameters to specified searchURL action
    function attachSearchAndAction(searchURL, actionButtonName) {
        $("#browseentities").submit(function() {
            searchStringVal = $("#searchString").val();
            activeVal = $("#activeFlag").find(":selected").val();
            resultsPerPageVal = parseInt($("#resultsPerPage").find(":selected").val(), 10);

            postFormAndBindElements(searchURL, actionButtonName);

            return false;
        });
    }

    // Create the list of selected entities and goto the action URL
    function attachActionButton(actionURL, actionButtonName) {
        $("button:contains('" + actionButtonName + "')").click(function() {
            $("#selectentities")
                .prop("action", actionURL)
                .submit();
        });
    }

    return {
        attachPicker : function(buttonId, title, searchURL, actionName, actionURL, viewPickerURL, loginURL, initialMessage, finalURL) {
            $("#" + buttonId).click(function() {
                $.get(loginURL, function(data) {
                    if (data == "loggedin") {
                        // Start creating the dialog
                        var popup = new AJS.Dialog(800, 600);
                        popup.addHeader(title);
                        popup.addPanel(title, title);

                        $.get(viewPickerURL, {
                            initialMessage: initialMessage
                        }, function(data) {
                            popup.getCurrentPanel().html(data);

                            attachSearchAndAction(searchURL, actionName);
                            attachActionButton(actionURL, actionName);
                        });

                        popup.addSubmit(actionName);

                        $("button:contains('"+actionName+"')").prop("disabled", true);

                        popup.addCancel(AJS.I18n.getText("picker.close.label"), function (dialog) {
                            dialog.remove();
                        });

                        popup.show();
                    } else {
                        window.location = finalURL;
                    }
                });
            });
        }
    };
}(AJS.$);
