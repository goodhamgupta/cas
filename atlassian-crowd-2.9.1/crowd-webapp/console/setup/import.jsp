<%@ page pageEncoding='utf-8' %>
<%@ taglib uri="/struts-tags" prefix="ww" %>
<html>
<head>
    <title><ww:property value="getText('setup.import.title')"/></title>
    <meta name="help.url" content="<ww:property value="getText('help.setup.import')"/>"/>
</head>
<body>

<h2><ww:property value="getText('setup.import.title')"/></h2>
<p><ww:text name="setup.import.text"/></p>
<form method="post" action="<ww:url namespace="/console/setup" action="setupimport" method="doUpdate"/>" name="import" class="aui">
    <ww:component template="setup_messages.jsp"/>

    <ww:textfield name="filePath" size="50">
        <ww:param name="label" value="getText('setup.import.filepath.label')"/>
        <ww:param name="description" value="getText('setup.import.filepath.description')"/>
        <ww:param name="fieldWidth" value="'long'"/>
    </ww:textfield>

    <div class="buttons-container">
        <div class="buttons">
            <input type="submit" class="aui-button aui-button-primary" value="<ww:property value="getText('continue.label')"/>"/>
        </div>
    </div>
</form>

</body>
</html>
