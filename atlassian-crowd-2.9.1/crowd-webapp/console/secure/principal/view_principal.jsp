<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="/struts-tags" prefix="ww" %>
<%@ taglib uri="/WEB-INF/crowd.tld" prefix="cwd" %>
<html>
<head>
    <title><ww:property value="getText('menu.viewprincipal.label')"/></title>
    <meta name="section" content="users"/>
    <meta name="pagename" content="viewuser"/>
    <meta name="help.url" content="<ww:property value="getText('help.user.view.details')"/>"/>
    <ww:property value="webResourceManager.requireResource('crowd.web.resources:entity-picker')"/>
    <script>
        AJS.$(function(){
            CROWD_PICKER.attachPicker("addGroups", "<ww:property value="getText('picker.addgroups.label')"/>",
                    "<ww:url namespace="/console/secure/pickers" action="searchPicker" method="getGroupNonMembershipsOfUser" includeParams="none" escapeAmp="false"><ww:param name="directoryID" value="directoryID"/><ww:param name="entityName" value="name"/></ww:url>",
                    "<ww:property value="getText('picker.addselected.groups.label')"/>",
                    "<ww:url namespace="/console/secure/user" action="updategroups" method="addGroups" includeParams="none" escapeAmp="false"><ww:param name="directoryID" value="directoryID"/><ww:param name="entityName" value="name"/><ww:param name="tab" value="3"/></ww:url>",
                    "<ww:url namespace="/console/secure/pickers" action="displayPicker" includeParams="none" />",
                    "<ww:url namespace="/console/secure/pickers" action="checkLoginStatus" includeParams="none" />",
                    "<ww:property value="getText('picker.addgroups.start.message')"/>",
                    "<ww:url namespace="/console/secure/user" action="view" includeParams="none" escapeAmp="false"><ww:param name="directoryID" value="directoryID"/><ww:param name="name" value="name"/><ww:param name="tab" value="3"/></ww:url>");

            CROWD_PICKER.attachPicker("removeGroups", "<ww:property value="getText('picker.removegroups.label')"/>",
                    "<ww:url namespace="/console/secure/pickers" action="searchPicker" method="getGroupMembershipsOfUser" includeParams="none" escapeAmp="false"><ww:param name="directoryID" value="directoryID"/><ww:param name="entityName" value="name"/></ww:url>",
                    "<ww:property value="getText('picker.removeselected.groups.label')"/>",
                    "<ww:url namespace="/console/secure/user" action="updategroups" method="removeGroups" includeParams="none" escapeAmp="false"><ww:param name="directoryID" value="directoryID"/><ww:param name="entityName" value="name"/><ww:param name="tab" value="3"/></ww:url>",
                    "<ww:url namespace="/console/secure/pickers" action="displayPicker" includeParams="none" />",
                    "<ww:url namespace="/console/secure/pickers" action="checkLoginStatus" includeParams="none" />",
                    "<ww:property value="getText('picker.removegroups.start.message')"/>",
                    "<ww:url namespace="/console/secure/user" action="view" includeParams="none" escapeAmp="false"><ww:param name="directoryID" value="directoryID"/><ww:param name="name" value="name"/><ww:param name="tab" value="3"/></ww:url>");
        });

        function addAttribute() {
            var form = document.getElementById('attributesForm');
            form.action = '<ww:url namespace="/console/secure/user" action="updateattributes" method="addAttribute" includeParams="none" />';
            form.submit();
        }

        function removeAlias() {
            var ref = 'alias-appid-' + AJS.$(this).data('id');
            var field = document.getElementById(ref);
            field.value = '';
            var form = document.getElementById('applicationsForm');
            form.submit();
        }

        AJS.$(document).on('tabSelect', '.tabs-menu > li.menu-item > a', function (e, tabData) {
            var helpLinks = [
                '<ww:property value="getText('help.user.view.details')"/>',
                '<ww:property value="getText('help.user.view.attributes')"/>',
                '<ww:property value="getText('help.user.view.groups')"/>',
                '<ww:property value="getText('help.user.view.applications')"/>'
            ];
            setHelpLink(helpLinks[tabData.tab.parent().prevAll().length]);
        }).on('click', '.remove-alias-appid', removeAlias);
    </script>
