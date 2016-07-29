<%@ page pageEncoding='utf-8' %>
<%@ taglib uri="/struts-tags" prefix="ww" %>
<html>
<head>
    <title><ww:property value="getText('integration.title')"/></title>
    <meta name="help.url" content="<ww:property value="getText('help.setup.integratedapps')"/>"/>
</head>
<body>

<h2><ww:property value="getText('integration.title')"/></h2>
<form method="post" action="<ww:url namespace="/console/setup" action="integration" method="update" />" name="integration" class="aui">
    <ww:component template="setup_messages.jsp"/>

    <div class="aui-message warning" id="integration-password-warning" style="display: none;">
        <p class="title"><ww:property value="getText('integration.title')"/></p>
        <p><ww:property value="getText('integration.warning')"/></p>
        <span class="aui-icon icon-warning"></span>
    </div>

    <p><ww:property value="getText('integration.text')"/></p>

    <ww:checkbox name="configureOpenIDServer">
        <ww:param name="label">
            <ww:text name="integration.openidserver.label"/>
        </ww:param>
        <ww:param name="description">
            <ww:text name="integration.openidserver.description"/>
        </ww:param>
    </ww:checkbox>

    <ww:checkbox name="configureDemoApp">
        <ww:param name="label">
            <ww:text name="integration.demoapp.label"/>
        </ww:param>
        <ww:param name="description">
            <ww:text name="integration.demoapp.description"/>
        </ww:param>
    </ww:checkbox>

    <div class="buttons-container">
        <div class="buttons">
            <input type="submit" class="aui-button aui-button-primary" value="<ww:property value="getText('continue.label')"/>"/>
        </div>
    </div>
</form>

<script>
    AJS.$(function ($) {
        var $warning = $('#integration-password-warning'),
            $checkboxes = $('#configureOpenIDServer, #configureDemoApp');
        $checkboxes.change(function () {
            $warning.toggle($checkboxes.is(':checked'));
        });
    });
</script>
</body>
</html>
