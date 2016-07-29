<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="/struts-tags" prefix="ww" %>
<html>
<head>
    <title>
        <ww:text name="menu.viewapplication.label"/>
    </title>
    <meta name="section" content="applications"/>
    <meta name="pagename" content="view"/>
    <meta name="help.url" content="<ww:text name="help.application.view.users"/>"/>

</head>
<body>

<h2 id="application-name">
    <img class="application-icon" title="<ww:property value="getImageTitle(application.active, application.type)"/>" alt="<ww:property value="getImageTitle(application.active, application.type)"/>" src="<ww:property value="getImageLocation(application.active, application.type)" />"/>
    <ww:property value="application.name"/>
</h2>

<div class="aui-tabs horizontal-tabs aui-tabs-disabled">

    <ww:component template="application_tab_headers.jsp">
        <ww:param name="pagekey" value="'application-users'"/>
    </ww:component>

    <div class="tabs-pane active-pane">
        <p><ww:property value="getText('application.users.text')"/></p>
        <ww:component template="search_principals.jsp">
            <ww:param name="webwork.namespace" value="/console/secure/application"/>
            <ww:param name="webwork.action" value="viewusers"/>
            <ww:param name="applicationid" value="ID"/>
        </ww:component>
    </div>
</div>
</body>
</html>
