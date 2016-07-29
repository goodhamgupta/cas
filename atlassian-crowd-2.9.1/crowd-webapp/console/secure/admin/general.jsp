<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="/struts-tags" prefix="ww" %>
<html>
<head>
    <title><ww:property value="getText('options.title')"/></title>
    <meta name="section" content="administration" />
    <meta name="pagename" content="general" />
    <meta name="help.url" content="<ww:property value="getText('help.admin.general')"/>"/>
</head>

<body>
<h2><ww:property value="getText('menu.options.label')"/></h2>
<ww:set name="formContent">
    <ww:textfield name="title" >
        <ww:param name="label" value="getText('options.title.label')" />
        <ww:param name="description" value="getText('options.title.description')" />
        <ww:param name="required" value="true"/>
    </ww:textfield>

    <ww:textfield name="domain" >
        <ww:param name="label" value="getText('options.domain.label')" />
        <ww:param name="description"><ww:property value="getText('options.domain.description')"/></ww:param>
    </ww:textfield>

    <ww:checkbox name="secureCookie" fieldValue="true" disabled="disableSSOSecureCookie">
        <ww:param name="label" value="getText('options.securecookie.label')" />
        <ww:param name="description">
            <ww:if test="disableSSOSecureCookie">
                <ww:property value="getText('options.securecookie.disabled.description')"/>
            </ww:if>
            <ww:property value="getText('options.securecookie.description')"/>
        </ww:param>
    </ww:checkbox>

    <ww:checkbox name="cachingEnabled" fieldValue="true" >
        <ww:param name="label" value="getText('caching.enabled.label')" />
        <ww:param name="description"><ww:property value="getText('caching.enabled.description')"/></ww:param>
    </ww:checkbox>

    <ww:checkbox name="webavatars">
        <ww:param name="label" value="getText('options.webavatars.label')" />
        <ww:param name="description"><ww:property value="getText('options.webavatars.description')"/></ww:param>
    </ww:checkbox>
</ww:set>
<ww:component template="form.jsp" id="general">
    <ww:param name="action"><ww:url namespace="/console/secure/admin" action="general" method="update" includeParams="none"/></ww:param>
    <ww:param name="cancelUri"><ww:url namespace="/console/secure/admin" action="general" method="default" includeParams="none"/></ww:param>
    <ww:param name="content" value="#formContent" />
</ww:component>
</body>
</html>
