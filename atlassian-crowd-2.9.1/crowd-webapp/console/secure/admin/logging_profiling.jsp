<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="/struts-tags" prefix="ww" %>
<%@ taglib uri="/WEB-INF/crowd.tld" prefix="cwd" %>
<html>
<head>
    <title><ww:property value="getText('options.title')"/></title>
    <meta name="section" content="administration"/>
    <meta name="pagename" content="logging_profiling"/>
    <meta name="help.url" content="<ww:property value="getText('help.admin.logging_profiling')"/>"/>
    <style type="text/css">
        #profiling .buttons-container {
            padding-top: 15px;
        }
    </style>
</head>

<body>

<h2><ww:property value="getText('menu.loggingprofiling.label')"/></h2>

<h3><ww:property value="getText('loglevel.profiling')"/></h3>
<p><ww:property value="getText('loglevel.profiling.desc')"/></p>
<ww:set name="formContent1">
    <ww:if test="profilingOn == true">
        <p>
            <ww:property value="getText('loglevel.precursor')"/>
            <span class="aui-lozenge aui-lozenge-success"><ww:property value="getText('common.words.on')"/></span>
        </p>
        <ww:hidden name="profilingOn" value="false"/>
    </ww:if>
    <ww:else>
        <p>
            <ww:property value="getText('loglevel.precursor')"/>
            <span class="aui-lozenge"><ww:property value="getText('common.words.off')"/></span>
        </p>
        <ww:hidden name="profilingOn" value="true"/>
    </ww:else>
</ww:set>
<ww:component template="form.jsp" id="profiling">
    <ww:param name="action"><ww:url namespace="/console/secure/admin" action="loggingProfiling" method="updateProfiling" includeParams="none"/></ww:param>
    <ww:param name="submitLabel"><ww:if test="profilingOn == true"><ww:property value="getText('loglevel.profilingOff')"/></ww:if><ww:else><ww:property value="getText('loglevel.profilingOn')"/></ww:else></ww:param>
    <ww:param name="isTopLabels" value="true" />
    <ww:param name="isPrimary" value="false" />
    <ww:param name="includeFormMessages" value="false" />
    <ww:param name="content" value="#formContent1" />
</ww:component>

<h3><ww:property value="getText('loglevel.logging.heading')"/></h3>
<p><ww:property value="getText('loglevel.logging.desc')"/></p>
<ww:set name="formContent2">
    <table class="aui" id="loglevelTable">
        <thead>
            <tr>
                <th width="40%"><ww:property value="getText('loglevel.packageHeading')"/></th>
                <th width="10%"><ww:property value="getText('loglevel.currentLevelHeading')"/></th>
                <th width="10%"><ww:property value="getText('loglevel.newLevelHeading')"/></th>
            </tr>
        </thead>
        <ww:iterator value="entries">
            <tr id="<ww:property value="clazz"/>">
                <td>
                    <ww:property value="clazz"/>
                    <input type="hidden" name="classNames" value="<ww:property value="clazz"/>">
                </td>
                <td><ww:property value="level"/></td>
                <td>
                    <ww:select name="levelNames" list="loggingLevelOption" listKey="toString()" listValue="toString()">
                        <ww:param name="inline" value="true" />
                        <ww:param name="selectedValue" value="level" />
                    </ww:select>
                </td>
            </tr>
        </ww:iterator>
    </table>
</ww:set>
<ww:set name="formAdditionalButton">
    <cwd:soy moduleKey="com.atlassian.auiplugin:aui-experimental-soy-templates" template="aui.buttons.button">
        <ww:param name="id" value="'revertToDefault'" />
        <ww:param name="inputType" value="'submit'" />
        <ww:param name="text" value="getText('loglevel.reverttodefault')" />
        <ww:param name="extraAttributes">name="profileName" value="Revert to Default"</ww:param>
    </cwd:soy>
</ww:set>
<ww:component template="form.jsp" id="logging">
    <ww:param name="action"><ww:url namespace="/console/secure/admin" action="loggingProfiling" method ="updateLogging" includeParams="none"/></ww:param>
    <ww:param name="submitLabel" value="getText('loglevel.updatelogging')" />
    <ww:param name="submitName" value="'updateLogging'" />
    <ww:param name="isTopLabels" value="true" />
    <ww:param name="isPrimary" value="false" />
    <ww:param name="content" value="#formContent2" />
    <ww:param name="afterButtonContent" value="#formAdditionalButton" />
</ww:component>

</body>
</html>
