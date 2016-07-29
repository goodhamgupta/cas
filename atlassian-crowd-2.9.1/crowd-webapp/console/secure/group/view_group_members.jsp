<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="/struts-tags" prefix="ww" %>
<%@ taglib uri="/WEB-INF/crowd.tld" prefix="cwd" %>
<html>
<head>
    <title><ww:property value="getText('menu.viewgroup.label')"/></title>
    <meta name="section" content="groups"/>
    <meta name="pagename" content="viewgroupmembers" />
    <meta name="help.url" content="<ww:property value="getText('help.group.view.users')"/>"/>
    <ww:property value="webResourceManager.requireResource('crowd.web.resources:entity-picker')"/>
    <script>
        AJS.$(function(){
            CROWD_PICKER.attachPicker("addUsers", "<ww:property value="getText('picker.addusers.label')"/>",
                    "<ww:url namespace="/console/secure/pickers" action="searchPicker" method="getUserNonMembersOfGroup" includeParams="none" escapeAmp="false"><ww:param name="directoryID" value="directoryID"/><ww:param name="entityName" value="groupName"/></ww:url>",
                    "<ww:property value="getText('picker.addselected.users.label')"/>",
                    "<ww:url namespace="/console/secure/group" action="updatemembers" method="addUsers" includeParams="none" escapeAmp="false"><ww:param name="directoryID" value="directoryID"/><ww:param name="entityName" value="groupName"/></ww:url>",
                    "<ww:url namespace="/console/secure/pickers" action="displayPicker" includeParams="none" />",
                    "<ww:url namespace="/console/secure/pickers" action="checkLoginStatus" includeParams="none" />",
                    "<ww:property value="getText('picker.addusers.start.message')"/>",
                    "<ww:url namespace="/console/secure/group" action="viewmembers" includeParams="none" escapeAmp="false"><ww:param name="directoryID" value="directoryID"/><ww:param name="groupName" value="groupName"/></ww:url>");

            CROWD_PICKER.attachPicker("removeUsers", "<ww:property value="getText('picker.removeusers.label')"/>",
                    "<ww:url namespace="/console/secure/pickers" action="searchPicker" method="getUserMembersOfGroup" includeParams="none" escapeAmp="false"><ww:param name="directoryID" value="directoryID"/><ww:param name="entityName" value="groupName"/></ww:url>",
                    "<ww:property value="getText('picker.removeselected.users.label')"/>",
                    "<ww:url namespace="/console/secure/group" action="updatemembers" method="removeUsers" includeParams="none" escapeAmp="false"><ww:param name="directoryID" value="directoryID"/><ww:param name="entityName" value="groupName"/></ww:url>",
                    "<ww:url namespace="/console/secure/pickers" action="displayPicker" includeParams="none" />",
                    "<ww:url namespace="/console/secure/pickers" action="checkLoginStatus" includeParams="none" />",
                    "<ww:property value="getText('picker.removeusers.start.message')"/>",
                    "<ww:url namespace="/console/secure/group" action="viewmembers" includeParams="none" escapeAmp="false"><ww:param name="directoryID" value="directoryID"/><ww:param name="groupName" value="groupName"/></ww:url>");


            CROWD_PICKER.attachPicker("addGroups", "<ww:property value="getText('picker.addgroups.label')"/>",
                    "<ww:url namespace="/console/secure/pickers" action="searchPicker" method="getGroupNonMembersOfGroup" includeParams="none" escapeAmp="false"><ww:param name="directoryID" value="directoryID"/><ww:param name="entityName" value="groupName"/></ww:url>",
                    "<ww:property value="getText('picker.addselected.groups.label')"/>",
                    "<ww:url namespace="/console/secure/group" action="updatemembers" method="addGroups" includeParams="none" escapeAmp="false"><ww:param name="directoryID" value="directoryID"/><ww:param name="entityName" value="groupName"/></ww:url>",
                    "<ww:url namespace="/console/secure/pickers" action="displayPicker" includeParams="none" />",
                    "<ww:url namespace="/console/secure/pickers" action="checkLoginStatus" includeParams="none" />",
                    "<ww:property value="getText('picker.addgroups.start.message')"/>",
                    "<ww:url namespace="/console/secure/group" action="viewmembers" includeParams="none" escapeAmp="false"><ww:param name="directoryID" value="directoryID"/><ww:param name="groupName" value="groupName"/></ww:url>");

            CROWD_PICKER.attachPicker("removeGroups", "<ww:property value="getText('picker.removegroups.label')"/>",
                    "<ww:url namespace="/console/secure/pickers" action="searchPicker" method="getGroupMembersOfGroup" includeParams="none" escapeAmp="false"><ww:param name="directoryID" value="directoryID"/><ww:param name="entityName" value="groupName"/></ww:url>",
                    "<ww:property value="getText('picker.removeselected.groups.label')"/>",
                    "<ww:url namespace="/console/secure/group" action="updatemembers" method="removeGroups" includeParams="none" escapeAmp="false"><ww:param name="directoryID" value="directoryID"/><ww:param name="entityName" value="groupName"/></ww:url>",
                    "<ww:url namespace="/console/secure/pickers" action="displayPicker" includeParams="none" />",
                    "<ww:url namespace="/console/secure/pickers" action="checkLoginStatus" includeParams="none" />",
                    "<ww:property value="getText('picker.removegroups.start.message')"/>",
                    "<ww:url namespace="/console/secure/group" action="viewmembers" includeParams="none" escapeAmp="false"><ww:param name="directoryID" value="directoryID"/><ww:param name="groupName" value="groupName"/></ww:url>");
        });
    </script>
