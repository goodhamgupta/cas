<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="/struts-tags" prefix="ww" %>
<html>
<head>
    <title><ww:property value="getText('menu.addprincipal.label')"/></title>
    <meta name="section" content="users"/>
    <meta name="pagename" content="adduser"/>
    <meta name="help.url" content="<ww:property value="getText('help.user.add')"/>"/>    
</head>
<body>

<h2><ww:property value="getText('menu.addprincipal.label')"/></h2>
<ww:set name="formContent">
    <ww:textfield name="email" size="50">
        <ww:param name="label" value="getText('principal.email.label')"/>
        <ww:param name="type" value="'email'"/>
        <ww:param name="required" value="true"/>
    </ww:textfield>
    <ww:checkbox name="active" fieldValue="true">
        <ww:param name="label" value="getText('principal.active.label')"/>
    </ww:checkbox>
    <ww:textfield name="name">
        <ww:param name="label" value="getText('principal.name.label')"/>
        <ww:param name="description">
            <ww:property value="getText('principal.name.description')"/>
        </ww:param>
        <ww:param name="required" value="true"/>
    </ww:textfield>
    <ww:password name="password">
        <ww:param name="label" value="getText('principal.password.label')"/>
        <ww:param name="required" value="true"/>
    </ww:password>
    <ww:password name="passwordConfirm">
        <ww:param name="label" value="getText('principal.passwordconfirm.label')"/>
        <ww:param name="required" value="true"/>
    </ww:password>
    <ww:textfield name="firstname">
        <ww:param name="label" value="getText('principal.firstname.label')"/>
        <ww:param name="required" value="true"/>
    </ww:textfield>
    <ww:textfield name="lastname">
        <ww:param name="label" value="getText('principal.lastname.label')"/>
        <ww:param name="required" value="true"/>
    </ww:textfield>
    <ww:select name="directoryID" list="directories" listKey="id" listValue="name">
        <ww:param name="headerKey" value="directoryID == -1 ? -1 : null"/>
        <ww:param name="headerValue" value="getText('selectdirectory.label')"/>
        <ww:param name="label" value="getText('principal.directory.label')"/>
        <ww:param name="description">
            <ww:property value="getText('principal.directory.description')"/>
        </ww:param>
        <ww:param name="required" value="true"/>
    </ww:select>
</ww:set>
<ww:component template="form.jsp">
    <ww:param name="action"><ww:url namespace="/console/secure/user" action="add" method="update" includeParams="none" /></ww:param>
    <ww:param name="content" value="#formContent" />
    <ww:param name="cancelUri"><ww:url namespace="/console/secure/user" action="browse" includeParams="none" /></ww:param>
    <ww:param name="submitLabel" value="getText('create.label')" />
</ww:component>

</body>
</html>
