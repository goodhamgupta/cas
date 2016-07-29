<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="/struts-tags" prefix="ww" %>
<html>
<head>
    <title><ww:property value="getText('options.title')"/></title>
    <meta name="section" content="administration" />
    <meta name="pagename" content="mailtemplate" />
    <meta name="help.url" content="<ww:property value="getText('help.admin.mailtemplate')"/>"/>
</head>
<body>
<h2><ww:property value="getText('menu.mailtemplate.label')"/></h2>
<ww:set name="formContent">
    <ww:textarea name="forgottenPasswordTemplate" rows="10" cols="80" >
        <ww:param name="label" value="getText('mailtemplate.template.forgotten.password.label')" />
        <ww:param name="description"><ww:property value="getText('mailtemplate.template.forgotten.password.description')" escape="false"/></ww:param>
        <ww:param name="fieldWidth" value="'full-width'" />
    </ww:textarea>
    <ww:textarea name="forgottenUsernamesTemplate" rows="10" cols="80" >
        <ww:param name="label" value="getText('mailtemplate.template.forgotten.usernames.label')" />
        <ww:param name="description"><ww:property value="getText('mailtemplate.template.forgotten.usernames.description')" escape="false"/></ww:param>
        <ww:param name="fieldWidth" value="'full-width'" />
    </ww:textarea>
</ww:set>
<ww:component template="form.jsp" id="mailtemplate">
    <ww:param name="action"><ww:url namespace="/console/secure/admin" action="mailtemplate" method="update" includeParams="none"/></ww:param>
    <ww:param name="cancelUri"><ww:url namespace="/console/secure/admin" action="mailtemplate" method="default" includeParams="none"/></ww:param>
    <ww:param name="content" value="#formContent" />
    <ww:param name="isTopLabels" value="true" />
</ww:component>
</body>
</html>
