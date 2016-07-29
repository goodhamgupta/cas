<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="/struts-tags" prefix="ww" %>
<html>
<head>
    <title><ww:text name="dataimport.importdirectory.title"/></title>
    <meta name="section" content="dataimport"/>
    <meta name="help.url" content="<ww:property value="getText('help.user.import.directory.confirm')"/>"/>
</head>
<body>

<ww:set name="progressTracker">
    <ww:component template="progress-tracker.jsp">
        <ww:param name="steps" value="getProgressSteps(2)" />
    </ww:component>
</ww:set>
<ww:component template="header.jsp">
    <ww:param name="mainContent">
        <h2><ww:text name="dataimport.importdirectory.title"/></h2>
    </ww:param>
    <ww:param name="actionsContent" value="#progressTracker" />
</ww:component>

<h3><ww:text name="dataimport.directory.confirmation.text"/></h3>
<p>
    <ww:text name="dataimport.directory.source.confirmation.directory.text">
        <ww:param><ww:property value="sourceDirectoryName"/></ww:param>
    </ww:text>
</p>
<p>
    <ww:text name="dataimport.directory.target.confirmation.directory.text">
        <ww:param><ww:property value="targetDirectoryName"/></ww:param>
    </ww:text>
</p>
<p>
    <ww:text name="dataimport.directory.overwrite.confirmation.directory.text">
        <ww:param><ww:property value="overwriteDirectory"/></ww:param>
    </ww:text>
</p>
<p id="import-nested-group">
    <ww:if test="doNestedGroupImport">
        <ww:text name="dataimport.importnestedgroup.text"/>
    </ww:if>
    <ww:else>
        <ww:text name="dataimport.importnestedgroup.not.text"/>
    </ww:else>
</p>
<ww:component template="form.jsp" id="dataimport">
    <ww:param name="action"><ww:url namespace="/console/secure/dataimport" action="directoryconfirmation" method="doExecute" includeParams="none"/></ww:param>
    <ww:param name="submitLabel" value="getText('continue.label')" />
    <ww:param name="isTopLabels" value="true" />
</ww:component>

</body>
</html>
