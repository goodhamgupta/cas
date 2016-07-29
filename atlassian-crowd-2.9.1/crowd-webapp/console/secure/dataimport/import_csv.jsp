<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="/struts-tags" prefix="ww" %>
<html>
<head>
    <title><ww:property value="getText('dataimport.csv.title')"/></title>
    <meta name="section" content="dataimport"/>
    <meta name="help.url" content="<ww:property value="getText('help.user.import.csv')"/>"/>
</head>
<body>

<ww:set name="progressTracker">
    <ww:component template="progress-tracker.jsp">
        <ww:param name="steps" value="getProgressSteps(1)" />
    </ww:component>
</ww:set>
<ww:component template="header.jsp">
    <ww:param name="mainContent">
        <h2><ww:property value="getText('dataimport.csv.title')"/></h2>
    </ww:param>
    <ww:param name="actionsContent" value="#progressTracker" />
</ww:component>

<h3><ww:property value="getText('dataimport.csv.import.text')"/></h3>
<ww:set name="formContent">
    <ww:select name="directoryID" list="directories" listKey="id" listValue="name">
        <ww:param name="label" value="getText('dataimport.importdirectory.label')"/>
        <ww:param name="description">
            <ww:property value="getText('dataimport.importdirectory.description')"/>
        </ww:param>
        <ww:param name="required" value="true"/>
    </ww:select>
    <ww:radio list="passwordsEncrypted" name="encryptedPasswords" required="true" listKey="key" listValue="value">
        <ww:param name="legend" value="getText('dataimport.csv.encryptedpasswords.label')" />
        <ww:param name="description" value="getText('dataimport.csv.encryptedpasswords.description')" />
    </ww:radio>
    <ww:textfield name="delimiter">
        <ww:param name="fieldWidth" value="'short'"/>
        <ww:param name="required" value="true"/>
        <ww:param name="maxlength" value="1"/>
        <ww:param name="cssStyle" value="'text-align:center;'"/>
        <ww:param name="label" value="getText('dataimport.csv.delimiter.label')"/>
        <ww:param name="description" value="getText('dataimport.csv.delimiter.description')"/>
    </ww:textfield>
    <ww:textfield name="users" required="true">
        <ww:param name="label" value="getText('dataimport.csv.userfile.label')"/>
        <ww:param name="description" value="getText('dataimport.csv.userfile.description')"/>
        <ww:param name="fieldWidth" value="'long'"/>
    </ww:textfield>
    <ww:textfield name="groupMemberships">
        <ww:param name="label" value="getText('dataimport.csv.groupmembershipfile.label')"/>
        <ww:param name="fieldWidth" value="'long'"/>
        <ww:param name="description" value="getText('dataimport.csv.groupmembershipfile.description')"/>
    </ww:textfield>
</ww:set>
<ww:component template="form.jsp" id="dataimport">
    <ww:param name="action"><ww:url namespace="/console/secure/dataimport" action="importcsv" method="doExecute" includeParams="none"/></ww:param>
    <ww:param name="content" value="#formContent" />
    <ww:param name="submitLabel" value="getText('continue.label')" />
    <ww:param name="cancelUri"><ww:url namespace="/console/secure/dataimport" action="importtype" method="default" includeParams="none" /></ww:param>
</ww:component>

</body>
</html>
