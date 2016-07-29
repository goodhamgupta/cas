<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="/struts-tags" prefix="ww" %>
<html>
<head>
    <title><ww:property value="getText('menu.addgroup.label')"/></title>
    <meta name="section" content="groups"/>
    <meta name="pagename" content="addgroup"/>
    <meta name="help.url" content="<ww:property value="getText('help.group.add')"/>"/>
</head>
<body>

<h2><ww:property value="getText('menu.addgroup.label')"/></h2>
<ww:set name="formContent">
    <ww:textfield name="name" size="35">
        <ww:param name="label" value="getText('group.name.label')"/>
        <ww:param name="description">
            <ww:property value="getText('group.name.description')"/>
        </ww:param>
        <ww:param name="required" value="true"/>
    </ww:textfield>
    <ww:textfield name="description" size="35">
        <ww:param name="label" value="getText('group.description.label')"/>
        <ww:param name="fieldWidth" value="'long'"/>
        <ww:param name="description">
            <ww:property value="getText('group.description.description')"/>
        </ww:param>
    </ww:textfield>
    <ww:select name="directoryID" list="directories" listKey="id" listValue="name">
        <ww:param name="headerKey" value="directoryID == -1 ? -1 : null"/>
        <ww:param name="headerValue" value="getText('selectdirectory.label')"/>
        <ww:param name="label" value="getText('group.directory.label')"/>
        <ww:param name="description">
            <ww:property value="getText('group.directory.description')"/>
        </ww:param>
        <ww:param name="required" value="true"/>
    </ww:select>
    <ww:checkbox name="active" fieldValue="true">
        <ww:param name="label" value="getText('group.active.label')"/>
    </ww:checkbox>
</ww:set>
<ww:component template="form.jsp" id="addGroupForm">
    <ww:param name="action"><ww:url namespace="/console/secure/group" action="add" method="update" includeParams="none" /></ww:param>
    <ww:param name="cancelUri"><ww:url namespace="/console/secure/group" action="browse" includeParams="none" /></ww:param>
    <ww:param name="submitLabel" value="getText('create.label')" />
    <ww:param name="content" value="#formContent" />
</ww:component>

</body>
</html>