</head>
<body>
<h2><ww:property value="getText('menu.viewgroup.label')"/>&nbsp;&ndash;&nbsp;<ww:property value="groupName"/></h2>

<div class="aui-tabs horizontal-tabs aui-tabs-disabled">
    <ul class="tabs-menu">
        <li class="menu-item">
            <a href="<ww:url action="view" namespace="/console/secure/group" method="default" includeParams="none"><ww:param name="directoryID" value="directoryID"/><ww:param name="name" value="groupName" /> </ww:url>">
                <ww:property value="getText('menu.details.label')"/>
            </a>
        </li>
        <li class="menu-item active-tab">
            <a><ww:property value="getText('group.directmembers.label')"/></a>
        </li>
        <ww:if test="supportsNestedGroups">
            <li class="menu-item">
                <a id="view-group-nested-principals" href="<ww:url action="viewnestedusers" namespace="/console/secure/group" includeParams="none" ><ww:param name="directoryID" value="directoryID"/><ww:param name="groupName" value="groupName"/></ww:url>">
                    <ww:property value="getText('group.nestedmembers.label')"/>
                </a>
            </li>
        </ww:if>
    </ul>
    <div class="tabs-pane active-pane">

        <ww:set name="formContent">
            <ww:if test="!hasUpdateGroupPermission()">
                <cwd:soy moduleKey="com.atlassian.auiplugin:aui-experimental-soy-templates" template="aui.message.info">
                    <ww:param name="content" value="getText('group.modify.disabled')" />
                </cwd:soy>
            </ww:if>
            <ww:if test="preventingLockout == true">
                <cwd:soy moduleKey="com.atlassian.auiplugin:aui-experimental-soy-templates" template="aui.message.error">
                    <ww:param name="content">
                        <ww:text name="preventlockout.removeusersfromgroup.label">
                            <ww:param name="0"><ww:property value="remoteUser.name"/></ww:param>
                            <ww:param name="1"><ww:property value="groupName"/></ww:param>
                        </ww:text>
                    </ww:param>
                </cwd:soy>
            </ww:if>
            <%--DIRECT SUBGROUPS--%>

            <ww:if test="supportsNestedGroups">
                <h3><ww:text name="group.groupmembers.label"/></h3>
                <ww:if test="!subGroups.empty">
                    <table id="view-group-groups" class="members-table aui">
                        <thead>
                            <tr>
                                <th width="30%"><ww:property value="getText('group.name')"/></th>
                                <th width="60%"><ww:property value="getText('group.description.label')"/></th>
                                <th width="10%"><ww:property value="getText('group.active.label')"/></th>
                            </tr>
                        </thead>
                        <ww:iterator value="subGroups" status="rowstatus">
                            <tr>
                                <td>
                                    <a href="<ww:url namespace="/console/secure/group" action="view" method="default" includeParams="none"><ww:param name="name" value="name" /><ww:param name="directoryID" value="[1].directoryID" /></ww:url>">
                                        <ww:property value="name"/>
                                    </a>
                                </td>
                                <td><ww:property value="description"/></td>
                                <td><ww:property value="active"/></td>
                            </tr>
                        </ww:iterator>
                    </table>
                </ww:if>
                <ww:else>
                    <p>
                        <ww:text name="viewprincipals.group.nogroups.assigned">
                            <ww:param><ww:property value="groupName"/></ww:param>
                        </ww:text>
                    </p>
                </ww:else>

                <ww:if test="hasUpdateGroupPermission()">
                    <p>
                        <cwd:soy moduleKey="com.atlassian.auiplugin:aui-experimental-soy-templates" template="aui.buttons.button" id="addGroups">
                            <ww:param name="tagName" value="'input'" />
                            <ww:param name="text" value="getText('picker.addgroups.label')" />
                        </cwd:soy>
                        <ww:if test="!subGroups.empty">
                            <cwd:soy moduleKey="com.atlassian.auiplugin:aui-experimental-soy-templates" template="aui.buttons.button" id="removeGroups">
                                <ww:param name="tagName" value="'input'" />
                                <ww:param name="text" value="getText('picker.removegroups.label')" />
                            </cwd:soy>
                        </ww:if>
                    </p>
                </ww:if>
            </ww:if>


            <%--DIRECT USER MEMBERS --%>
            <h3><ww:text name="group.usermembers.label"/></h3>
            <ww:if test="!principals.empty">
                <table id="view-group-users" class="members-table aui">
                    <thead>
                        <tr>
                            <th width="30%"><ww:text name="principal.name.label"/></th>
                            <th width="60%"><ww:text name="principal.email.label"/></th>
                            <th width="10%"><ww:text name="principal.active.label"/></th>
                        </tr>
                    </thead>
                    <ww:iterator value="principals" status="rowstatus">
                        <tr>
                            <td>
                                <a id="view-principal" href="<ww:url namespace="/console/secure/user" action="view" method="default" includeParams="none"><ww:param name="name" value="name" /><ww:param name="directoryID" value="[1].directoryID" /></ww:url>">
                                    <ww:property value="name"/>
                                </a>
                            </td>
                            <td><ww:property value="emailAddress"/></td>
                            <td><ww:property value="active"/></td>
                        </tr>
                    </ww:iterator>
                </table>
            </ww:if>
            <ww:else>
                <p>
                    <ww:text name="viewprincipals.group.noprincipals.assigned">
                        <ww:param><ww:property value="groupName"/></ww:param>
                    </ww:text>
                </p>
            </ww:else>

            <ww:if test="hasUpdateGroupPermission()">
                <p>
                    <cwd:soy moduleKey="com.atlassian.auiplugin:aui-experimental-soy-templates" template="aui.buttons.button" id="addUsers">
                        <ww:param name="tagName" value="'input'" />
                        <ww:param name="text" value="getText('picker.addusers.label')" />
                    </cwd:soy>
                    <ww:if test="!principals.empty">
                        <cwd:soy moduleKey="com.atlassian.auiplugin:aui-experimental-soy-templates" template="aui.buttons.button" id="removeUsers">
                            <ww:param name="tagName" value="'input'" />
                            <ww:param name="text" value="getText('picker.removeusers.label')" />
                        </cwd:soy>
                    </ww:if>
                </p>
            </ww:if>
        </ww:set>
        <ww:component template="form.jsp" id="groupsForm">
            <ww:param name="action"><ww:url action="viewmembers" namespace="/console/secure/group" includeParams="none"><ww:param name="directoryID" value="directoryID"/><ww:param name="groupName" value="name"/></ww:url></ww:param>
            <ww:param name="content" value="#formContent" />
            <ww:param name="includeSubmitButton" value="false"/>
        </ww:component>
    </div>
</div>

</body>
</html>
