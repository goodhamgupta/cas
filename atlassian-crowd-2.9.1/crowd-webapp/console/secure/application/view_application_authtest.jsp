<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="/struts-tags" prefix="ww" %>
<html>
<head>
    <title>
        <ww:text name="menu.viewapplication.label"/>
    </title>
    <meta name="section" content="applications"/>
    <meta name="pagename" content="view"/>
    <meta name="help.url" content="<ww:text name="help.application.view.configtest"/>"/>

</head>
<body>

<h2 id="application-name">
    <img class="application-icon" title="<ww:property value="getImageTitle(application.active, application.type)"/>" alt="<ww:property value="getImageTitle(application.active, application.type)"/>" src="<ww:property value="getImageLocation(application.active, application.type)" />"/>
    <ww:property value="application.name"/>
</h2>

<div class="aui-tabs horizontal-tabs aui-tabs-disabled">

    <ww:component template="application_tab_headers.jsp">
        <ww:param name="pagekey" value="'application-authtest'"/>
    </ww:component>

    <div class="tabs-pane active-pane" id="tab7">
        <p>
            <ww:text name="configtest.text.1">
                <ww:param><ww:property value="application.name"/></ww:param>
            </ww:text>
        </p>
        <ww:set name="formContent">
            <ww:textfield name="testUsername">
                <ww:param name="label" value="getText('principal.name.label')"/>
            </ww:textfield>
            <ww:password name="testPassword">
                <ww:param name="label" value="getText('principal.password.label')"/>
            </ww:password>
            <input type="hidden" name="ID" value="<ww:property value="ID" />"/>
            <input type="hidden" name="tab" value="6"/>
        </ww:set>
        <ww:component template="form.jsp" id="app-auth-test-form">
            <ww:param name="action"><ww:url namespace="/console/secure/application" action="viewauthtest" method="configTest" includeParams="none" /></ww:param>
            <ww:param name="cancelUri"><ww:url namespace="/console/secure/application" action="viewauthtest" method="default" includeParams="none" ><ww:param name="ID" value="ID"/><ww:param name="tab" value="6"/></ww:url></ww:param>
            <ww:param name="submitLabel" value="getText('configtest.button.label')" />
            <ww:param name="content" value="#formContent" />
            <ww:param name="tabID" value="6"/>
        </ww:component>
    </div>
</div>
</body>
</html>
