<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="/struts-tags" prefix="ww" %>
<%@ taglib uri="/WEB-INF/crowd.tld" prefix="cwd" %>
<html>
<head>
    <title><ww:text name="directory.selector.title"/></title>
    <meta name="section" content="directories"/>
    <meta name="pagename" content="adddirectory"/>
    <meta name="help.url" content="<ww:property value="getText('help.directory.add')"/>"/>    
</head>
<body>

<h2><ww:text name="directory.selector.title"/></h2>
<ww:set name="formContent">
    <ww:radio name="directoryType" list="directoryTypeOption" listKey="type" listValue="label">
        <ww:param name="listDescription" value="'description'" />
    </ww:radio>
</ww:set>
<ww:component template="form.jsp">
    <ww:param name="action"><ww:url namespace="/console/secure/directory" action="selectType" includeParams="none" /></ww:param>
    <ww:param name="isTopLabels" value="true" />
    <ww:param name="content" value="#formContent" />
    <ww:param name="submitLabel" value="getText('next.label')" />
</ww:component>

</body>
</html>
