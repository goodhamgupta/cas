<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="/struts-tags" prefix="ww" %>
<html>
<head>
    <title><ww:property value="getText('dataimport.importatlassian.title')"/></title>
    <meta name="section" content="dataimport"/>
    <meta name="help.url" content="<ww:property value="getText('help.user.import.atlassian')"/>"/>
</head>

<ww:set name="progressTracker">
    <ww:component template="progress-tracker.jsp">
        <ww:param name="steps" value="progressStepsWithAdditional" />
    </ww:component>
</ww:set>
<ww:component template="header.jsp">
    <ww:param name="mainContent">
        <h2><ww:property value="getText('dataimport.importatlassian.title')"/></h2>
    </ww:param>
    <ww:param name="actionsContent" value="#progressTracker" />
</ww:component>

<h3><ww:property value="getText('dataimport.importatlassian.source.select')"/></h3>
<ww:set name="formContent">
    <ww:select name="configurationSourceDirectoryID" list="sourceDirectories" listKey="id" listValue="name">
        <ww:param name="label" value="getText('dataimport.directory.sourcedirectory.label')"/>
        <ww:param name="description">
            <ww:property value="getText('dataimport.importdirectory.source.description')"/>
        </ww:param>
        <ww:param name="required" value="true"/>
    </ww:select>
    <input type="hidden" name="configurationApplication" value="<ww:property value="configurationApplication" />"/>
    <input type="hidden" name="configurationDirectoryID" value="<ww:property value="configurationDirectoryID" />"/>
    <input type="hidden" name="configurationImportPasswords" value="<ww:property value="configurationImportPasswords" />"/>
    <input type="hidden" name="configurationDatabaseURL" value="<ww:property value="configurationDatabaseURL" />"/>
    <input type="hidden" name="configurationDatabaseDriver" value="<ww:property value="configurationDatabaseDriver" />"/>
    <input type="hidden" name="configurationUsername" value="<ww:property value="configurationUsername" />"/>
    <input type="hidden" name="configurationPassword" value="<ww:property value="configurationPassword" />"/>
</ww:set>
<ww:component template="form.jsp" id="dataimport">
    <ww:param name="action"><ww:url namespace="/console/secure/dataimport" action="importatlassian" method="import" includeParams="none"/></ww:param>
    <ww:param name="content" value="#formContent" />
    <ww:param name="submitLabel" value="getText('continue.label')" />
    <ww:param name="cancelUri"><ww:url namespace="/console/secure/dataimport" action="importtype" method="default" includeParams="none" /></ww:param>
</ww:component>

</body>
</html>
