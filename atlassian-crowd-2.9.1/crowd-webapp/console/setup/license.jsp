<%@ page pageEncoding='utf-8' %>
<%@ taglib uri="/struts-tags" prefix="ww" %>
<html>
<head>
    <title><ww:property value="getText('license.title')"/></title>
    <meta name="help.url" content="<ww:property value="getText('help.setup.license')"/>"/>
</head>
<body>

<h2><ww:text name="license.title"/></h2>
<p><ww:property value="getText('setup.text')"/></p>
<form method="post" action="<ww:url namespace="/console/setup" action="setuplicense" method="update" />" name="license" class="aui">
    <ww:component template="setup_messages.jsp"/>

    <ww:component template="form_row.jsp">
        <ww:param name="label" value="getText('license.serverid.label')" />
        <ww:param name="value">
                <ww:property value="sid"/>
        </ww:param>
    </ww:component>

    <input type="hidden" name="sid" value="<ww:property value="sid" />" />

    <ww:textarea name="key" rows="7" cols="60">
        <ww:param name="label">
            <ww:property value="getText('license.key.label')"/>
        </ww:param>
        <ww:param name="fieldWidth" value="'full-width'"/>
        <ww:param name="description">
            <ww:text name="license.key.description.1"/>
            <a href="<ww:url value="http://www.atlassian.com/ex/GenerateLicense.jspa">
            <ww:param name="product" value="getText('application.name')" />
            <ww:param name="version" value="@com.atlassian.crowd.util.build.BuildUtils@BUILD_VERSION" />
            <ww:param name="sid" value="sid" />
            <ww:param name="ref" value="'prod'" /></ww:url>"><ww:text name="license.key.description.2"/></a>
            &nbsp;<ww:text name="license.key.description.3">
            <ww:param name="0"><a href="<ww:url value="http://my.atlassian.com/" includeParams="none"/>"></ww:param>
            <ww:param name="1"></a></ww:param>
        </ww:text>
        </ww:param>
    </ww:textarea>

    <div class="buttons-container">
        <div class="buttons">
            <input type="submit" class="aui-button aui-button-primary" value="<ww:property value="getText('continue.label')"/>"/>
        </div>
    </div>
</form>

</body>
</html>
