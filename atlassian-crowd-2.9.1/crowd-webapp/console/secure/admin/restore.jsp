<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="/struts-tags" prefix="ww" %>
<%@ taglib uri="/WEB-INF/crowd.tld" prefix="cwd" %>
<html>
<head>
    <title><ww:property value="getText('menu.restore.label')"/></title>
    <meta name="section" content="administration" />
    <meta name="pagename" content="restore" />
    <meta name="help.url" content="<ww:property value="getText('help.admin.restore')"/>"/>
</head>

<body>
<h2><ww:property value="getText('menu.restore.label')"/></h2>
<p><ww:text name="administration.restore.text"/></p>

<cwd:soy moduleKey="com.atlassian.auiplugin:aui-experimental-soy-templates" template="aui.message.warning">
    <ww:param name="titleContent" value="getText('administration.restore.warning.text')" />
    <ww:param name="content" value="''" />
</cwd:soy>
<ww:if test="importResponseMessage != null" >
    <cwd:soy moduleKey="com.atlassian.auiplugin:aui-experimental-soy-templates" template="aui.message.success">
        <ww:param name="content"><ww:property value="importResponseMessage"/></ww:param>
    </cwd:soy>
</ww:if>

<ww:set name="formContent">
    <ww:textfield name="importFilePath" size="50">
        <ww:param name="label" value="getText('administration.restore.filepath.label')"/>
        <ww:param name="description">
            <ww:property value="getText('administration.restore.filepath.pathinfo')"/>
        </ww:param>
        <ww:param name="fieldWidth" value="'long'"/>
    </ww:textfield>
</ww:set>
<ww:component template="form.jsp" id="import">
    <ww:param name="action"><ww:url namespace="/console/secure/admin" action="restore" method="import" includeParams="none" /></ww:param>
    <ww:param name="submitLabel" value="getText('submit.label')" />
    <ww:param name="submitName" value="'import-submit'" />
    <ww:param name="content" value="#formContent" />
</ww:component>
</body>
</html>
