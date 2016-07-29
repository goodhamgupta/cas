<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="/struts-tags" prefix="ww" %>
<html>
<head>
    <title>
        <ww:text name="menu.viewapplication.label"/>
    </title>
    <meta name="section" content="applications"/>
    <meta name="pagename" content="view"/>
    <meta name="help.url" content="<ww:text name="help.application.view.permissions"/>"/>
    <script>
        (function ($) {
            $(document).on('change', '#directoryId', function () {
                var $this = $(this);
                $this.closest('form')
                        .attr('action', '<ww:url namespace="/console/secure/application" action="viewpermissions" method="doDefault" includeParams="none" />')
                        .submit();
            });
        }(AJS.$));
    </script>
</head>
<body>

<h2 id="application-name">
    <img class="application-icon" title="<ww:property value="getImageTitle(application.active, application.type)"/>" alt="<ww:property value="getImageTitle(application.active, application.type)"/>" src="<ww:property value="getImageLocation(application.active, application.type)" />"/>
    <ww:property value="application.name"/>
</h2>

<div class="aui-tabs horizontal-tabs aui-tabs-disabled">

    <ww:component template="application_tab_headers.jsp">
        <ww:param name="pagekey" value="'application-permissions'"/>
    </ww:component>

    <div class="tabs-pane active-pane" id="tab5">
        <p><ww:property value="getText('application.permission.text')"/></p>
        <ww:set name="formContent">
            <ww:if test="ID > -1">
                <ww:select name="directoryId" list="application.directoryMappings" listKey="directory.id" listValue="directory.name">
                    <ww:param name="label" value="'Directories'"/>
                    <ww:param name="emptyOption" value="'Select a directory'" />
                </ww:select>
            </ww:if>

            <fieldset class="group">
                <legend><span>Permissions</span></legend>

                <ww:if test="directoryId == null || directoryId == ''">
                    <div class="field-group">
                        <div class="field-value">You need to select a directory.</div>
                    </div>
                </ww:if>
                <ww:else>
                    <ww:set name="disabledglobally" value="permissionEnabledGlobally(@com.atlassian.crowd.embedded.api.OperationType@CREATE_GROUP) != true"/>
                    <ww:checkbox fieldValue="true">
                        <ww:param name="name"><ww:property value="@com.atlassian.crowd.embedded.api.OperationType@CREATE_GROUP.name"/></ww:param>
                        <ww:param name="label">
                            <ww:property value="getText('permission.addgroup.label')"/>
                            <ww:if test="disabledglobally">(<ww:text name="application.permission.disabledglobally"/>)</ww:if>
                        </ww:param>
                        <ww:param name="description" value="getText('permission.addgroup.description')" />
                        <ww:param name="group" value="false"/>
                        <ww:param name="disabled" value="disabledglobally"/>
                        <ww:param name="selectedValue" value="hasPermission(@com.atlassian.crowd.embedded.api.OperationType@CREATE_GROUP)"/>
                    </ww:checkbox>

                    <ww:set name="disabledglobally" value="permissionEnabledGlobally(@com.atlassian.crowd.embedded.api.OperationType@CREATE_USER) != true"/>
                    <ww:checkbox fieldValue="true">
                        <ww:param name="name"><ww:property value="@com.atlassian.crowd.embedded.api.OperationType@CREATE_USER.name"/></ww:param>
                        <ww:param name="label">
                            <ww:property value="getText('permission.addprincipal.label')"/>
                            <ww:if test="disabledglobally">(<ww:text name="application.permission.disabledglobally"/>)</ww:if>
                        </ww:param>
                        <ww:param name="description" value="getText('permission.addprincipal.description')" />
                        <ww:param name="group" value="false"/>
                        <ww:param name="disabled" value="disabledglobally"/>
                        <ww:param name="selectedValue" value="hasPermission(@com.atlassian.crowd.embedded.api.OperationType@CREATE_USER)"/>
                    </ww:checkbox>

                    <ww:set name="disabledglobally" value="permissionEnabledGlobally(@com.atlassian.crowd.embedded.api.OperationType@UPDATE_GROUP) != true"/>
                    <ww:checkbox fieldValue="true">
                        <ww:param name="name"><ww:property value="@com.atlassian.crowd.embedded.api.OperationType@UPDATE_GROUP.name"/></ww:param>
                        <ww:param name="label">
                            <ww:property value="getText('permission.modifygroup.label')"/>
                            <ww:if test="disabledglobally">(<ww:text name="application.permission.disabledglobally"/>)</ww:if>
                        </ww:param>
                        <ww:param name="description" value="getText('permission.modifygroup.description')" />
                        <ww:param name="group" value="false"/>
                        <ww:param name="disabled" value="disabledglobally"/>
                        <ww:param name="selectedValue" value="hasPermission(@com.atlassian.crowd.embedded.api.OperationType@UPDATE_GROUP)"/>
                    </ww:checkbox>

                    <ww:set name="disabledglobally" value="permissionEnabledGlobally(@com.atlassian.crowd.embedded.api.OperationType@UPDATE_USER) != true"/>
                    <ww:checkbox fieldValue="true">
                        <ww:param name="name"><ww:property value="@com.atlassian.crowd.embedded.api.OperationType@UPDATE_USER.name"/></ww:param>
                        <ww:param name="label">
                            <ww:property value="getText('permission.modifyprincipal.label')"/>
                            <ww:if test="disabledglobally">(<ww:text name="application.permission.disabledglobally"/>)</ww:if>
                        </ww:param>
                        <ww:param name="description" value="getText('permission.modifyprincipal.description')" />
                        <ww:param name="group" value="false"/>
                        <ww:param name="disabled" value="disabledglobally"/>
                        <ww:param name="selectedValue" value="hasPermission(@com.atlassian.crowd.embedded.api.OperationType@UPDATE_USER)"/>
                    </ww:checkbox>

                    <ww:set name="disabledglobally" value="permissionEnabledGlobally(@com.atlassian.crowd.embedded.api.OperationType@UPDATE_GROUP_ATTRIBUTE) != true"/>
                    <ww:checkbox fieldValue="true">
                        <ww:param name="name"><ww:property value="@com.atlassian.crowd.embedded.api.OperationType@UPDATE_GROUP_ATTRIBUTE.name"/></ww:param>
                        <ww:param name="label">
                            <ww:property value="getText('permission.modifygroupattribute.label')"/>
                            <ww:if test="disabledglobally">(<ww:text name="application.permission.disabledglobally"/>)</ww:if>
                        </ww:param>
                        <ww:param name="description" value="getText('permission.modifygroupattribute.description')" />
                        <ww:param name="group" value="false"/>
                        <ww:param name="disabled" value="disabledglobally"/>
                        <ww:param name="selectedValue" value="hasPermission(@com.atlassian.crowd.embedded.api.OperationType@UPDATE_GROUP_ATTRIBUTE)"/>
                    </ww:checkbox>

                    <ww:set name="disabledglobally" value="permissionEnabledGlobally(@com.atlassian.crowd.embedded.api.OperationType@UPDATE_USER_ATTRIBUTE) != true"/>
                    <ww:checkbox fieldValue="true">
                        <ww:param name="name"><ww:property value="@com.atlassian.crowd.embedded.api.OperationType@UPDATE_USER_ATTRIBUTE.name"/></ww:param>
                        <ww:param name="label">
                            <ww:property value="getText('permission.modifyprincipalattribute.label')"/>
                            <ww:if test="disabledglobally">(<ww:text name="application.permission.disabledglobally"/>)</ww:if>
                        </ww:param>
                        <ww:param name="description" value="getText('permission.modifyprincipalattribute.description')" />
                        <ww:param name="group" value="false"/>
                        <ww:param name="disabled" value="disabledglobally"/>
                        <ww:param name="selectedValue" value="hasPermission(@com.atlassian.crowd.embedded.api.OperationType@UPDATE_USER_ATTRIBUTE)"/>
                    </ww:checkbox>

                    <ww:set name="disabledglobally" value="permissionEnabledGlobally(@com.atlassian.crowd.embedded.api.OperationType@DELETE_GROUP) != true"/>
                    <ww:checkbox fieldValue="true">
                        <ww:param name="name"><ww:property value="@com.atlassian.crowd.embedded.api.OperationType@DELETE_GROUP.name"/></ww:param>
                        <ww:param name="label">
                            <ww:property value="getText('permission.removegroup.label')"/>
                            <ww:if test="disabledglobally">(<ww:text name="application.permission.disabledglobally"/>)</ww:if>
                        </ww:param>
                        <ww:param name="description" value="getText('permission.removegroup.description')" />
                        <ww:param name="group" value="false"/>
                        <ww:param name="disabled" value="disabledglobally"/>
                        <ww:param name="selectedValue" value="hasPermission(@com.atlassian.crowd.embedded.api.OperationType@DELETE_GROUP)"/>
                    </ww:checkbox>

                    <ww:set name="disabledglobally" value="permissionEnabledGlobally(@com.atlassian.crowd.embedded.api.OperationType@DELETE_USER) != true"/>
                    <ww:checkbox fieldValue="true">
                        <ww:param name="name"><ww:property value="@com.atlassian.crowd.embedded.api.OperationType@DELETE_USER.name"/></ww:param>
                        <ww:param name="label">
                            <ww:property value="getText('permission.removeprincipal.label')"/>
                            <ww:if test="disabledglobally">(<ww:text name="application.permission.disabledglobally"/>)</ww:if>
                        </ww:param>
                        <ww:param name="description" value="getText('permission.removeprincipal.description')" />
                        <ww:param name="group" value="false"/>
                        <ww:param name="disabled" value="disabledglobally"/>
                        <ww:param name="selectedValue" value="hasPermission(@com.atlassian.crowd.embedded.api.OperationType@DELETE_USER)"/>
                    </ww:checkbox>
                </ww:else>
            </fieldset>
            <input type="hidden" name="ID" value="<ww:property value="ID" />"/>
            <input type="hidden" name="tab" value="4"/>
        </ww:set>
        <ww:component template="form.jsp" id="permissionForm">
            <ww:param name="action"><ww:url namespace="/console/secure/application" action="updatePermissions" method="doUpdate" includeParams="none" /></ww:param>
            <ww:param name="cancelUri"><ww:url namespace="/console/secure/application" action="viewpermissions" method="default" includeParams="none" escapeAmp="false"><ww:param name="ID" value="ID"/><ww:param name="tab" value="4"/></ww:url></ww:param>
            <ww:param name="content" value="#formContent" />
            <ww:param name="submitName" value="'update-permissions'"/>
        </ww:component>
    </div>
</div>
</body>
</html>
