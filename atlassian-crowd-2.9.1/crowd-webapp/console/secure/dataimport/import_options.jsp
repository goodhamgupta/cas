<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="/struts-tags" prefix="ww" %>
<html>
<head>
    <title><ww:text name="dataimport.title"/></title>
    <meta name="section" content="dataimport"/>
    <meta name="pagename" content="dataimport"/>
    <meta name="help.url" content="<ww:property value="getText('help.user.import')"/>"/>
</head>

<body>

<ww:set name="progressTracker">
    <ww:component template="progress-tracker.jsp">
        <ww:param name="steps" value="progressSteps" />
    </ww:component>
</ww:set>
<ww:component template="header.jsp">
    <ww:param name="mainContent">
        <h2><ww:text name="dataimport.title"/></h2>
    </ww:param>
    <ww:param name="actionsContent" value="#progressTracker" />
</ww:component>

<ww:set name="formContent">
    <ww:radio name="importType" list="importTypeOption" listKey="type" listValue="label">
        <ww:param name="listDescription" value="'description'" />
    </ww:radio>
</ww:set>
<ww:component template="form.jsp">
    <ww:param name="action"><ww:url namespace="/console/secure/dataimport" action="selectType" includeParams="none" /></ww:param>
    <ww:param name="isTopLabels" value="true" />
    <ww:param name="content" value="#formContent" />
    <ww:param name="submitLabel" value="getText('next.label')" />
</ww:component>

</body>
</html>
