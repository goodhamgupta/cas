<%@ page pageEncoding='utf-8' %>
<%@ taglib uri="/struts-tags" prefix="ww" %>
<html>
<head>
    <title><ww:text name="mailserver.title"/></title>
    <meta name="help.url" content="<ww:text name="help.setup.mailserver"/>"/>
    <script>
        AJS.$(function ($) {
            var laterNowToggle = toggleOnTrue('#mail-configuration', '#postpone-configuration');
            var smtpJndiToggle = toggleOnTrue('#smtp-configuration', '#jndi-configuration');
            var $setupToggle = $('input[name="postponeConfiguration"]').click(laterNowToggle).filter(':checked');
            var $smtpToggle = $('input[name="jndiMailActive"]').click(smtpJndiToggle).filter(':checked');

            laterNowToggle.call($setupToggle[0]);
            smtpJndiToggle.call($smtpToggle[0]);

            $('#useSSL').change(function () {
                $('#port').val(this.checked ? 465 : 25);
            });

            function toggleOnTrue(el1, el2) {
                return function () {
                    var isTrue = $(this).val() == 'true';
                    $(el1).toggle(!isTrue);
                    $(el2).toggle(isTrue);
                }
            }
        });
    </script>
</head>
<body>

<h2><ww:text name="mailserver.configuration.label"/></h2>
<form method="post" action="<ww:url namespace="/console/setup" action="mailserver" method="update" />" name="mailserver" class="aui">
    <ww:component template="setup_messages.jsp"/>

    <ww:radio name="postponeConfiguration" list="#@java.util.LinkedHashMap@{true: getText('mailserver.configure.later.label'), false: getText('mailserver.configure.now.label')}">
        <ww:param name="legend" value="getText('mailserver.postpone.question.label')"/>
    </ww:radio>

    <div id="postpone-configuration" class="field-group">
        <p><ww:text name="mailserver.postpone.during.setup1"/></p>
        <p><ww:text name="mailserver.postpone.during.setup2"/></p>
    </div>

    <fieldset id="mail-configuration">
        <ww:textfield name="notificationEmail" size="50">
            <ww:param name="label" value="getText('mailserver.notification.label')"/>
            <ww:param name="required" value="true" />
            <ww:param name="type" value="'email'" />
            <ww:param name="description"><ww:property value="getText('mailserver.notification.description')"/></ww:param>
        </ww:textfield>

        <ww:textfield name="from" size="50">
            <ww:param name="label" value="getText('mailserver.from.label')"/>
            <ww:param name="required" value="true" />
            <ww:param name="type" value="'email'" />
            <ww:param name="description"><ww:property value="getText('mailserver.from.description')"/></ww:param>
        </ww:textfield>

        <ww:textfield name="prefix" size="50">
            <ww:param name="label" value="getText('mailserver.prefix.label')"/>
            <ww:param name="description"><ww:property value="getText('mailserver.prefix.description')"/></ww:param>
        </ww:textfield>

        <h3><ww:text name="mailserver.serverdetails.label"/></h3>

        <ww:radio name="jndiMailActive" list="#@java.util.LinkedHashMap@{false: getText('mailserver.smtphost.label'), true: getText('mailserver.jndilocation.label')}">
            <ww:param name="legend" value="getText('mailserver.jndi.smtp.label')"/>
            <ww:param name="description" value="getText('mailserver.jndi.smtp.description')"/>
        </ww:radio>

        <fieldset id="smtp-configuration">
            <h4><ww:text name="mailserver.smtphost.label"/></h4>
            <ww:textfield name="host" size="50">
                <ww:param name="label" value="getText('mailserver.host.label')"/>
                <ww:param name="required" value="true" />
                <ww:param name="description"><ww:property value="getText('mailserver.host.description')"/></ww:param>
            </ww:textfield>
            <ww:textfield name="port" size="10">
                <ww:param name="label" value="getText('mailserver.port.label')"/>
                <ww:param name="type" value="'number'" />
                <ww:param name="fieldWidth" value="'short'"/>
                <ww:param name="description"><ww:property value="getText('mailserver.port.description')"/></ww:param>
            </ww:textfield>
            <ww:textfield name="username">
                <ww:param name="label" value="getText('mailserver.username.label')"/>
                <ww:param name="description"><ww:property value="getText('mailserver.username.description')"/></ww:param>
            </ww:textfield>
            <ww:password name="password">
                <ww:param name="label" value="getText('mailserver.password.label')"/>
                <ww:param name="description"><ww:property value="getText('mailserver.password.description')"/></ww:param>
            </ww:password>
            <ww:checkbox name="useSSL">
                <ww:param name="label" value="getText('mailserver.useSSL.label')"/>
                <ww:param name="description"><ww:property value="getText('mailserver.useSSL.description')"/></ww:param>
            </ww:checkbox>
        </fieldset>

        <fieldset id="jndi-configuration">
            <h4><ww:text name="mailserver.jndilocation.label"/></h4>
            <ww:textfield name="jndiLocation" size="50">
                <ww:param name="label" value="getText('mailserver.jndiLocation.label')"/>
                <ww:param name="required" value="true" />
                <ww:param name="description"><ww:property value="getText('mailserver.jndiLocation.description')"/></ww:param>
            </ww:textfield>
        </fieldset>
    </fieldset>

    <div class="buttons-container">
        <div class="buttons">
            <input type="submit" class="aui-button aui-button-primary" value="<ww:property value="getText('continue.label')"/>"/>
        </div>
    </div>
</form>

</body>
</html>
