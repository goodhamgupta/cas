<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="/struts-tags" prefix="ww" %>
<html>
<head>
    <title><ww:property value="getText('menu.resetpassword.label')"/></title>
    <meta name="section" content="users"/>
    <meta name="pagename" content="resetpassword"/>
    <meta name="help.url" content="<ww:property value="getText('help.user.resetpassword')"/>"/>
</head>
<body>

<h2><ww:property value="getText('menu.resetpassword.label')"/></h2>
<p><ww:property value="getText('principal.resetpassword.text')"/></p>

<ww:set name="formContent">
    <ww:component template="form_row.jsp">
        <ww:param name="label" value="getText('principal.name.label')"/>
        <ww:param name="value">
            <ww:property value="user.name"/>
        </ww:param>
    </ww:component>
    <ww:component template="form_row.jsp">
        <ww:param name="label" value="getText('group.directory.label')"/>
        <ww:param name="value">
            <ww:property value="directory.name"/>
        </ww:param>
        <ww:param name="description">
            <ww:property value="directory.description"/>
        </ww:param>
    </ww:component>
    <input type="hidden" name="directoryID" value="<ww:property value="directoryID" />"/>
    <input type="hidden" name="name" value="<ww:property value="name" />"/>
</ww:set>
<ww:component template="form.jsp">
    <ww:param name="action"><ww:url namespace="/console/secure/user" action="resetpassword" method="update" includeParams="none" /></ww:param>
    <ww:param name="content" value="#formContent" />
    <ww:param name="cancelUri"><ww:url namespace="/console/secure/user" action="view" method="default" includeParams="none" escapeAmp="false"><ww:param name="directoryID" value="directoryID" /><ww:param name="name" value="name" /></ww:url></ww:param>
    <ww:param name="submitLabel" value="getText('continue.label')" />
</ww:component>

</body>
</html>
