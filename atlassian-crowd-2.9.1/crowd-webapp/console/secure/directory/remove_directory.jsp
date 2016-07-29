<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="/struts-tags" prefix="ww" %>
<html>
<head>
    <title><ww:property value="getText('directory.remove.title')"/></title>
    <meta name="section" content="directories"/>
    <meta name="pagename" content="removedirectory"/>
</head>
<body>


<h2><ww:property value="getText('directory.remove.title')"/>&nbsp;&ndash;&nbsp;<ww:property value="directory.name"/></h2>

<ww:set name="typeAsString"><ww:property value="directory.type.name()"/></ww:set>
<ww:set name="cancelUri">
    <ww:if test="#typeAsString == 'INTERNAL'">
        <ww:url namespace="/console/secure/directory" action="viewinternal" method="default"><ww:param name="ID" value="ID" /></ww:url>
    </ww:if>
    <ww:elseif test="#typeAsString == 'CROWD'">
        <ww:url namespace="/console/secure/directory" action="viewremotecrowd" method="default"><ww:param name="ID" value="ID" /></ww:url>
    </ww:elseif>
    <ww:elseif test="#typeAsString == 'CONNECTOR'">
        <ww:url namespace="/console/secure/directory" action="viewconnector" method="default"><ww:param name="ID" value="ID" /></ww:url>
    </ww:elseif>
    <ww:elseif test="#typeAsString == 'CUSTOM'">
        <ww:url namespace="/console/secure/directory" action="viewcustom" method="default"><ww:param name="ID" value="ID" /></ww:url>
    </ww:elseif>
    <ww:elseif test="#typeAsString == 'DELEGATING'">
        <ww:url namespace="/console/secure/directory" action="viewdelegated" method="default"><ww:param name="ID" value="ID" /></ww:url>
    </ww:elseif>
    <ww:else>
        <ww:url namespace="/console/secure/directory" action="viewcustom" method="default"><ww:param name="ID" value="ID" /></ww:url>
    </ww:else>
</ww:set>

<ww:set name="formContent">
    <ww:component template="form_row.jsp">
        <ww:param name="label" value="getText('directory.name.label')"/>
        <ww:param name="value" value="directory.name"/>
        <ww:param name="description" value="directory.description"/>
    </ww:component>
    <ww:component template="form_row.jsp">
        <ww:param name="label" value="getText('directory.type.label')"/>
        <ww:param name="value" value="directoryImplementationDescriptiveName"/>
    </ww:component>
    <input type="hidden" name="ID" value="<ww:property value="ID" />"/>
</ww:set>
<ww:component template="form.jsp">
    <ww:param name="action"><ww:url namespace="/console/secure/directory" action="remove" method="update" includeParams="none" /></ww:param>
    <ww:param name="content" value="#formContent" />
    <ww:param name="submitLabel" value="getText('continue.label')" />
    <ww:param name="cancelUri" value="#cancelUri" />
</ww:component>

</body>
</html>
