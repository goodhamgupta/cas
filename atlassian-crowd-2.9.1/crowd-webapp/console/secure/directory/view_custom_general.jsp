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
    <meta name="help.url" content="<ww:property value="getText('help.directory.custom.details')"/>"/>
</head>
<body>
<h2>
    <ww:text name="menu.viewdirectory.label">
        <ww:param><ww:property value="directory.name"/></ww:param>
    </ww:text>
</h2>

<div class="aui-tabs horizontal-tabs aui-tabs-disabled">
    <jsp:include page="inc_tabs_custom.jsp">
        <jsp:param name="selectedTab" value="1" />
    </jsp:include>
    <div class="tabs-pane active-pane">
        <ww:set name="formContent">
            <ww:textfield name="name" size="50">
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
               <ww:param name="label" value="getText('directory.type.label')" />
                <ww:param name="value" value="directoryImplementationDescriptiveName"/>
            </ww:component>
            <ww:checkbox name="active" fieldValue="true">
                <ww:param name="label" value="getText('directory.active.label')"/>
            <ww:param name="description">
                <ww:property value="getText('directory.active.description')"/>
            </ww:param>
            </ww:checkbox>
            <ww:component template="form_row.jsp">
               <ww:param name="label" value="getText('directorycustom.implementationclass.label')" />
                <ww:param name="value" value="directory.implementationClass"/>
            </ww:component>
            <input type="hidden" name="ID" value="<ww:property value="ID" />"/>
        </ww:set>
        <ww:component template="form.jsp" id="updateGeneral">
            <ww:param name="action"><ww:url namespace="/console/secure/directory" action="updatecustom" includeParams="none" /></ww:param>
            <ww:param name="content" value="#formContent" />
            <ww:param name="cancelUri"><ww:url namespace="/console/secure/directory" action="viewcustom" method="default" ><ww:param name="ID" value="ID" /></ww:url></ww:param>
        </ww:component>
    </div>
</div>

</body>
</html>
