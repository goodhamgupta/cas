<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="/struts-tags" prefix="ww" %>
<html>
<head>
    <title>
        <ww:text name="menu.viewapplication.label"/>
    </title>
    <meta name="section" content="applications"/>
    <meta name="pagename" content="view"/>
    <meta name="help.url" content="<ww:text name="help.application.view.optional"/>"/>
</head>
<body>

<h2 id="application-name">
    <img class="application-icon" title="<ww:property value="getImageTitle(application.active, application.type)"/>" alt="<ww:property value="getImageTitle(application.active, application.type)"/>" src="<ww:property value="getImageLocation(application.active, application.type)" />"/>
    <ww:property value="application.name"/>
</h2>

<div class="aui-tabs horizontal-tabs aui-tabs-disabled">

    <ww:component template="application_tab_headers.jsp">
        <ww:param name="pagekey" value="'application-options'"/>
    </ww:component>

    <div class="tabs-pane active-pane">
        <ww:set name="formContent">
            <ww:checkbox name="lowerCaseOutput" fieldValue="true">
                <ww:param name="label" value="getText('application.lowerCaseOutput.label')"/>
                <ww:param name="description">
                    <ww:property value="getText('application.lowerCaseOutput.description')"/>
                </ww:param>
            </ww:checkbox>
            <ww:checkbox name="aliasingEnabled" fieldValue="true">
                <ww:param name="label" value="getText('application.aliasing.enabled.label')"/>
                <ww:param name="description">
                    <ww:text name="application.aliasing.enabled.description">
                        <ww:param name="0"><ww:property value="application.name"/></ww:param>
                        <ww:param name="1"><a href="<ww:text name="help.prefix"/><ww:text name="help.application.view.aliasing"/>" target="_crowdhelp"></ww:param>
                        <ww:param name="2"></a></ww:param>
                    </ww:text>
                </ww:param>
            </ww:checkbox>
            <input type="hidden" name="ID" value="<ww:property value="ID" />"/>
        </ww:set>
        <ww:component template="form.jsp" id="applicationOptions">
            <ww:param name="action"><ww:url namespace="/console/secure/application" action="updateoptional" method="updateOptional" includeParams="none" /></ww:param>
            <ww:param name="cancelUri"><ww:url namespace="/console/secure/application" action="viewoptions" method="default" includeParams="none"><ww:param name="ID" value="ID"/></ww:url></ww:param>
            <ww:param name="content" value="#formContent" />
            <ww:param name="isTopLabels" value="true" />
        </ww:component>
    </div>
</div>
</body>
</html>
