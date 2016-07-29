<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="/struts-tags" prefix="ww" %>
<html>
<head>
    <title>
        <ww:text name="menu.viewdirectory.label">
            <ww:param><ww:property value="directory.name"/></ww:param>
        </ww:text>
    </title>
    <meta name="section" content="directories"/>
    <meta name="pagename" content="view"/>
    <meta name="help.url" content="<ww:text name="help.directory.internal.configuration"/>"/>
</head>
<body>
<h2>
    <ww:text name="menu.viewdirectory.label">
        <ww:param><ww:property value="directory.name"/></ww:param>
    </ww:text>
</h2>

<div class="aui-tabs horizontal-tabs aui-tabs-disabled">
    <jsp:include page="inc_tabs_internal.jsp">
        <jsp:param name="selectedTab" value="2" />
    </jsp:include>
    <div class="tabs-pane active-pane">
        <ww:set name="formContent">
            <ww:textfield name="passwordRegex" size="50">
                <ww:param name="label" value="getText('directoryinternal.passwordregex.label')"/>
                <ww:param name="description">
                    <ww:property value="getText('directoryinternal.passwordregex.description')"/>
                </ww:param>
            </ww:textfield>
            <ww:textfield name="passwordComplexityMessage" size="50">
                <ww:param name="label" value="getText('directoryinternal.passwordcomplexity.help.label')"/>
                <ww:param name="description">
                    <ww:property value="getText('directoryinternal.passwordcomplexity.help.description')"/>
                </ww:param>
            </ww:textfield>
            <ww:textfield name="passwordMaxAttempts">
                <ww:param name="label" value="getText('directoryinternal.passwordmaxattempts.label')"/>
                <ww:param name="type" value="'number'" />
                <ww:param name="fieldWidth" value="'short'"/>
                <ww:param name="description">
                    <ww:property value="getText('directoryinternal.passwordmaxattempts.description')"/>
                </ww:param>
            </ww:textfield>
            <ww:textfield name="passwordMaxChangeTime">
                <ww:param name="label" value="getText('directoryinternal.passwordmaxchangetime.label')"/>
                <ww:param name="type" value="'number'" />
                <ww:param name="fieldWidth" value="'short'"/>
                <ww:param name="description">
                    <ww:property value="getText('directoryinternal.passwordmaxchangetime.description')"/>
                </ww:param>
            </ww:textfield>
            <ww:textfield name="passwordHistoryCount">
                <ww:param name="label" value="getText('directoryinternal.passwordhistorycount.label')"/>
                <ww:param name="type" value="'number'" />
                <ww:param name="fieldWidth" value="'short'"/>
                <ww:param name="description">
                    <ww:property value="getText('directoryinternal.passwordhistorycount.description')"/>
                </ww:param>
            </ww:textfield>
            <ww:component template="form_row.jsp">
                <ww:param name="label" value="getText('directoryconnector.userencryptionmethod.label')"/>
                <ww:param name="value" value="userEncryptionMethod"/>
            </ww:component>
            <ww:checkbox name="useNestedGroups" fieldValue="true">
                <ww:param name="label" value="getText('directoryinternal.nestedgroups.disable.label')"/>
                <ww:param name="description">
                    <ww:property value="getText('directoryinternal.nestedgroups.disable.description')"/>
                </ww:param>
            </ww:checkbox>
            <input type="hidden" name="ID" value="<ww:property value="ID" />"/>
        </ww:set>
        <ww:component template="form.jsp" id="updateConfiguration">
            <ww:param name="action"><ww:url namespace="/console/secure/directory" action="updateinternalconfiguration" method="update" includeParams="none" /></ww:param>
            <ww:param name="content" value="#formContent" />
            <ww:param name="cancelUri"><ww:url namespace="/console/secure/directory" action="viewinternal" method="default" includeParams="none" ><ww:param name="ID" value="ID" /></ww:url></ww:param>
        </ww:component>
    </div>
</div>

</body>
</html>
