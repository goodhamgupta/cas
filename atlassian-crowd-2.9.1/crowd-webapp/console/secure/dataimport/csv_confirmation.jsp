<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="/struts-tags" prefix="ww" %>
<html>
<head>
    <title><ww:property value="getText('dataimport.csv.title')"/></title>
    <meta name="section" content="dataimport"/>
    <meta name="help.url" content="<ww:property value="getText('help.user.import.csv.confirm')"/>"/>
</head>
<body>

<ww:set name="progressTracker">
    <ww:component template="progress-tracker.jsp">
        <ww:param name="steps" value="getProgressSteps(3)" />
    </ww:component>
</ww:set>
<ww:component template="header.jsp">
    <ww:param name="mainContent">
        <h2><ww:property value="getText('dataimport.csv.title')"/></h2>
    </ww:param>
    <ww:param name="actionsContent" value="#progressTracker" />
</ww:component>

<h3><ww:property value="getText('dataimport.csv.configuration.confirmation.text')"/></h3>
<ww:set name="formContent">
    <p>
        <ww:text name="dataimport.csv.configuration.directoryconfirmation.text">
            <ww:param><ww:property value="directoryName"/></ww:param>
        </ww:text>
    </p>
    <p>
        <ww:text name="dataimport.csv.configuration.userfile.label">
            <ww:param><ww:property value="configuration.users.absolutePath"/></ww:param>
        </ww:text>
    </p>
    <p>
        <ww:if test="configuration.groupMemberships.absolutePath != null">
            <ww:text name="dataimport.csv.configuration.groupmembershipfile.label">
                <ww:param><ww:property value="configuration.groupMemberships.absolutePath"/></ww:param>
            </ww:text>
        </ww:if>
    </p>
    <p>
        <ww:set name="encryptingPasswords" value="encryptingPasswords"/>
        <ww:if test="#encryptingPasswords != null">
            <ww:text name="dataimport.csv.configuration.passwordencrypted.label">
                <ww:param name="0"><ww:property value="#encryptingPasswords"/></ww:param>
            </ww:text>
        </ww:if>
    </p>
    <ww:if test="configuration.userMappingConfiguration != null">
        <table id="usermappings" class="aui">
            <caption><ww:text name="dataimport.csv.configuration.usermapping.label"/></caption>
            <thead>
                <tr>
                    <th width="50%"><ww:text name="dataimport.csv.configuration.headerrow"/></th>
                    <th width="50%"><ww:text name="dataimport.csv.configuration.mapping"/></th>
                </tr>
            </thead>
            <ww:iterator value="configuration.userMappingConfiguration">
                <tr>
                    <td><ww:property value="getHeaderRowValue(key, false)"/></td>
                    <td><ww:property value="getText(value)"/></td>
                </tr>
            </ww:iterator>
        </table>
    </ww:if>

    <ww:if test="configuration.groupMappingConfiguration != null">
        <table id="groupmappings" class="aui">
            <caption><ww:text name="dataimport.csv.configuration.groupmapping.label"/></caption>
            <thead>
                <tr>
                    <th width="50%"><ww:text name="dataimport.csv.configuration.headerrow"/></th>
                    <th width="50%"><ww:text name="dataimport.csv.configuration.mapping"/></th>
                </tr>
            </thead>
            <ww:iterator value="configuration.groupMappingConfiguration">
                <tr>
                    <td><ww:property value="getHeaderRowValue(key, true)"/></td>
                    <td><ww:property value="getText(value)"/></td>
                </tr>
            </ww:iterator>
        </table>
    </ww:if>
</ww:set>
<ww:component template="form.jsp" id="dataimport">
    <ww:param name="action"><ww:url namespace="/console/secure/dataimport" action="csvconfirm" method="doExecute" includeParams="none"/></ww:param>
    <ww:param name="content" value="#formContent" />
    <ww:param name="submitLabel" value="getText('continue.label')" />
    <ww:param name="cancelUri"><ww:url action="csvmapping" namespace="/console/secure/dataimport" method="default"/></ww:param>
    <ww:param name="cancelLabel" value="getText('previous.label')" />
    <ww:param name="isTopLabels" value="true" />
</ww:component>

</body>
</html>
