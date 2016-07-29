<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="/struts-tags" prefix="ww" %>
<html>
<head>
    <title><ww:property value="getText('application.remove.title')"/></title>
    <meta name="section" content="applications"/>
    <meta name="pagename" content="remove"/>
    <meta name="help.url" content="<ww:property value="getText('help.application.remove')"/>"/>        
</head>
<body>

<h2><ww:property value="getText('application.remove.title')"/>&nbsp;&ndash;&nbsp;<ww:property value="name"/></h2>
<div class="aui-message warning">
    <p class="title">
        <ww:text name="application.remove.text">
            <ww:param name="0"><ww:property value="application.name"/></ww:param>
        </ww:text>
    </p>
    <span class="aui-icon icon-warning"></span>
</div>
<ww:component template="form.jsp">
    <ww:param name="action"><ww:url namespace="/console/secure/application" action="remove" method="update" /></ww:param>
    <ww:param name="cancelUri"><ww:url namespace="/console/secure/application" action="viewdetails" method="default"><ww:param name="ID" value="ID"/></ww:url></ww:param>
    <ww:param name="submitLabel" value="getText('remove.label')" />
    <ww:param name="isTopLabels" value="true" />
    <ww:param name="content">
        <input type="hidden" name="ID" value="<ww:property value="ID" />"/>
    </ww:param>
</ww:component>
</body>
</html>
