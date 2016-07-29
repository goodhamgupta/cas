<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="/struts-tags" prefix="ww" %>
<%@ taglib uri="/WEB-INF/crowd.tld" prefix="cwd" %>
<html>
<head>
    <title><ww:property value="getText('connectionpool.title')"/></title>
    <meta name="section" content="administration"/>
    <meta name="pagename" content="connection_pool"/>
    <meta name="help.url" content="<ww:property value="getText('help.admin.connectionpool')"/>"/>
</head>

<body>
<h2><ww:property value="getText('menu.connectionpool.label')"/></h2>
<h3><ww:property value="getText('connectionpool.statistics.title')"/></h3>
<pre><ww:property value="ldapPoolManagerStatistics" /></pre>

<br>

<p><ww:text name="connectionpool.description.text"/></p>

<ww:set name="formContent">

    <!-- Display form to allow users to update the LDAP connection pool properties -->

    <ww:if test="settingsChanged">
        <cwd:soy moduleKey="com.atlassian.auiplugin:aui-experimental-soy-templates" template="aui.message.info">
            <ww:param name="titleContent" value="getText('connectionpool.info.text')" />
            <ww:param name="content">                      
                <ww:if test="initialSize != systemInitialSize">
                    <ww:component template="form_row.jsp">
                        <ww:param name="label" value="getText('connectionpool.initialSize.label')"/>
                        <ww:param name="value">
                            <ww:property value="systemInitialSize"/>
                        </ww:param>
                        <ww:param name="escapeValue" value="false" />
                    </ww:component>
                </ww:if>
                <ww:if test="preferredSize != systemPreferredSize">
                    <ww:component template="form_row.jsp">
                        <ww:param name="label" value="getText('connectionpool.preferredSize.label')"/>
                        <ww:param name="value">
                            <ww:property value="systemPreferredSize"/>
                        </ww:param>
                        <ww:param name="escapeValue" value="false" />
                    </ww:component>
                </ww:if>
                <ww:if test="timeoutInSec != systemTimeoutInSec">
                     <ww:component template="form_row.jsp">
                        <ww:param name="label" value="getText('connectionpool.timeout.label')"/>
                        <ww:param name="value">
                            <ww:property value="systemTimeoutInSec"/>
                        </ww:param>
                        <ww:param name="escapeValue" value="false" />
                    </ww:component>
                </ww:if>
                <ww:if test="supportedProtocol != systemSupportedProtocol">
                    <ww:component template="form_row.jsp">
                        <ww:param name="label" value="getText('connectionpool.supportedProtocol.label')"/>
                        <ww:param name="value">
                            <ww:property value="systemSupportedProtocol"/>
                        </ww:param>
                        <ww:param name="escapeValue" value="false" />
                    </ww:component>
                </ww:if>
                <ww:if test="supportedAuthentication != systemSupportedAuthentication">
                    <ww:component template="form_row.jsp">
                        <ww:param name="label" value="getText('connectionpool.supportedAuthentication.label')"/>
                        <ww:param name="value">
                            <ww:property value="systemSupportedAuthentication"/>
                        </ww:param>
                        <ww:param name="escapeValue" value="false" />
                    </ww:component>
                </ww:if>         
            </ww:param>
        </cwd:soy>
    </ww:if>

    <ww:textfield name="initialSize">
        <ww:param name="label" value="getText('connectionpool.initialSize.label')"/>
        <ww:param name="description" value="getText('connectionpool.initialSize.description')"/>
        <ww:param name="fieldWidth" value="'short'" />
    </ww:textfield>

    <ww:textfield name="preferredSize">
        <ww:param name="label" value="getText('connectionpool.preferredSize.label')"/>
        <ww:param name="description" value="getText('connectionpool.preferredSize.description')"/>
        <ww:param name="fieldWidth" value="'short'" />
    </ww:textfield>

    <ww:textfield name="maximumSize">
        <ww:param name="label" value="getText('connectionpool.maximumSize.label')"/>
        <ww:param name="description" value="getText('connectionpool.maximumSize.description')"/>
        <ww:param name="fieldWidth" value="'short'" />
    </ww:textfield>

    <ww:textfield name="timeoutInSec">
        <ww:param name="label" value="getText('connectionpool.timeout.label')"/>
        <ww:param name="description" value="getText('connectionpool.timeout.description')"/>
        <ww:param name="fieldWidth" value="'short'" />
    </ww:textfield>

    <ww:textfield name="supportedProtocol">
        <ww:param name="label" value="getText('connectionpool.supportedProtocol.label')"/>
        <ww:param name="description" value="getText('connectionpool.supportedProtocol.description')"/>
    </ww:textfield>

    <ww:textfield name="supportedAuthentication">
        <ww:param name="label" value="getText('connectionpool.supportedAuthentication.label')"/>
        <ww:param name="description" value="getText('connectionpool.supportedAuthentication.description')"/>
    </ww:textfield>
</ww:set>
<ww:component template="form.jsp" id="connectionpool">
    <ww:param name="action"><ww:url namespace="/console/secure/admin" action="connectionpool" method="update" includeParams="none"/></ww:param>
    <ww:param name="cancelUri"><ww:url namespace="/console/secure/admin" action="connectionpool" method="default" includeParams="none"/></ww:param>
    <ww:param name="content" value="#formContent" />
</ww:component>
</body>
</html>
