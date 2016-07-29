<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="/struts-tags" prefix="ww" %>
<html>
<head>
    <title><ww:property value="getText('directory.importjive.title')"/></title>
    <meta name="section" content="dataimport"/>
    <meta name="help.url" content="<ww:property value="getText('help.user.import.jive.results')"/>"/>
</head>
<body>

<ww:set name="progressTracker">
    <ww:component template="progress-tracker.jsp">
        <ww:param name="steps" value="getProgressSteps(2)" />
    </ww:component>
</ww:set>
<ww:component template="header.jsp">
    <ww:param name="mainContent">
        <h2><ww:property value="getText('directory.importjive.title')"/></h2>
    </ww:param>
    <ww:param name="actionsContent" value="#progressTracker" />
</ww:component>

<p><ww:property value="getText('directory.importjivesuccess.text')"/></p>

<ww:component template="form_messages.jsp"/>

<form class="aui">
    <ww:component template="form_row.jsp">
       <ww:param name="label" value="getText('directory.importusercount.label')" />
        <ww:param name="value" value="userImportCount"/>
    </ww:component>
    <ww:component template="form_row.jsp">
       <ww:param name="label" value="getText('directory.importgroupcount.label')" />
        <ww:param name="value" value="groupImportCount"/>
    </ww:component>
</form>

</body>
</html>
