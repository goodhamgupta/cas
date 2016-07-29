<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="/struts-tags" prefix="ww" %>
<html>
<head>
    <title><ww:property value="getText('setup.title')"/></title>
</head>
<body>

<ww:component template="setup_messages.jsp"/>
<p>
    <ww:text name="setup.alreadysetup">
        <ww:param name="0"><a href="<ww:url value="/console" includeParams="none"/>"></ww:param>
        <ww:param name="1"></a></ww:param>
    </ww:text>
</p>

</body>
</html>
