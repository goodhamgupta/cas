<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="/struts-tags" prefix="ww" %>
<html>
<head>
    <title><ww:property value="getText('menu.addapplication.label')"/></title>
    <meta name="section" content="applications"/>
    <meta name="pagename" content="add"/>
    <meta name="help.url" content="<ww:property value="getText('help.application.add')"/>"/>
    <script>
        (function ($) {
            function addGroupToDirectory() {
                var directoryId = $(this).data('directory-id');
                var selectListID = 'addgrouptodirectory-' + directoryId;
                if (selectListID != null) {
                    var form = document.addgrouptodirectory;
                    form.directoryGroup.value = directoryId + '-' + document.getElementById(selectListID).value;
                    form.submit();
                }
            }

            function hideShowGroupSelection(directoryID) {
                var groupselectionelement = document.getElementById("groupselection-" + directoryID);
                var groupselectioncheckbox = document.getElementById("<ww:property value="@com.atlassian.crowd.console.action.application.AddApplicationAuthorisationDetails@ALLOW_ALL_TO_AUTHENTICATE_FOR_DIRECTORY"/>"+directoryID);

                groupselectionelement && (groupselectionelement.style.display = (groupselectioncheckbox.checked ? 'none' : 'block'));
            }

            function hideShowAllGroupSelection() {
                var directoryIds = [<ww:iterator value="configuration.directoryids" status="status"><ww:property/><ww:if test="!#status.last">,</ww:if></ww:iterator>];

                for (var i = 0; i < directoryIds.length; i++) {
                    hideShowGroupSelection(directoryIds[i]);
                }
            }

            $(document)
                    .on('click', '.add-group', addGroupToDirectory)
                    .on('click', '.allow-all', function () { hideShowGroupSelection($(this).data('directory-id')); });

            $(hideShowAllGroupSelection);
        }(AJS.$));
    </script>
</head>
<body>

<ww:set name="progressTracker">
    <ww:component template="progress-tracker.jsp">
        <ww:param name="steps" value="progressSteps" />
    </ww:component>
</ww:set>

<ww:component template="header.jsp">
    <ww:param name="mainContent">
        <h2><ww:property value="getText('menu.addapplication.label')"/> - <ww:property value="name"/></h2>
    </ww:param>
    <ww:param name="actionsContent" value="#progressTracker" />
</ww:component>

<ww:set name="formContent">
    <p><ww:text name="application.authorisation.description"><ww:param name="0">'<ww:property value="configuration.name"/>'</ww:param></ww:text></p>

    <ww:iterator value="directories">

        <ww:set name="directoryID" value="id"/>
        <ww:set name="checkboxName"><ww:property value="@com.atlassian.crowd.console.action.application.AddApplicationAuthorisationDetails@ALLOW_ALL_TO_AUTHENTICATE_FOR_DIRECTORY"/><ww:property value="#directoryID"/></ww:set>

        <h3><ww:text name="directory.label"/>&nbsp;&ndash;&nbsp;<ww:property value="name"/></h3>

        <ww:checkbox fieldValue="true">
            <ww:param name="name" value="#checkboxName"/>
            <ww:param name="label" value="getText('application.authorisation.allow.all.label')"/>
            <ww:param name="description">
                <ww:text name="application.authorisation.allow.all.description"><ww:param name="0">'<ww:property value="configuration.name"/>'</ww:param></ww:text>
            </ww:param>
            <ww:param name="nameValue" value="isAllowAllForDirectory(#directoryID)" />
            <ww:param name="cssClass" value="'allow-all'" />
            <ww:param name="dataAttributes" value="#@java.util.LinkedHashMap@{'directory-id': #directoryID}" />
        </ww:checkbox>

        <ww:set name="selectedgroups" value="getSelectedGroupsForDirectory(#directoryID)"/>
        <ww:set name="unsubscribedgroups" value="getUnsubscribedGroupsForDirectory(#directoryID)"/>
        <ww:if test="!#selectedgroups.empty || !#unsubscribedgroups.empty">
            <div id="groupselection-<ww:property value="#directoryID"/>">
                <ww:if test="!#selectedgroups.empty">
                    <fieldset class="group">
                        <legend><span><ww:text name="application.groups.authorised.label"/></span></legend>
                        <div class="field-group" id="subscribed-group-<ww:property value="#directoryID"/>">
                            <ol class="selected-groups">
                                <ww:iterator value="#selectedgroups" status="status">
                                    <li>
                                        <ww:property/>
                                        <a href="<ww:url namespace="/console/secure/application" action="addapplicationauthorisationdetails" method="removeGroup" includeParams="none"><ww:param name="groupName"><ww:property/></ww:param><ww:param name="directoryID" value="#directoryID"/></ww:url>" title="<ww:text name="application.groups.remove.tooltip"><ww:param name="0"><ww:property /></ww:param></ww:text>">
                                            (<ww:text name="remove.lowercase.label"/>)
                                        </a>
                                    </li>
                                </ww:iterator>
                            </ol>
                        </div>
                    </fieldset>
                </ww:if>
                <ww:if test="!#unsubscribedgroups.empty">
                    <ww:select list="getUnsubscribedGroupsForDirectory(#directoryID)" listKey="toString()" listValue="toString()">
                        <ww:param name="name">addgrouptodirectory-<ww:property value="#directoryID"/></ww:param>
                        <ww:param name="label" value="getText('application.groups.label')"/>
                        <ww:param name="headerKey" value="getText('selectdirectory.label')"/>
                        <ww:param name="headerValue" value="getText('selectdirectory.label')"/>
                        <ww:param name="fieldAfter">
                            <input id="add-group-<ww:property value="#directoryID"/>" type="button" value="Add Group" class="aui-button add-group" data-directory-id="<ww:property value="#directoryID"/>" />
                        </ww:param>
                    </ww:select>
                </ww:if>
            </div>
        </ww:if>
    </ww:iterator>
</ww:set>
<ww:component template="form.jsp">
    <ww:param name="action"><ww:url namespace="/console/secure/application" action="addapplicationauthorisationdetails" method="completeStep" includeParams="none" /></ww:param>
    <ww:param name="cancelUri"><ww:url namespace="/console/secure/application" action="addapplicationdetails" method="cancel" /></ww:param>
    <ww:param name="submitLabel" value="getText('next.label')" />
    <ww:param name="content" value="#formContent" />
</ww:component>

<form name="addgrouptodirectory" method="post" action="<ww:url namespace="/console/secure/application" action="addapplicationauthorisationdetails" method="addGroupToDirectory" includeParams="none"/>">
    <input type="hidden" name="directoryGroup"/>
</form>

</body>
</html>