</head>
<body>

<h2><ww:property value="getText('menu.viewprincipal.label')"/>&nbsp;&ndash;&nbsp;<ww:property value="name"/></h2>

<div class="aui-tabs horizontal-tabs">
    <ul class="tabs-menu">
        <li class="menu-item<ww:if test="tab == 1 || tab == null"> active-tab</ww:if>" id="hreftab1">
            <a id="user-details-tab" href="#tab1"><ww:property value="getText('menu.details.label')"/></a>
        </li>
        <li class="menu-item<ww:if test="tab == 2"> active-tab</ww:if>" id="hreftab2">
            <a id="user-attributes-tab" href="#tab2"><ww:property value="getText('menu.attributes.label')"/></a>
        </li>
        <li class="menu-item<ww:if test="tab == 3"> active-tab</ww:if>" id="hreftab3">
            <a id="user-groups-tab" href="#tab3"><ww:property value="getText('menu.groups.label')"/></a>
        </li>
        <li class="menu-item<ww:if test="tab == 4"> active-tab</ww:if>" id="hreftab4">
            <a id="user-applications-tab" href="#tab4"><ww:property value="getText('menu.applications.label')"/></a>
        </li>
    </ul>

    <div class="tabs-pane<ww:if test="tab == 1 || tab == null"> active-pane</ww:if>" id="tab1">
        <ww:set name="formContent1">
            <ww:textfield name="newName">
                <ww:param name="label" value="getText('principal.name.label')"/>
                <ww:param name="description">
                    <ww:property value="getText('principal.name.description')"/>
                </ww:param>
                <ww:param name="required" value="true"/>
            </ww:textfield>
            <ww:component template="form_row.jsp">
                <ww:param name="label" value="getText('principal.directory.label')" />
                <ww:param name="value">
                    <ww:property value="directory.name"/>&nbsp;&mdash;&nbsp;<ww:property value="directoryImplementationDescriptiveName"/>
                </ww:param>
                <ww:param name="escapeValue" value="false" />
            </ww:component>
            <ww:textfield name="email" size="50">
                <ww:param name="label" value="getText('principal.email.label')"/>
                <ww:param name="type" value="'email'"/>
            </ww:textfield>
            <ww:checkbox name="active" fieldValue="true">
                <ww:param name="label" value="getText('principal.active.label')"/>
            </ww:checkbox>
            <ww:textfield name="firstname">
                <ww:param name="label" value="getText('principal.firstname.label')"/>
            </ww:textfield>
            <ww:textfield name="lastname">
                <ww:param name="label" value="getText('principal.lastname.label')"/>
            </ww:textfield>
            <ww:set name="typeAsString"><ww:property value="directory.type.name()"/></ww:set>

            <ww:if test="#typeAsString == 'DELEGATING'">
                <ww:password name="password">
                    <ww:param name="label" value="getText('password.label')"/>
                    <ww:param name="disabled" value="true"/>
                    <ww:param name="'description'">
                        <ww:property value="getText('principal.editpassword.disabled.description')"/>
                    </ww:param>
                </ww:password>
                <ww:password name="passwordConfirm">
                    <ww:param name="label" value="getText('passwordconfirm.label')"/>
                    <ww:param name="disabled" value="true"/>
                </ww:password>
            </ww:if>
            <ww:else>
                <ww:password name="password">
                    <ww:param name="label" value="getText('password.label')"/>
                    <ww:param name="'description'">
                        <ww:property value="getText('principal.editpassword.description')"/>
                    </ww:param>
                </ww:password>
                <ww:password name="passwordConfirm">
                    <ww:param name="label" value="getText('passwordconfirm.label')"/>
                </ww:password>
            </ww:else>
            <input type="hidden" name="tab" value="1"/>
            <input type="hidden" name="directoryID" value="<ww:property value="directoryID" />"/>
            <input type="hidden" name="name" value="<ww:property value="name" />"/>
            <input type="hidden" name="externalId" value="<ww:property value="externalId" />"/>
        </ww:set>
        <ww:component template="form.jsp" id="updateprincipalForm">
            <ww:param name="action"><ww:url namespace="/console/secure/user" action="update" method="updateGeneral" includeParams="none" /></ww:param>
            <ww:param name="content" value="#formContent1" />
            <ww:param name="cancelUri"><ww:url namespace="/console/secure/user" action="view" method="default" includeParams="none" escapeAmp="false"><ww:param name="directoryID" value="directoryID"/><ww:param name="name" value="name"/><ww:param name="tab" value="1"/></ww:url></ww:param>
            <ww:param name="tabID" value="1"/>
        </ww:component>
    </div>

    <div class="tabs-pane<ww:if test="tab == 2"> active-pane</ww:if>" id="tab2">
        <ww:set name="formContent2">
            <ww:fielderror>
                <ww:param value="%{'attribute'}"/>
            </ww:fielderror>
            <table id="attributesTable" class="aui">
                <thead>
                    <tr>
                        <th width="40%"><ww:property value="getText('attribute.label')"/></th>
                        <th width="40%"><ww:property value="getText('values.label')"/></th>
                        <th width="20%"><ww:property value="getText('browser.action.label')"/></th>
                    </tr>
                </thead>
                <tfoot>
                    <tr>
                        <td>
                            <ww:textfield name="attribute">
                                <ww:param name="inline" value="true"/>
                                <ww:param name="fieldWidth" value="'full-width'"/>
                                <ww:param name="placeholder" value="getText('attribute.label')"/>
                            </ww:textfield>
                        </td>
                        <td>
                            <ww:textfield name="value">
                                <ww:param name="inline" value="true"/>
                                <ww:param name="fieldWidth" value="'full-width'"/>
                                <ww:param name="placeholder" value="getText('value.label')"/>
                            </ww:textfield>
                        </td>
                        <td><input id="add-attribute" type="button" class="aui-button" value="<ww:text name="add.label"/>" onClick="addAttribute();"/></td>
                    </tr>
                </tfoot>
                <ww:iterator value="userAttributes" status="rowstatus">
                    <tr>
                        <td>
                            <pre class="default-font"><ww:property value="key"/></pre>
                            <input type="hidden" name="attributes" value="<ww:property value="key" />"/>
                        </td>
                        <td>
                            <ww:iterator value="value" status="valuestatus">
                                <input type="text" name="<ww:property value="key" /><ww:property value="#valuestatus.count" />" value="<ww:property />" class="text full-width-field"/>
                            </ww:iterator>
                        </td>
                        <td>
                            <a id="remove-<ww:property value="key"/>" class="aui-button aui-button-link" href="<ww:url namespace="/console/secure/user" action="updateattributes" method="removeAttribute" includeParams="none"><ww:param name="name" value="name" /><ww:param name="attribute" value="key" /><ww:param name="directoryID" value="directoryID" /><ww:param name="tab" value="2"/><ww:param name="%{xsrfTokenName}" value="%{xsrfToken}"/></ww:url>" title="<ww:property value="getText('remove.label')"/>">
                                <ww:property value="getText('remove.label')"/>
                            </a>
                        </td>
                    </tr>
                </ww:iterator>
            </table>
            <input type="hidden" name="tab" value="2"/>
            <input type="hidden" name="directoryID" value="<ww:property value="directoryID" />"/>
            <input type="hidden" name="name" value="<ww:property value="name" />"/>
            <input type="hidden" name="externalId" value="<ww:property value="externalId" />"/>
        </ww:set>
        <ww:component template="form.jsp" id="attributesForm">
            <ww:param name="action"><ww:url namespace="/console/secure/user" action="updateattributes" method="updateAttributes" includeParams="none" /></ww:param>
            <ww:param name="content" value="#formContent2" />
            <ww:param name="cancelUri">
                <ww:if test="!userAttributes.isEmpty()">
                    <ww:url namespace="/console/secure/user" action="view" method="default" includeParams="none" escapeAmp="false"><ww:param name="directoryID" value="directoryID"/><ww:param name="name" value="name"/><ww:param name="tab" value="2" /></ww:url>
                </ww:if>
            </ww:param>
            <ww:param name="includeSubmitButton" value="!userAttributes.isEmpty()"/>
            <ww:param name="isTopLabels" value="true"/>
            <ww:param name="tabID" value="2"/>
        </ww:component>
    </div>

    <div class="tabs-pane<ww:if test="tab == 3"> active-pane</ww:if>" id="tab3">
        <ww:set name="formContent3">
            <ww:if test="!hasUpdateGroupPermission()">
                <cwd:soy moduleKey="com.atlassian.auiplugin:aui-experimental-soy-templates" template="aui.message.info">
                    <ww:param name="content" value="getText('group.modify.disabled')" />
                </cwd:soy>
            </ww:if>
            <ww:if test="preventingLockout == true">
                <cwd:soy moduleKey="com.atlassian.auiplugin:aui-experimental-soy-templates" template="aui.message.error">
                    <ww:param name="content">
                        <ww:text name="preventlockout.removegroupsfromuser.label">
                            <ww:param name="0"><ww:property value="unremovedGroups"/></ww:param>
                            <ww:param name="1"><ww:property value="name"/></ww:param>
                        </ww:text>
                    </ww:param>
                </cwd:soy>
            </ww:if>
            <ww:elseif test="!unremovedGroups.empty">
                <cwd:soy moduleKey="com.atlassian.auiplugin:aui-experimental-soy-templates" template="aui.message.error">
                    <ww:param name="content">
                        <ww:text name="principal.unremovedgroups.label">
                            <ww:param name="0"><ww:property value="unremovedGroups"/></ww:param>
                            <ww:param name="1"><ww:property value="name"/></ww:param>
                        </ww:text>
                    </ww:param>
                </cwd:soy>
            </ww:elseif>

            <ww:if test="groups.size > 0">
                <p><ww:property value="getText('principal.groupmappings.text')"/></p>

                <ww:set name="userName" value="[0].name"/>
                <ww:set name="directory" value="directoryID" />
                <ww:set name="directoryName" value="directory.name" />

                <input type="hidden" name="tab" value="3"/>
                <input type="hidden" name="directoryID" value="<ww:property value="directoryID" />"/>
                <input type="hidden" name="name" value="<ww:property value="name" />"/>
                <input type="hidden" name="externalId" value="<ww:property value="externalId" />"/>

                <table id="groupsTable" class="aui">
                    <thead>
                        <tr>
                            <th width="30%"><ww:property value="getText('browser.group.label')"/></th>
                            <th width="60%"><ww:property value="getText('browser.description.label')"/></th>
                            <th width="10%"><ww:property value="getText('browser.active.label')"/></th>
                        </tr>
                    </thead>
                    <ww:iterator value="groups" status="rowstatus">
                        <tr>
                            <td>
                                <a id="viewgroup-<ww:property value="name" />-<ww:property value="#directoryName" />" href="<ww:url namespace="/console/secure/group" action="view" includeParams="none" ><ww:param name="directoryID" value="#directory" /><ww:param name="directoryID" value="#directory" /><ww:param name="name" value="name" /></ww:url>">
                                    <ww:property value="name"/>
                                </a>
                            </td>
                            <td><ww:property value="description"/></td>
                            <td><ww:property value="active" /></td>
                        </tr>
                    </ww:iterator>
                </table>
            </ww:if>
            <ww:else>
                <p>
                    <ww:text name="principal.nogroupmemberships.text">
                        <ww:param><ww:property value="name"/></ww:param>
                    </ww:text>
                </p>
            </ww:else>

            <ww:if test="hasUpdateGroupPermission()">
                <p>
                    <cwd:soy moduleKey="com.atlassian.auiplugin:aui-experimental-soy-templates" template="aui.buttons.button" id="addGroups">
                        <ww:param name="type" value="groups.size > 0 ? '' : 'primary'" />
                        <ww:param name="tagName" value="'input'" />
                        <ww:param name="text" value="getText('picker.addgroups.label')" />
                    </cwd:soy>
                    <ww:if test="groups.size > 0">
                        <cwd:soy moduleKey="com.atlassian.auiplugin:aui-experimental-soy-templates" template="aui.buttons.button" id="removeGroups">
                            <ww:param name="tagName" value="'input'" />
                            <ww:param name="text" value="getText('picker.removegroups.label')" />
                        </cwd:soy>
                    </ww:if>
                </p>
            </ww:if>
        </ww:set>
        <ww:component template="form.jsp" id="groupsForm">
            <ww:param name="action"><ww:url namespace="/console/secure/user" action="view" includeParams="none" /></ww:param>
            <ww:param name="content" value="#formContent3" />
            <ww:param name="includeSubmitButton" value="false"/>
            <ww:param name="tabID" value="3"/>
        </ww:component>
    </div>

    <div class="tabs-pane<ww:if test="tab == 4"> active-pane</ww:if>" id="tab4">
        <ww:set name="formContent4">
            <p><ww:property value="getText('principal.applications.text')"/></p>

            <table id="applicationsTable" class="aui">
                <thead>
                    <tr>
                        <th width="40%"><ww:property value="getText('browser.application.label')"/></th>
                        <th width="40%"><ww:property value="getText('browser.alias.label')"/></th>
                        <th width="20%"><ww:text name="browser.action.label"/></th>
                    </tr>
                </thead>
                <ww:iterator value="applications" status="rowstatus">
                    <tr>
                        <td>
                            <a id="viewapplication-<ww:property value="top" />-<ww:property value="name" />" href="<ww:url namespace="/console/secure/application" action="viewdetails" includeParams="none" ><ww:param name="ID" value="id" /></ww:url>">
                                <ww:property value="name"/>
                            </a>
                        </td>
                        <td>
                            <ww:if test="!aliasingEnabled">
                                <span style="color: gray;"><ww:text name="alias.disabled.label"/></span>
                            </ww:if>
                            <ww:else>
                                <input id="alias-appid-<ww:property value="id"/>" type="text" name="alias-appid-<ww:property value="id"/>" value="<ww:property value="aliases.get(#rowstatus.index)"/>" class="text"/>
                                <ww:if test="applicationInError.containsKey(id)"><span class="error">*</span></ww:if>
                            </ww:else>
                        </td>
                        <td>
                            <ww:if test="aliasingEnabled">
                                <a id="remove-alias-appid-<ww:property value="id"/>" class="aui-button remove-alias-appid" data-id="<ww:property value="id"/>"><ww:text name="alias.remove.label"/></a>
                            </ww:if>
                        </td>
                    </tr>
                </ww:iterator>
            </table>
            <input type="hidden" name="tab" value="4"/>
            <input type="hidden" name="directoryID" value="<ww:property value="directoryID" />"/>
            <input type="hidden" name="name" value="<ww:property value="name" />"/>
            <input type="hidden" name="externalId" value="<ww:property value="externalId" />"/>
        </ww:set>
        <ww:component template="form.jsp" id="applicationsForm">
            <ww:param name="action"><ww:url namespace="/console/secure/user" action="updatealiases" method="update" includeParams="none" /></ww:param>
            <ww:param name="content" value="#formContent4" />
            <ww:param name="cancelUri">
                <ww:url namespace="/console/secure/user" action="view" method="default" includeParams="none" escapeAmp="false"><ww:param name="directoryID" value="directoryID"/><ww:param name="name" value="name"/><ww:param name="tab" value="4" /></ww:url>
            </ww:param>
            <ww:param name="isTopLabels" value="true"/>
            <ww:param name="tabID" value="4"/>
        </ww:component>
    </div>
</div>
</body>
</html>
