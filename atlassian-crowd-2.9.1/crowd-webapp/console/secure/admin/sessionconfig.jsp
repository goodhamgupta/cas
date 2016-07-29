<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="/struts-tags" prefix="ww" %>
<html>
<head>
    <title><ww:property value="getText('options.title')"/></title>
    <meta name="section" content="administration" />
    <meta name="pagename" content="sessionconfig" />
    <meta name="help.url" content="<ww:property value="getText('help.admin.sessionconfig')"/>"/>
</head>
<body>
<h2><ww:property value="getText('menu.sessionconfig.label')"/></h2>
<ww:set name="formContent">
    <ww:textfield name="sessionTime" >
        <ww:param name="label" value="getText('session.sessiontime.label')" />
        <ww:param name="description"><ww:property value="getText('session.sessiontime.description')"/></ww:param>
    </ww:textfield>

    <ww:checkbox name="includeIpAddressInValidationFactors">
        <ww:param name="label" value="getText('session.useipaddress.label')"/>
        <ww:param name="description"><ww:property value="getText('session.useipaddress.description')"/></ww:param>
    </ww:checkbox>

    <ww:radio
            list="tokenStorageOptions"
            name="storageType"
            listKey="key"
            listValue="value">
        <ww:param name="legend" value="getText('caching.token.label')" />
        <ww:param name="description" value="getText('caching.token.description')" />
    </ww:radio>
</ww:set>
<ww:component template="form.jsp" id="session">
    <ww:param name="action"><ww:url namespace="/console/secure/admin" action="sessionconfig" method="update" includeParams="none"/></ww:param>
    <ww:param name="cancelUri"><ww:url namespace="/console/secure/admin" action="sessionconfig" method="default" includeParams="none"/></ww:param>
    <ww:param name="content" value="#formContent" />
</ww:component>
</body>
</html>
