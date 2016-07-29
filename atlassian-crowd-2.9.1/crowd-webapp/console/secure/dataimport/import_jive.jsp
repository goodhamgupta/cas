<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="/struts-tags" prefix="ww" %>
<html>
<head>
    <title><ww:property value="getText('directory.importjive.title')"/></title>
    <meta name="section" content="dataimport"/>
    <meta name="help.url" content="<ww:property value="getText('help.user.import.jive')"/>"/>
</head>
<body>

<ww:set name="progressTracker">
    <ww:component template="progress-tracker.jsp">
        <ww:param name="steps" value="getProgressSteps(1)" />
    </ww:component>
</ww:set>
<ww:component template="header.jsp">
    <ww:param name="mainContent">
        <h2><ww:property value="getText('directory.importjive.title')"/></h2>
    </ww:param>
    <ww:param name="actionsContent" value="#progressTracker" />
</ww:component>

<p><ww:property value="getText('directory.importjive.text')"/></p>
<ww:set name="formContent">
    <ww:select name="directoryID" list="directories" listKey="id" listValue="name">
        <ww:param name="label" value="getText('dataimport.importdirectory.label')"/>
        <ww:param name="description">
            <ww:property value="getText('dataimport.importdirectory.description')"/>
        </ww:param>
    </ww:select>
    <ww:textfield name="url" size="50">
        <ww:param name="label" value="getText('directory.importjivedburl.label')"/>
        <ww:param name="fieldWidth" value="'long'"/>
    </ww:textfield>
    <ww:textfield name="driver" size="50">
        <ww:param name="label" value="getText('directory.importjivedriver.label')"/>
        <ww:param name="fieldWidth" value="'long'"/>
    </ww:textfield>
    <ww:textfield name="username">
        <ww:param name="label" value="getText('directory.importjivedbusername.label')"/>
    </ww:textfield>
    <ww:password name="password">
        <ww:param name="label" value="getText('directory.importjivedbpassword.label')"/>
    </ww:password>
</ww:set>
<ww:component template="form.jsp">
    <ww:param name="action"><ww:url namespace="/console/secure/dataimport" action="importjive" method="update" includeParams="none" /></ww:param>
    <ww:param name="content" value="#formContent" />
    <ww:param name="submitLabel" value="getText('continue.label')" />
    <ww:param name="cancelUri">
        <ww:if test="directory.type.code == 1">
            <ww:url namespace="/console/secure/directory" action="viewinternal" method="default" includeParams="none"><ww:param name="ID" value="directoryID" /></ww:url>
        </ww:if>
        <ww:elseif test="directory.type.code == 2">
            <ww:url namespace="/console/secure/directory" action="viewconnector" method="default" includeParams="none"><ww:param name="ID" value="directoryID" /></ww:url>
        </ww:elseif>
        <ww:else>
            <ww:url namespace="/console/secure/dataimport" action="importtype" method="default" includeParams="none" />
        </ww:else>
    </ww:param>
</ww:component>

</body>
</html>
