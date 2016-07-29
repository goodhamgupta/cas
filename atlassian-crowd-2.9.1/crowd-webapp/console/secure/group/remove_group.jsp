<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="/struts-tags" prefix="ww" %>
<html>
<head>
    <title><ww:property value="getText('group.remove.title')"/></title>
    <meta name="section" content="groups"/>
    <meta name="pagename" content="removegroup"/>
    <meta name="help.url" content="<ww:property value="getText('help.group.remove')"/>"/>
</head>
<body>

<h2><ww:property value="getText('group.remove.title')"/>&nbsp;&ndash;&nbsp;<ww:property value="name"/></h2>
<ww:set name="formContent">
    <ww:component template="form_row.jsp">
        <ww:param name="warning" value="getText('group.remove.text')"/>
        <ww:param name="label" value="getText('group.name.label')"/>
        <ww:param name="value" value="group.name"/>
        <ww:param name="description" value="group.description"/>
    </ww:component>
    <ww:component template="form_row.jsp">
        <ww:param name="label" value="getText('group.directory.label')"/>
        <ww:param name="value" value="directory.name"/>
        <ww:param name="description" value="directory.description"/>
    </ww:component>
    <input type="hidden" name="directoryID" value="<ww:property value="directoryID" />"/>
    <input type="hidden" name="name" value="<ww:property value="name" />"/>
</ww:set>
<ww:component template="form.jsp">
    <ww:param name="action"><ww:url namespace="/console/secure/group" action="remove" method="update" includeParams="none" /></ww:param>
    <ww:param name="cancelUri"><ww:url namespace="/console/secure/group" action="view" method="default" includeParams="none" escapeAmp="false"><ww:param name="directoryID" value="directoryID" /><ww:param name="name" value="name" /></ww:url></ww:param>
    <ww:param name="submitLabel" value="getText('continue.label')" />
    <ww:param name="content" value="#formContent" />
</ww:component>

</body>
</html>
