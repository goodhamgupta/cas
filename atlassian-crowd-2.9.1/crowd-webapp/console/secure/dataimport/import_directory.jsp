<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="/struts-tags" prefix="ww" %>
<html>
<head>
    <title><ww:text name="dataimport.importdirectory.title"/></title>
    <meta name="section" content="dataimport"/>
    <meta name="help.url" content="<ww:property value="getText('help.user.import.directory.options')"/>"/>
</head>
<body>

<ww:set name="progressTracker">
    <ww:component template="progress-tracker.jsp">
        <ww:param name="steps" value="getProgressSteps(1)" />
    </ww:component>
</ww:set>
<ww:component template="header.jsp">
    <ww:param name="mainContent">
        <h2><ww:text name="dataimport.importdirectory.title"/></h2>
    </ww:param>
    <ww:param name="actionsContent" value="#progressTracker" />
</ww:component>

<h3><ww:text name="dataimport.importdirectory.text"/></h3>
<ww:set name="formContent">
    <ww:select name="sourceDirectoryID" list="directories" listKey="id" listValue="name">
        <ww:param name="label" value="getText('dataimport.directory.sourcedirectory.label')"/>
        <ww:param name="description">
            <ww:property value="getText('dataimport.directory.sourcedirectory.description')"/>
        </ww:param>
        <ww:param name="required" value="true"/>
    </ww:select>
    <ww:select name="targetDirectoryID" list="directories" listKey="id" listValue="name">
        <ww:param name="label" value="getText('dataimport.directory.targetdirectory.label')"/>
        <ww:param name="description">
            <ww:property value="getText('dataimport.directory.targetdirectory.description')"/>
        </ww:param>
        <ww:param name="required" value="true"/>
    </ww:select>
    <ww:checkbox name="overwriteTarget" value="overwriteTarget" fieldValue="true" >
        <ww:param name="label" value="getText('dataimport.directory.overwritetarget.label')"/>
        <ww:param name="description">
            <ww:property value="getText('dataimport.directory.overwritetarget.description')"/>
        </ww:param>
    </ww:checkbox>
</ww:set>
<ww:component template="form.jsp" id="dataimport">
    <ww:param name="action"><ww:url namespace="/console/secure/dataimport" action="importdirectory" method="import" includeParams="none"/></ww:param>
    <ww:param name="content" value="#formContent" />
    <ww:param name="submitLabel" value="getText('continue.label')" />
    <ww:param name="cancelUri"><ww:url namespace="/console/secure/dataimport" action="importtype" method="default" includeParams="none" /></ww:param>
</ww:component>
</body>
</html>
