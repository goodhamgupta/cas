<%@ page import="com.atlassian.crowd.console.action.directory.SynchroniseDirectoryCache" %>
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
    <meta name="help.url" content="<ww:property value="getText('help.directory.crowd.details')"/>"/>
    <ww:property value="webResourceManager.requireResource('crowd.web.resources:sync-feedback')"/>
</head>
<body>
<h2>
    <ww:text name="menu.viewdirectory.label">
        <ww:param><ww:property value="directory.name"/></ww:param>
    </ww:text>
</h2>

<div class="aui-tabs horizontal-tabs aui-tabs-disabled">
    <jsp:include page="inc_tabs_crowd.jsp">
        <jsp:param name="selectedTab" value="1" />
    </jsp:include>
    <div class="tabs-pane active-pane">
        <ww:set name="formContent">
            <ww:textfield name="name" size="50">
                <ww:param name="required" value="true"/>
                <ww:param name="label" value="getText('directoryinternal.name.label')"/>
                <ww:param name="description">
                    <ww:property value="getText('directoryinternal.name.description')"/>
                </ww:param>
            </ww:textfield>
            <ww:textfield name="directoryDescription" size="50">
                <ww:param name="label" value="getText('directoryinternal.description.label')"/>
                <ww:param name="fieldWidth" value="'long'"/>
                <ww:param name="description">
                    <ww:property value="getText('directoryinternal.description.description')"/>
                </ww:param>
            </ww:textfield>
            <ww:component template="form_row.jsp">
                <ww:param name="label" value="getText('directory.type.label')"/>
                <ww:param name="value" value="directoryImplementationDescriptiveName"/>
            </ww:component>
            <ww:checkbox name="active" fieldValue="true">
                <ww:param name="label" value="getText('directory.active.label')"/>
                <ww:param name="description">
                    <ww:property value="getText('directory.active.description')"/>
                </ww:param>
            </ww:checkbox>
            <ww:checkbox name="cacheEnabled" fieldValue="true">
                <ww:param name="label" value="getText('directory.caching.enabled.label')"/>
                <ww:param name="description">
                    <ww:property value="getText('directory.caching.enabled.description')"/>
                </ww:param>
            </ww:checkbox>
            <ww:checkbox name="useNestedGroups" fieldValue="true">
                <ww:param name="label" value="getText('directoryinternal.nestedgroups.disable.label')"/>
                <ww:param name="description">
                    <ww:property value="getText('directoryinternal.nestedgroups.disable.description')"/>
                </ww:param>
            </ww:checkbox>
            <input type="hidden" id="directory_id" name="ID" value="<ww:property value="ID" />"/>
        </ww:set>

        <ww:set name="lastSynchronisation">
            <h3>
                <span id="lastSyncLabel"<ww:if test="currentlySynchronising"> style="display: none;"</ww:if>><ww:property value="getText('directory.caching.sync.last.label')"/></span>
                <span id="activeSyncLabel"<ww:if test="!currentlySynchronising"> style="display: none;"</ww:if>><ww:property value="getText('directory.caching.sync.active.label')"/></span>
            </h3>
            <ww:component template="form_row.jsp">
                <ww:param name="label"><ww:property value="getText('directory.caching.sync.start.time.label')"/></ww:param>
                <ww:param name="value">
                    <span id="startTime"><ww:property value="synchronisationStartTime"/></span>
                </ww:param>
                <ww:param name="escapeValue" value="false" />
            </ww:component>
            <ww:component template="form_row.jsp">
                <ww:param name="label"><ww:property value="getText('directory.caching.sync.duration.label')"/></ww:param>
                <ww:param name="value">
                    <span id="duration"><ww:property value="synchronisationDuration"/></span>
                </ww:param>
                <ww:param name="escapeValue" value="false" />
            </ww:component>
            <ww:component template="form_row.jsp">
                <ww:param name="label"><ww:property value="getText('directory.caching.sync.status.label')"/></ww:param>
                <ww:param name="value">
                    <span id="status"><ww:property value="synchronisationStatus"/></span>
                </ww:param>
                <ww:param name="escapeValue" value="false" />
            </ww:component>
            <ww:component template="form_row.jsp">
                <ww:url namespace="/console/secure/directory" action="synchconnectorcache" method="default" includeParams="none" var="synchronizeNowUrl">
                    <ww:param name="ID" value="ID" />
                    <ww:param name="%{xsrfTokenName}" value="%{xsrfToken}"/>
                    <ww:param name="targetAction"><%=SynchroniseDirectoryCache.AllowedTargetAction.VIEW_REMOTE_CROWD%></ww:param>
                </ww:url>
                <ww:param name="value">
                    <input type="button" id="synchroniseDirectoryButton" class="aui-button" value="<ww:property value="getText('directory.caching.sync.now.label')"/>" onClick="window.location='<ww:property value="synchronizeNowUrl" escape="false" />';" />
                </ww:param>
                <ww:param name="escapeValue" value="false" />
            </ww:component>
        </ww:set>

        <ww:if test="cacheEnabled && active">
            <ww:component template="form.jsp" id="updateGeneral">
                <ww:param name="action"><ww:url namespace="/console/secure/directory" action="updateremotecrowd" includeParams="none" /></ww:param>
                <ww:param name="content" value="#formContent" />
                <ww:param name="belowButtonContent" value="#lastSynchronisation" />
                <ww:param name="cancelUri"><ww:url namespace="/console/secure/directory" action="viewremotecrowd" method="default" includeParams="none" ><ww:param name="ID" value="ID" /></ww:url></ww:param>
            </ww:component>
        </ww:if>
        <ww:else>
            <ww:component template="form.jsp" id="updateGeneral">
                <ww:param name="action"><ww:url namespace="/console/secure/directory" action="updateremotecrowd" includeParams="none" /></ww:param>
                <ww:param name="content" value="#formContent" />
                <ww:param name="cancelUri"><ww:url namespace="/console/secure/directory" action="viewremotecrowd" method="default" includeParams="none" ><ww:param name="ID" value="ID" /></ww:url></ww:param>
            </ww:component>
        </ww:else>
    </div>
</div>
<ww:if test="cacheEnabled && active && currentlySynchronising">
    <script>
        AJS.$(function () {
            CROWD_SYNC_FEEDBACK.startSyncFeedback(<ww:property value="ID" />);
        });
    </script>
</ww:if>
</body>
</html>
