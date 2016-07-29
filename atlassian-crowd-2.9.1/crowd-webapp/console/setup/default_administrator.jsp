<%@ page pageEncoding='utf-8' %>
<%@ taglib uri="/struts-tags" prefix="ww" %>
<html>
<head>
    <title><ww:property value="getText('defaultadmin.title')"/></title>
    <meta name="help.url" content="<ww:property value="getText('help.setup.defaultadmin')"/>"/>
</head>
<body>

<h2><ww:property value="getText('defaultadmin.title')"/></h2>
<p><ww:property value="getText('defaultadmin.text')"/></p>
<form method="post" action="<ww:url namespace="/console/setup" action="defaultadministrator" method="update" />" name="administrator" class="aui">
    <ww:component template="setup_messages.jsp"/>

    <ww:textfield name="email" size="50">
        <ww:param name="label" value="getText('principal.email.label')"/>
        <ww:param name="type" value="'email'" />
        <ww:param name="required" value="true"/>
    </ww:textfield>
    <ww:textfield name="name">
        <ww:param name="label" value="getText('principal.name.label')"/>
        <ww:param name="required" value="true"/>
    </ww:textfield>
    <ww:password name="password">
        <ww:param name="label" value="getText('principal.password.label')"/>
        <ww:param name="required" value="true"/>
    </ww:password>
    <ww:password name="passwordConfirm">
        <ww:param name="label" value="getText('principal.passwordconfirm.label')"/>
        <ww:param name="required" value="true"/>
    </ww:password>
    <ww:textfield name="firstname">
        <ww:param name="label" value="getText('principal.firstname.label')"/>
        <ww:param name="required" value="true"/>
    </ww:textfield>
    <ww:textfield name="lastname">
        <ww:param name="label" value="getText('principal.lastname.label')"/>
        <ww:param name="required" value="true"/>
    </ww:textfield>
    <input type="hidden" name="ID" value="<ww:property value="ID" />"/>

    <div class="buttons-container">
        <div class="buttons">
            <input type="submit" class="aui-button aui-button-primary" value="<ww:property value="getText('continue.label')"/>"/>
        </div>
    </div>
</form>

</body>
</html>
