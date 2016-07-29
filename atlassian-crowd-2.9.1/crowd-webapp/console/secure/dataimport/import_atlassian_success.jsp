<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="/struts-tags" prefix="ww" %>
<html>
<head>
    <title><ww:text name="dataimport.importatlassian.title"/></title>
    <meta name="section" content="dataimport"/>
    <meta name="help.url" content="<ww:text name="help.user.import.atlassian.results"/>"/>
</head>
<body>

<ww:set name="progressTracker">
    <ww:component template="progress-tracker.jsp">
        <ww:param name="steps" value="getProgressSteps(2)" />
    </ww:component>
</ww:set>
<ww:component template="header.jsp">
    <ww:param name="mainContent">
        <h2><ww:text name="dataimport.importatlassian.title"/></h2>
    </ww:param>
    <ww:param name="actionsContent" value="#progressTracker" />
</ww:component>

<ww:component template="form_messages.jsp"/>

<p><ww:text name="dataimport.atlassianimportsuccess.text"/></p>

<p id="users-imported"><ww:text name="dataimport.importusercount.label"/>:&nbsp;<ww:property value="result.usersImported"/></p>
<ww:if test="result.usersAlreadyExist != null && result.usersAlreadyExist.size > 0">
    <p id="users-already-exist">
        <ww:text name="dataimport.importusersalreadyexist.label"/>:&nbsp;
        <ww:iterator value="result.usersAlreadyExist" status="rowstatus">
            <ww:property/><ww:if test="!#rowstatus.last">,</ww:if>
        </ww:iterator>
    </p>
</ww:if>
<ww:if test="result.usersFailedImport != null && result.usersFailedImport.size > 0">
    <p id="users-failed-import"><ww:text name="dataimport.importusersfailed.label"/>:&nbsp;
        <ww:iterator value="result.usersFailedImport" status="rowstatus">
            <ww:property/><ww:if test="!#rowstatus.last">,</ww:if>
        </ww:iterator>
    </p>
</ww:if>

<p id="groups-imported"><ww:text name="dataimport.importgroupcount.label"/>:&nbsp;<ww:property value="result.groupsImported"/></p>
<ww:if test="result.groupsAlreadyExist != null && result.groupsAlreadyExist.size > 0">
    <p id="groups-already-exist"><ww:text name="dataimport.importgroupsalreadyexist.label"/>:&nbsp;
        <ww:iterator value="result.groupsAlreadyExist" status="rowstatus">
            <ww:property/><ww:if test="!#rowstatus.last">,</ww:if>
        </ww:iterator>
    </p>
</ww:if>
<ww:if test="result.groupsFailedImport != null && result.groupsFailedImport.size > 0">
    <p id="groups-failed-import"><ww:text name="dataimport.importgroupsfailed.label"/>:&nbsp;
        <ww:iterator value="result.groupsFailedImport" status="rowstatus">
            <ww:property/><ww:if test="!#rowstatus.last">,</ww:if>
        </ww:iterator>
    </p>
</ww:if>

<p id="memberships-imported"><ww:text name="dataimport.importgroupmemberships.label"/>:&nbsp;<ww:property value="result.groupMembershipsImported"/></p>

<ww:if test="result.membershipsFailedImport != null && result.membershipsFailedImport.size > 0">
    <p id="memberships-failed-import"><ww:text name="dataimport.importgroupmembershipfailed.label"/>:&nbsp;
        <ww:iterator value="result.membershipsFailedImport" status="rowstatus">
            <ww:property/><ww:if test="!#rowstatus.last">,</ww:if>
        </ww:iterator>
    </p>
</ww:if>

</body>
</html>
