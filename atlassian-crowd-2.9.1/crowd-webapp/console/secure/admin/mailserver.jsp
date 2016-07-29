<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="/struts-tags" prefix="ww" %>
<html>
<head>
    <title><ww:text name="options.title"/></title>
    <meta name="section" content="administration"/>
    <meta name="pagename" content="mailserver"/>
    <meta name="help.url" content="<ww:text name="help.admin.mailserver"/>"/>
</head>

<body>

<h2><ww:text name="menu.mailserver.label"/></h2>

<ww:set name="formContent">
    <ww:textfield name="notificationEmail" size="50">
        <ww:param name="label" value="getText('mailserver.notification.label')"/>
        <ww:param name="required" value="true" />
        <ww:param name="description"><ww:property value="getText('mailserver.notification.description')"/></ww:param>
    </ww:textfield>

    <ww:textfield name="from" size="50">
        <ww:param name="label" value="getText('mailserver.from.label')"/>
        <ww:param name="required" value="true" />
        <ww:param name="description"><ww:property value="getText('mailserver.from.description')"/></ww:param>
    </ww:textfield>

    <ww:textfield name="prefix" size="50">
        <ww:param name="label" value="getText('mailserver.prefix.label')"/>
        <ww:param name="description"><ww:property value="getText('mailserver.prefix.description')"/></ww:param>
    </ww:textfield>

    <h3><ww:text name="mailserver.serverdetails.label"/></h3>

    <fieldset class="group">
        <legend><span><ww:text name="mailserver.jndi.smtp.label"/></span></legend>
        <div class="radio">
            <input type="radio" id="radioSMTPOption" name="jndiMailActive" value="false" class="radio"<ww:if test="jndiMailActive == 'false'"> checked="checked"</ww:if> />
            <label for="radioSMTPOption"><ww:text name="mailserver.smtphost.label"/></label>
        </div>
        <div class="radio">
            <input type="radio" id="radioJNDIOption" name="jndiMailActive" value="true" class="radio"<ww:if test="jndiMailActive == 'true'"> checked="checked"</ww:if> />
            <label for="radioJNDIOption"><ww:text name="mailserver.jndilocation.label"/></label>
        </div>
        <div class="description">
            <ww:text name="mailserver.jndi.smtp.description" />
        </div>
    </fieldset>

    <fieldset id="smtp-configuration"<ww:if test="jndiMailActive == 'true'"> style="display: none;"</ww:if>>

        <h4><ww:text name="mailserver.smtphost.label"/></h4>

        <ww:textfield name="host" size="50">
            <ww:param name="label" value="getText('mailserver.host.label')"/>
            <ww:param name="required" value="true" />
            <ww:param name="description"><ww:property value="getText('mailserver.host.description')"/></ww:param>
        </ww:textfield>

        <ww:textfield name="port">
            <ww:param name="label" value="getText('mailserver.port.label')"/>
            <ww:param name="description"><ww:property value="getText('mailserver.port.description')"/></ww:param>
            <ww:param name="fieldWidth" value="'short'" />
        </ww:textfield>

        <ww:textfield name="username">
            <ww:param name="label" value="getText('mailserver.username.label')"/>
            <ww:param name="description"><ww:property value="getText('mailserver.username.description')"/></ww:param>
        </ww:textfield>

        <ww:password name="password">
            <ww:param name="label" value="getText('mailserver.password.label')"/>
            <ww:param name="description"><ww:property value="getText('mailserver.password.description')"/></ww:param>
        </ww:password>

        <ww:checkbox name="useSSL" onchange="document.getElementById('port').value = this.checked ? 465 : 25">
            <ww:param name="label" value="getText('mailserver.useSSL.label')"/>
            <ww:param name="description"><ww:property value="getText('mailserver.useSSL.description')"/></ww:param>
        </ww:checkbox>

    </fieldset>

    <fieldset id="jndi-configuration"<ww:if test="jndiMailActive == 'false'"> style="display: none;"</ww:if>>

        <h4><ww:text name="mailserver.jndilocation.label"/></h4>

        <ww:textfield name="jndiLocation" size="50">
            <ww:param name="label" value="getText('mailserver.jndiLocation.label')"/>
            <ww:param name="required" value="true" />
            <ww:param name="description"><ww:property value="getText('mailserver.jndiLocation.description')"/></ww:param>
        </ww:textfield>

    </fieldset>

</ww:set>
<ww:component template="form.jsp" id="mailserver">
    <ww:param name="action"><ww:url namespace="/console/secure/admin" action="mailserver" method="update" includeParams="none"/></ww:param>
    <ww:param name="cancelUri"><ww:url namespace="/console/secure/admin" action="mailserver" method="default" includeParams="none"/></ww:param>
    <ww:param name="content" value="#formContent" />
</ww:component>
<script>
    (function ($) {
        var checkboxSelector = 'input[name="jndiMailActive"]';
        var $jndi = $('#jndi-configuration');
        var $smtp = $('#smtp-configuration');
        var handler = function () {
            var $input = $(this);
            if ($input.val() === 'true') {
                $jndi.show();
                $smtp.hide();
            } else {
                $jndi.hide();
                $smtp.show();
            }
        };
        $(document).on('click', checkboxSelector, handler);
        handler.call($(checkboxSelector).filter(':checked')[0]);
    }(AJS.$));
</script>
</body>
</html>
