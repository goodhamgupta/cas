<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="/struts-tags" prefix="ww" %>
<html>
<head>
    <title><ww:property value="getText('menu.addapplication.label')"/></title>
    <meta name="section" content="applications"/>
    <meta name="pagename" content="add"/>
    <meta name="help.url" content="<ww:property value="getText('help.application.add')"/>"/>
</head>
<body>

<ww:set name="progressTracker">
    <ww:component template="progress-tracker.jsp">
        <ww:param name="steps" value="progressSteps" />
    </ww:component>
</ww:set>

<ww:component template="header.jsp">
    <ww:param name="mainContent">
        <h2><ww:property value="getText('menu.addapplication.label')"/> - <ww:property value="configuration.name"/></h2>
    </ww:param>
    <ww:param name="actionsContent" value="#progressTracker" />
</ww:component>

<ww:set name="formContent">
    <ww:component template="form_row.jsp">
        <ww:param name="label" value="getText('application.type.label')" />
        <ww:param name="value" value="configuration.applicationType.displayName" />
    </ww:component>
    <ww:component template="form_row.jsp">
        <ww:param name="label" value="getText('application.name.label')" />
        <ww:param name="value" value="configuration.name" />
    </ww:component>
    <ww:if test="configuration.description != null && configuration.description.length > 0">
        <ww:component template="form_row.jsp">
            <ww:param name="label" value="getText('application.description.label')" />
            <ww:param name="value" value="configuration.description" />
        </ww:component>
    </ww:if>
    <ww:component template="form_row.jsp">
        <ww:param name="label" value="getText('application.url.label')" />
        <ww:param name="value" value="configuration.applicationURL" />
    </ww:component>
    <ww:component template="form_row.jsp">
        <ww:param name="label" value="getText('application.remoteipaddress.label')" />
        <ww:param name="value">
            <ww:iterator value="configuration.remoteAddresses" status="status">
                <ww:property/><ww:if test="!#status.last">,</ww:if>
            </ww:iterator>
        </ww:param>
    </ww:component>
    <ww:iterator value="configuration.directoryids" id="id">
        <ww:set name="directoryName" value="directory(#id).name"/>

        <h3><ww:text name="directory.label"/>&nbsp;&ndash;&nbsp;<ww:property value="#directoryName"/></h3>
        <div class="field-group">
            <label><ww:text name="application.groups.authorised.label"/></label>
            <div class="selected-groups">
                <ww:if test="configuration.allowAllForDirectory.get(#id)">
                    <ww:text name="application.directories.allow.all.confirmation"><ww:param name="0">'<ww:property value="configuration.name"/>'</ww:param></ww:text>
                </ww:if>
                <ww:else>
                    <ww:if test="configuration.directoryGroupMappings.get(#id) == null">
                        <ww:text name="application.directories.none.authorised.confirmation">
                            <ww:param name="0">'<ww:property value="configuration.name"/>'</ww:param>
                            <ww:param name="1">'<ww:property value="#directoryName"/>'</ww:param>
                        </ww:text>
                    </ww:if>
                    <ww:else>
                        <ww:iterator value="configuration.directoryGroupMappings.get(#id)" status="status">
                            <ww:property /><ww:if test="!#status.last">,&nbsp;</ww:if>
                        </ww:iterator>
                    </ww:else>
                </ww:else>
            </div>
        </div>
    </ww:iterator>
</ww:set>
<ww:component template="form.jsp">
    <ww:param name="action"><ww:url namespace="/console/secure/application" action="addapplicationconfirmation" method="completeStep" /></ww:param>
    <ww:param name="cancelUri"><ww:url namespace="/console/secure/application" action="addapplicationdetails" method="cancel" /></ww:param>
    <ww:param name="submitLabel" value="getText('menu.addapplication.label')" />
    <ww:param name="content" value="#formContent" />
</ww:component>

</body>
</html>
