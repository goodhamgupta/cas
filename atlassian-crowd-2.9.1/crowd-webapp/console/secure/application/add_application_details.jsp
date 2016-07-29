<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="/struts-tags" prefix="ww" %>
<html>
<head>
    <title><ww:property value="getText('menu.addapplication.label')"/></title>
    <meta name="section" content="applications"/>
    <meta name="pagename" content="add"/>
    <meta name="help.url" content="<ww:property value="getText('help.application.add')"/>"/>
</head>
<body>

<ww:set name="progressTracker">
    <ww:component template="progress-tracker.jsp">
        <ww:param name="steps" value="progressSteps" />
    </ww:component>
</ww:set>

<ww:component template="header.jsp">
    <ww:param name="mainContent">
        <h2><ww:property value="getText('menu.addapplication.label')"/></h2>
    </ww:param>
    <ww:param name="actionsContent" value="#progressTracker" />
</ww:component>

<ww:set name="formContent">
    <ww:select list="applicationTypes" name="applicationType" listKey="key" listValue="value">
        <ww:param name="emptyOption" value="getText('application.type.empty.option')"/>
        <ww:param name="label" value="getText('application.type.label')"/>
        <ww:param name="required" value="true"/>
        <ww:param name="description">
            <ww:property value="getText('application.type.description')"/>
        </ww:param>
    </ww:select>
    <ww:textfield name="name" size="35">
        <ww:param name="label" value="getText('application.name.label')"/>
        <ww:param name="required" value="true"/>
        <ww:param name="description">
            <ww:property value="getText('application.name.description')"/>
        </ww:param>
    </ww:textfield>
    <ww:textfield name="description" size="35">
        <ww:param name="label" value="getText('application.description.label')"/>
        <ww:param name="description">
            <ww:property value="getText('application.description.description')"/>
        </ww:param>
    </ww:textfield>
    <ww:password name="password" size="35">
        <ww:param name="label" value="getText('password.label')"/>
        <ww:param name="required" value="true"/>
    </ww:password>
    <ww:password name="passwordConfirmation" size="35">
        <ww:param name="label" value="getText('passwordconfirm.label')"/>
        <ww:param name="required" value="true"/>
    </ww:password>
</ww:set>
<ww:component template="form.jsp">
    <ww:param name="action"><ww:url namespace="/console/secure/application" action="addapplicationdetails" method="completeStep" /></ww:param>
    <ww:param name="cancelUri"><ww:url namespace="/console/secure/application" action="addapplicationdetails" method="cancel" /></ww:param>
    <ww:param name="submitLabel" value="getText('next.label')" />
    <ww:param name="content" value="#formContent" />
</ww:component>

</body>
</html>
