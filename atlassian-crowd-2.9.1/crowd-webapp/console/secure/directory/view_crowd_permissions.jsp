<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="/struts-tags" prefix="ww" %>
<html>
<head>
    <title>
        <ww:text name="menu.viewdirectory.label">
            <ww:param><ww:property value="directory.name"/></ww:param>
        </ww:text>
    </title>
    <meta name="section" content="directories"/>
    <meta name="pagename" content="view"/>
    <meta name="help.url" content="<ww:property value="getText('help.directory.remotecrowd.permissions')"/>"/>
</head>
<body>
<h2>
    <ww:text name="menu.viewdirectory.label">
        <ww:param><ww:property value="directory.name"/></ww:param>
    </ww:text>
</h2>

<div class="aui-tabs horizontal-tabs aui-tabs-disabled">
    <jsp:include page="inc_tabs_crowd.jsp">
        <jsp:param name="selectedTab" value="3" />
    </jsp:include>
    <div class="tabs-pane active-pane">
        <ww:set name="formContent">
            <ww:component template="permissions.jsp">
                <ww:param name="legend" value="getText('menu.permissions.label')"/>
            </ww:component>
            <input type="hidden" name="ID" value="<ww:property value="ID" />"/>
        </ww:set>
        <ww:component template="form.jsp" id="permissions">
            <ww:param name="action"><ww:url namespace="/console/secure/directory" action="updateremotecrowdpermissions" method="update" includeParams="none" /></ww:param>
            <ww:param name="content" value="#formContent" />
            <ww:param name="cancelUri"><ww:url namespace="/console/secure/directory" action="viewremotecrowd" method="default" includeParams="none"><ww:param name="ID" value="ID" /></ww:url></ww:param>
        </ww:component>
    </div>
</div>

</body>
</html>
