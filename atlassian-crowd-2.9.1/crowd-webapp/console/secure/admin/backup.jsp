<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="/struts-tags" prefix="ww" %>
<html>
<head>
    <title><ww:property value="getText('menu.backup.label')"/></title>
    <meta name="section" content="administration" />
    <meta name="pagename" content="backup" />
    <meta name="help.url" content="<ww:property value="getText('help.admin.backup')"/>"/>
</head>

<body>
<h2><ww:property value="getText('menu.backup.label')"/></h2>

<ww:set name="formContent1">
    <h3><ww:property value="getText('administration.backup.automated.title')"/></h3>
    <h4><ww:text name="administration.backup.automated.notes" /></h4>
    <ul>
        <li><ww:text name="administration.backup.automated.location.info" /></li>
        <ww:if test="backupSummary.numBackups == 0">
            <li><ww:text name="administration.backup.automated.summary.nobackup" /></li>
        </ww:if>
        <ww:if test="backupSummary.numBackups > 0">
            <li><ww:text name="administration.backup.automated.summary">
                <ww:param name="value0" value="backupSummary.latestDate" />
                <ww:param name="value1" value="backupSummary.earliestDate" />
                <ww:param name="value2" value="backupSummary.numBackups" />
            </ww:text></li>
        </ww:if>
    </ul>

    <ww:checkbox name="enableScheduleBackups">
        <ww:param name="label" value="getText('administration.backup.automated.enable.description')"/>
    </ww:checkbox>
    <ww:select list="scheduledBackupTimes" name="scheduledBackupTime" listKey="key" listValue="value">
        <ww:param name="label" value="getText('administration.backup.automated.time')"/>
        <ww:param name="required" value="true"/>
        <ww:param name="description">
            <ww:text name="administration.backup.automated.serverTime">
                <ww:param name="value0" value="serverCurrentDate" />
            </ww:text>
        </ww:param>
        <ww:param name="fieldWidth" value="'short'"/>
    </ww:select>
</ww:set>
<ww:component template="form.jsp" id="scheduledBackup">
    <ww:param name="action"><ww:url namespace="/console/secure/admin" action="backup" method="scheduledBackup" includeParams="none" /></ww:param>
    <ww:param name="isPrimary" value="false" />
    <ww:param name="content" value="#formContent1" />
</ww:component>

<ww:set name="formContent2">
    <h3><ww:property value="getText('administration.backup.manual.title')"/></h3>
    <p><ww:text name="administration.backup.text"/></p>

    <ww:if test="exportResponseMessage != null" >
        <div class="aui-message success">
            <p class="title"><ww:property value="exportResponseMessage"/></p>
            <span class="aui-icon icon-success"></span>
        </div>
    </ww:if>

    <ww:checkbox name="resetDomain" fieldValue="true">
        <ww:param name="label" value="getText('administration.backup.resetdomain.label')"/>
        <ww:param name="description">
            <ww:property value="getText('administration.backup.resetdomain.description')"/>
        </ww:param>
    </ww:checkbox>

    <ww:textfield name="exportFileName" size="75">
        <ww:param name="label" value="getText('administration.backup.filename.label')"/>
        <ww:param name="description">
            <ww:property value="getText('administration.backup.filename.pathinfo')"/>
        </ww:param>
        <ww:param name="fieldWidth" value="'long'"/>
    </ww:textfield>
</ww:set>
<ww:component template="form.jsp" id="export">
    <ww:param name="action"><ww:url namespace="/console/secure/admin" action="backup" method="export" includeParams="none" /></ww:param>
    <ww:param name="submitLabel" value="getText('submit.label')" />
    <ww:param name="submitName" value="'manualBackup'" />
    <ww:param name="isPrimary" value="false" />
    <ww:param name="content" value="#formContent2" />
</ww:component>
</body>
</html>
