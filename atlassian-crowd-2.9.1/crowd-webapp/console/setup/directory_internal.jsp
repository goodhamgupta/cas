<%@ page pageEncoding='utf-8' %>
<%@ taglib uri="/struts-tags" prefix="ww" %>
<html>
<head>
    <title><ww:property value="getText('directoryinternal.title')"/></title>
    <meta name="help.url" content="<ww:property value="getText('help.setup.internaldirectory')"/>"/>
</head>
<body>

<h2><ww:property value="getText('directoryinternal.title')"/></h2>
<form method="post" action="<ww:url namespace="/console/setup" action="directoryinternalsetup" method="update" />" name="directoryinternal" class="aui">
    <ww:component template="setup_messages.jsp"/>

    <ww:textfield name="name" size="50">
        <ww:param name="label" value="getText('directoryinternal.name.label')"/>
        <ww:param name="description">
            <ww:property value="getText('directoryinternal.name.description')"/>
        </ww:param>
        <ww:param name="required" value="true"/>
    </ww:textfield>
    <ww:textfield name="description" size="50">
        <ww:param name="label" value="getText('directoryinternal.description.label')"/>
        <ww:param name="fieldWidth" value="'long'"/>
        <ww:param name="description">
            <ww:property value="getText('directoryinternal.description.description')"/>
        </ww:param>
    </ww:textfield>
    <ww:textfield name="passwordRegex" size="50">
        <ww:param name="label" value="getText('directoryinternal.passwordregex.label')"/>
        <ww:param name="description">
            <ww:property value="getText('directoryinternal.passwordregex.description')"/>
        </ww:param>
    </ww:textfield>
    <ww:textfield name="passwordComplexityMessage" size="50">
        <ww:param name="label" value="getText('directoryinternal.passwordcomplexity.help.label')"/>
        <ww:param name="description">
            <ww:property value="getText('directoryinternal.passwordcomplexity.help.description')"/>
        </ww:param>
    </ww:textfield>
    <ww:textfield name="passwordMaxAttempts">
        <ww:param name="label" value="getText('directoryinternal.passwordmaxattempts.label')"/>
        <ww:param name="type" value="'number'" />
        <ww:param name="fieldWidth" value="'short'"/>
        <ww:param name="description">
            <ww:property value="getText('directoryinternal.passwordmaxattempts.description')"/>
        </ww:param>
    </ww:textfield>
    <ww:textfield name="passwordMaxChangeTime">
        <ww:param name="label" value="getText('directoryinternal.passwordmaxchangetime.label')"/>
        <ww:param name="type" value="'number'" />
        <ww:param name="fieldWidth" value="'short'"/>
        <ww:param name="description">
            <ww:property value="getText('directoryinternal.passwordmaxchangetime.description')"/>
        </ww:param>
    </ww:textfield>
    <ww:textfield name="passwordHistoryCount">
        <ww:param name="label" value="getText('directoryinternal.passwordhistorycount.label')"/>
        <ww:param name="type" value="'number'" />
        <ww:param name="fieldWidth" value="'short'"/>
        <ww:param name="description">
            <ww:property value="getText('directoryinternal.passwordhistorycount.description')"/>
        </ww:param>
    </ww:textfield>
    <ww:select list="userEncryptionMethods" name="userEncryptionMethod" listKey="key" listValue="value" required="true">
        <ww:param name="label" value="getText('directoryconnector.userencryptionmethod.label')"/>
        <ww:param name="description">
            <ww:property value="getText('directoryconnector.userencryptionmethod.internal.description')"/>
        </ww:param>
    </ww:select>

    <div class="buttons-container">
        <div class="buttons">
            <input type="submit" class="aui-button aui-button-primary" value="<ww:property value="getText('continue.label')"/>"/>
        </div>
    </div>
</form>

</body>
</html>
