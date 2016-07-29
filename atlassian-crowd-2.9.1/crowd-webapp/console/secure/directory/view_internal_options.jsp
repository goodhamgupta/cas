<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="/struts-tags" prefix="ww" %>
<%@ taglib uri="/WEB-INF/crowd.tld" prefix="cwd" %>
<html>
<head>
    <title>
        <ww:text name="menu.viewdirectory.label">
            <ww:param><ww:property value="directory.name"/></ww:param>
        </ww:text>
    </title>
    <meta name="section" content="directories"/>
    <meta name="pagename" content="view"/>
    <meta name="help.url" content="<ww:text name="help.directory.internal.options"/>"/>
    <ww:property value="webResourceManager.requireResource('crowd.web.resources:entity-picker')"/>
    <script>
        AJS.$(function(){
            CROWD_PICKER.attachPicker("addGroups", "<ww:property value="getText('picker.addgroups.label')"/>",
                    "<ww:url namespace="/console/secure/pickers" action="searchPicker" method="getGroupsExcluding" includeParams="none" escapeAmp="false"><ww:param name="directoryID" value="ID"/></ww:url><ww:property value="exclusionsAsString" escape="false"/>",
                    "<ww:property value="getText('picker.addselected.groups.label')"/>",
                    "<ww:url namespace="/console/secure/directory" action="updateinternaloptions" method="addDefaultGroups" includeParams="none" escapeAmp="false"><ww:param name="ID" value="ID"/></ww:url>",
                    "<ww:url namespace="/console/secure/pickers" action="displayPicker" includeParams="none" />",
                    "<ww:url namespace="/console/secure/pickers" action="checkLoginStatus" includeParams="none" />",
                    "<ww:property value="getText('picker.addgroups.generic.message')"/>",
                    "<ww:url namespace="/console/secure/directory" action="updateinternaloptions" includeParams="none" escapeAmp="false"><ww:param name="ID" value="ID"/></ww:url>");
        });
    </script>
</head>
<body>
<h2>
    <ww:text name="menu.viewdirectory.label">
        <ww:param><ww:property value="directory.name"/></ww:param>
    </ww:text>
</h2>

<div class="aui-tabs horizontal-tabs aui-tabs-disabled">
    <jsp:include page="inc_tabs_internal.jsp">
        <jsp:param name="selectedTab" value="4" />
    </jsp:include>
    <div class="tabs-pane active-pane">
        <ww:set name="formContent">
            <h3><ww:text name="directory.options.autogroupadd.title"/></h3>
            <ww:if test="defaultGroups.empty">
                <p><ww:text name="directory.options.autogroupadd.nogroups.text"/></p>
            </ww:if>
            <ww:else>
                <p><ww:text name="directory.options.autogroupadd.groups.text"/></p>
                <ul>
                    <ww:iterator value="defaultGroups">
                        <li>
                            <ww:property/>
                            <a href="<ww:url namespace="/console/secure/directory" action="updateinternaloptions" method="removeDefaultGroup"><ww:param name="ID" value="ID"/><ww:param name="groupToRemove" value="top"/><ww:param name="%{xsrfTokenName}" value="%{xsrfToken}"/></ww:url>">
                                <span class="aui-icon aui-icon-small aui-iconfont-remove"><ww:text name="directory.options.autogroupadd.remove.label"/></span>
                            </a>
                        </li>
                    </ww:iterator>
                </ul>
            </ww:else>
        </ww:set>
        <ww:component template="form.jsp" id="updateGeneral">
            <ww:param name="action"><ww:url namespace="/console/secure/directory" action="updateinternal" includeParams="none" /></ww:param>
            <ww:param name="content" value="#formContent" />
            <ww:param name="includeSubmitButton" value="false" />
        </ww:component>
        <p>
            <cwd:soy moduleKey="com.atlassian.auiplugin:aui-experimental-soy-templates" template="aui.buttons.button" id="addGroups">
                <ww:param name="type" value="'primary'" />
                <ww:param name="text" value="getText('picker.addgroups.label')" />
            </cwd:soy>
        </p>
    </div>
</div>

</body>
</html>
