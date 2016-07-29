<%@ page pageEncoding='utf-8' %>
<%@ taglib uri="/struts-tags" prefix="ww" %>
<html>
<head>
    <title><ww:text name="install.title"/></title>
    <meta name="help.url" content="<ww:property value="getText('help.setup.installtype')"/>"/>
</head>
<body>

<h2><ww:text name="install.title"/></h2>
<p><ww:text name="install.text"/></p>
<form method="post" action="<ww:url namespace="/console/setup" action="installtype" method="update" />" name="install" class="aui">
    <ww:component template="setup_messages.jsp"/>

    <fieldset class="group">
        <div class="radio">
            <input type="radio" id="radioNewInstall" name="installOption" value="<ww:property value="newInstallValue"/>" <ww:if test="newInstallSelected">checked</ww:if> class="radio"/>
            <label for="radioNewInstall"><ww:text name="install.new.label"/></label>
            <div class="description"><ww:text name="install.new.description"/></div>
        </div>
        <div class="radio">
            <input type="radio" id="radioXmlInstall" name="installOption" value="<ww:property value="xmlInstallValue"/>" <ww:if test="xmlInstallSelected">checked</ww:if> class="radio"/>
            <label for="radioXmlInstall"><ww:text name="install.upgrade.xml.label"/></label>
            <div class="description"><ww:text name="install.upgrade.xml.description"/></div>
        </div>
    </fieldset>

    <div class="buttons-container">
        <div class="buttons">
            <input type="submit" class="aui-button aui-button-primary" value="<ww:property value="getText('continue.label')"/>"/>
        </div>
    </div>
</form>

</body>
</html>
