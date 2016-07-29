<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="/struts-tags" prefix="ww" %>
<html>
<head>
    <title><ww:property value="getText('menu.addapplication.label')"/></title>
    <meta name="section" content="applications"/>
    <meta name="pagename" content="add"/>
    <meta name="help.url" content="<ww:property value="getText('help.application.add')"/>"/>
    <script>
        AJS.$(document).on('click', '#resolve-ip', function (e) {
            var form = document.getElementById('addapplicationconnectiondetails');
            form.action = '<ww:url namespace="/console/secure/application" action="addapplicationconnectiondetails" method="resolveIPAddress" includeParams="none"/>';
            form.submit();
        });
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
        <h2><ww:property value="getText('menu.addapplication.label')"/> - <ww:property value="configuration.name"/></h2>
    </ww:param>
    <ww:param name="actionsContent" value="#progressTracker" />
</ww:component>

<ww:set name="formContent">
    <ww:textfield name="applicationURL">
        <ww:param name="label" value="getText('application.url.label')"/>
        <ww:param name="required" value="true"/>
        <ww:param name="fieldWidth" value="'long'"/>
        <ww:param name="description">
            <ww:property value="getText('application.url.description')"/>
        </ww:param>
        <ww:param name="fieldAfter">
            <input type="button" value="Resolve IP Address" class="aui-button" id="resolve-ip" />
        </ww:param>
    </ww:textfield>
    <ww:textfield name="remoteIPAddress">
        <ww:param name="label" value="getText('application.remoteipaddress.label')"/>
        <ww:param name="required" value="true"/>
        <ww:param name="description">
            <ww:property value="getText('application.remoteipaddress.description')"/>
        </ww:param>
    </ww:textfield>
</ww:set>
<ww:component template="form.jsp" id="addapplicationconnectiondetails">
    <ww:param name="action"><ww:url namespace="/console/secure/application" action="addapplicationconnectiondetails" method="completeStep" includeParams="none" /></ww:param>
    <ww:param name="cancelUri"><ww:url namespace="/console/secure/application" action="addapplicationdetails" method="cancel" /></ww:param>
    <ww:param name="submitLabel" value="getText('next.label')" />
    <ww:param name="content" value="#formContent" />
</ww:component>

</body>
</html>
