<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="/struts-tags" prefix="ww" %>
<html>
<head>
    <title><ww:text name="dataimport.importdirectory.title"/></title>
    <meta name="section" content="dataimport"/>
    <meta name="help.url" content="<ww:property value="getText('help.user.import.directory.results')"/>"/>
</head>

<body>

<ww:set name="progressTracker">
    <ww:component template="progress-tracker.jsp">
        <ww:param name="steps" value="getProgressSteps(3)" />
    </ww:component>
</ww:set>
<ww:component template="header.jsp">
    <ww:param name="mainContent">
        <h2><ww:text name="dataimport.importdirectory.title"/></h2>
    </ww:param>
    <ww:param name="actionsContent" value="#progressTracker" />
</ww:component>

<ww:set name="formContent">
    <p><ww:text name="dataimport.atlassianimportsuccess.text"/></p>

    <ww:component template="form_row.jsp">
        <ww:param name="label" value="getText('dataimport.importusercount.label')"/>
        <ww:param name="valueid" value="'users-imported'"/>
        <ww:param name="value">
            <ww:property value="result.usersImported"/>
        </ww:param>
        <ww:param name="escapeValue" value="false" />
    </ww:component>

    <ww:if test="result.usersAlreadyExist != null && result.usersAlreadyExist.size > 0">
        <ww:component template="form_row.jsp">
            <ww:param name="label" value="getText('dataimport.importusersalreadyexist.label')"/>
            <ww:param name="value">
                <ww:iterator value="result.usersAlreadyExist" status="rowstatus">
                    <ww:property/><ww:if test="!#rowstatus.last">,</ww:if>
                </ww:iterator>
            </ww:param>
            <ww:param name="escapeValue" value="false" />
        </ww:component>
    </ww:if>

    <ww:if test="result.usersFailedImport != null && result.usersFailedImport.size > 0">
        <ww:component template="form_row.jsp">
            <ww:param name="label" value="getText('dataimport.importusersfailed.label')"/>
            <ww:param name="value">
                <ww:iterator value="result.usersFailedImport" status="rowstatus">
                    <ww:property/><ww:if test="!#rowstatus.last">,</ww:if>
                </ww:iterator>
            </ww:param>
            <ww:param name="escapeValue" value="false" />
        </ww:component>
    </ww:if>

    <ww:component template="form_row.jsp">
        <ww:param name="label" value="getText('dataimport.importgroupcount.label')"/>
        <ww:param name="valueid" value="'groups-imported'"/>
        <ww:param name="value">
            <ww:property value="result.groupsImported"/>
        </ww:param>
        <ww:param name="escapeValue" value="false" />
    </ww:component>

    <ww:if test="result.groupsAlreadyExist != null && result.groupsAlreadyExist.size > 0">
        <ww:component template="form_row.jsp">
            <ww:param name="label" value="getText('dataimport.importgroupsalreadyexist.label')"/>
            <ww:param name="value">
                <ww:iterator value="result.groupsAlreadyExist" status="rowstatus">
                    <ww:property/><ww:if test="!#rowstatus.last">,</ww:if>
                </ww:iterator>
            </ww:param>
            <ww:param name="escapeValue" value="false" />
        </ww:component>
    </ww:if>

    <ww:if test="result.groupsFailedImport != null && result.groupsFailedImport.size > 0">
        <ww:component template="form_row.jsp">
            <ww:param name="label" value="getText('dataimport.importgroupsfailed.label')"/>
            <ww:param name="value">
                <ww:iterator value="result.groupsFailedImport" status="rowstatus">
                    <ww:property/><ww:if test="!#rowstatus.last">,</ww:if>
                </ww:iterator>
            </ww:param>
            <ww:param name="escapeValue" value="false" />
        </ww:component>
    </ww:if>

    <ww:component template="form_row.jsp">
        <ww:param name="label" value="getText('dataimport.importgroupmemberships.label')"/>
        <ww:param name="valueid" value="'memberships-imported'"/>
        <ww:param name="value">
            <ww:property value="result.groupMembershipsImported"/>
        </ww:param>
        <ww:param name="escapeValue" value="false" />
    </ww:component>

    <ww:if test="result.groupMembershipsFailedImport != null && result.groupMembershipsFailedImport.size > 0">
        <ww:component template="form_row.jsp">
            <ww:param name="label" value="getText('dataimport.importgroupmembershipfailed.label')"/>
            <ww:param name="value">
                <ww:iterator value="result.groupMembershipsFailedImport" status="rowstatus">
                    <ww:property/><ww:if test="!#rowstatus.last">,</ww:if>
                </ww:iterator>
            </ww:param>
            <ww:param name="escapeValue" value="false" />
        </ww:component>
    </ww:if>
</ww:set>
<ww:component template="form.jsp">
    <ww:param name="action" value="''" />
    <ww:param name="content" value="#formContent" />
    <ww:param name="includeSubmitButton" value="false" />
</ww:component>

</body>
</html>
