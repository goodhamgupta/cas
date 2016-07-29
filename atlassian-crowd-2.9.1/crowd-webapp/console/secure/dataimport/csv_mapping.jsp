<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="/struts-tags" prefix="ww" %>
<html>
<head>
    <title><ww:property value="getText('dataimport.csv.title')"/></title>
    <meta name="section" content="dataimport"/>
    <meta name="help.url" content="<ww:property value="getText('help.user.import.csv.mapping')"/>"/>    
</head>
<body>

<ww:set name="progressTracker">
    <ww:component template="progress-tracker.jsp">
        <ww:param name="steps" value="getProgressSteps(2)" />
    </ww:component>
</ww:set>
<ww:component template="header.jsp">
    <ww:param name="mainContent">
        <h2><ww:property value="getText('dataimport.csv.title')"/></h2>
    </ww:param>
    <ww:param name="actionsContent" value="#progressTracker" />
</ww:component>

<ww:set name="formContent">
    <p><ww:property value="getText('dataimport.csv.configuration.text')"/></p>
    <table id="principalsample" class="aui">
        <caption><ww:text name="dataimport.csv.configuration.usermapping.label" /></caption>
        <thead>
            <tr>
                <th width="15%"><ww:text name="dataimport.csv.configuration.headerrow" /></th>
                <th width="35%"><ww:text name="dataimport.csv.configuration.sampledata" /></th>
                <th width="50%"><ww:text name="dataimport.csv.configuration.mapping" /></th>
            </tr>
        </thead>
        <ww:iterator value="configuration.userHeaderRow" status="rowStatus">
            <tr>
                <td><ww:property /></td>
                <td><ww:property value="configuration.userSampleRow.get(#rowStatus.index)" /></td>
                <td>
                    <select id="user.<ww:property value="#rowStatus.index"/>" name="user.<ww:property value="#rowStatus.index"/>" class="select">
                        <ww:set name="selectIdValue" value="'user.' + #rowStatus.index"/>
                        <ww:iterator value="userMappingOptions">
                            <ww:set name="currentoptionkey" value="key"/>
                            <option id="<ww:property value="key"/>" value="<ww:property value="key"/>" <ww:if test="isUserMappingSelected(#selectIdValue, #currentoptionkey)">selected</ww:if> ><ww:property value="value"/></option>
                        </ww:iterator>
                    </select>
                </td>
            </tr>
        </ww:iterator>
    </table>
    <ww:if test="configuration.groupMemberships != null" >
        <table id="groupsample" class="aui">
            <caption><ww:text name="dataimport.csv.configuration.groupmapping.label" /></caption>
            <thead>
                <tr>
                    <th width="15%"><ww:text name="dataimport.csv.configuration.headerrow" /></th>
                    <th width="35%"><ww:text name="dataimport.csv.configuration.sampledata" /></th>
                    <th width="50%"><ww:text name="dataimport.csv.configuration.mapping" /></th>
                </tr>
            </thead>
            <ww:iterator value="configuration.groupHeaderRow" status="rowStatus">
                <tr>
                    <td><ww:property /></td>
                    <td><ww:property value="configuration.groupSampleRow.get(#rowStatus.index)" /></td>
                    <td>
                        <select id="group.<ww:property value="#rowStatus.index"/>" name="group.<ww:property value="#rowStatus.index"/>" class="select">
                            <ww:set name="selectIdValue" value="'group.' + #rowStatus.index"/>
                            <ww:iterator value="groupMappingOptions">
                                <ww:set name="currentoptionkey" value="key"/>
                                <option id="<ww:property value="key"/>" value="<ww:property value="key"/>" <ww:if test="isGroupMappingSelected(#selectIdValue, #currentoptionkey)">selected</ww:if>><ww:property value="value"/></option>
                            </ww:iterator>
                        </select>
                    </td>
                </tr>
            </ww:iterator>
        </table>
    </ww:if>
</ww:set>
<ww:component template="form.jsp" id="dataimport">
    <ww:param name="action"><ww:url namespace="/console/secure/dataimport" action="csvmapping" method="doExecute" includeParams="none"/></ww:param>
    <ww:param name="content" value="#formContent" />
    <ww:param name="submitLabel" value="getText('continue.label')" />
    <ww:param name="cancelUri"><ww:url action="importcsv" namespace="/console/secure/dataimport" method="default"/></ww:param>
    <ww:param name="cancelLabel" value="getText('previous.label')" />
    <ww:param name="isTopLabels" value="true" />
</ww:component>

</body>
</html>
