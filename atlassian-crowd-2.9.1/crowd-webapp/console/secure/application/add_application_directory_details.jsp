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
        <h2><ww:property value="getText('menu.addapplication.label')"/> - <ww:property value="configuration.name"/></h2>
    </ww:param>
    <ww:param name="actionsContent" value="#progressTracker" />
</ww:component>

<ww:set name="formContent">
    <p><ww:text name="application.directories.description"/></p>
    <ww:checkboxlist list="directories" listKey="id" listValue="name" name="selecteddirectories">
        <ww:param name="listDescription" value="'implementationDescriptiveName'" />
    </ww:checkboxlist>
</ww:set>
<ww:component template="form.jsp">
    <ww:param name="action"><ww:url namespace="/console/secure/application" action="addapplicationdirectorydetails" method="completeStep" includeParams="none" /></ww:param>
    <ww:param name="cancelUri"><ww:url namespace="/console/secure/application" action="addapplicationdetails" method="cancel" /></ww:param>
    <ww:param name="submitLabel" value="getText('next.label')" />
    <ww:param name="isTopLabels" value="true" />
    <ww:param name="content" value="#formContent" />
</ww:component>

</body>
</html>
