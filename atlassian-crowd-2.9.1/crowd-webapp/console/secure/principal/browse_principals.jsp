<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="/struts-tags" prefix="ww" %>
<html>
<head>
    <title><ww:property value="getText('browser.principal.title')"/></title>
    <meta name="section" content="users"/>
    <meta name="pagename" content="browseuser"/>
    <meta name="help.url" content="<ww:property value="getText('help.user.browse')"/>"/>
</head>
<body>
<h2><ww:property value="getText('browser.principal.title')"/></h2>
<ww:component template="search_principals.jsp">
    <ww:param name="namespace" value="/console/secure/user"/>
    <ww:param name="action" value="browse"/>
</ww:component>
</body>
</html>
