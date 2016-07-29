<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="/struts-tags" prefix="ww" %>
<html>

<head>
    <title><ww:text name="menu.user.console.changepassword.label"/></title>

    <meta name="pagename" content="changepassword"/>
    <meta name="help.url" content="<ww:text name="help.user.console.changepassword"/>"/>
    <meta name="bodyCssClass" content="aui-page-focused aui-page-focused-medium"/>
</head>

<body>

<h1><ww:text name="menu.user.console.changepassword.label"/></h1>

<ww:component template="form_messages.jsp"/>

<p>
    <ww:text name="changepassword.complete.label">
        <ww:param name="0"><a href="<ww:url includeParams="none" namespace="/console" action="login"/>"></ww:param>
        <ww:param name="1"></a></ww:param>
    </ww:text>
</p>
</body>
</html>
