<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="/struts-tags" prefix="ww" %>
<html>
<head>
    <title><ww:property value="getText('menu.viewgroup.label')"/></title>
    <meta name="section" content="groups"/>
    <meta name="pagename" content="viewgroup"/>
    <meta name="help.url" content="<ww:property value="getText('help.group.view.details')"/>"/>
</head>
<body>

<h2><ww:property value="getText('menu.viewgroup.label')"/>&nbsp;&ndash;&nbsp;<ww:property value="name"/></h2>

<div class="aui-tabs horizontal-tabs aui-tabs-disabled">
    <ul class="tabs-menu">
        <li class="menu-item active-tab">
            <a><ww:property value="getText('menu.details.label')"/></a>
        </li>
        <li class="menu-item">
            <a id="view-group-users" href='<ww:url action="viewmembers" namespace="/console/secure/group" includeParams="none" ><ww:param name="directoryID" value="directoryID"/><ww:param name="groupName" value="name"/></ww:url>'>
                <ww:property value="getText('group.directmembers.label')"/>
            </a>
        </li>
        <ww:if test="supportsNestedGroups">
            <li class="menu-item">
                <a id="view-group-nested-principals" href='<ww:url action="viewnestedusers" namespace="/console/secure/group" includeParams="none" ><ww:param name="directoryID" value="directoryID"/><ww:param name="groupName" value="name"/></ww:url>'>
                    <ww:property value="getText('group.nestedmembers.label')"/>
                </a>
            </li>
        </ww:if>
    </ul>
    <div class="tabs-pane active-pane">
        <ww:set name="formContent">
            <ww:component template="form_row.jsp">
                <ww:param name="label" value="getText('group.name.label')"/>
                <ww:param name="value" value="name"/>
                <ww:param name="valueid" value="'groupName'"/>
            </ww:component>
            <ww:if test="locationKey != null">
                <ww:component template="form_row.jsp">
                    <ww:param name="label" value="getText('group.location.label')"/>
                    <ww:param name="value" value="getText(locationKey)"/>
                    <ww:param name="escapeValue" value="false" />
                    <ww:param name="valueid" value="'groupLocation'"/>
                </ww:component>
            </ww:if>
            <ww:component template="form_row.jsp">
                <ww:param name="label" value="getText('group.directory.label')"/>
                <ww:param name="value">
                    <ww:property value="directory.name"/>&nbsp;&mdash;&nbsp;<ww:property value="directoryImplementationDescriptiveName"/>
                </ww:param>
                <ww:param name="escapeValue" value="false" />
                <ww:param name="valueid" value="'groupDirectory'"/>
            </ww:component>
            <ww:textfield name="description" size="50">
                <ww:param name="label" value="getText('group.description.label')"/>
                <ww:param name="fieldWidth" value="'long'"/>
            </ww:textfield>
            <ww:checkbox name="active" fieldValue="true">
                <ww:param name="label" value="getText('group.active.label')"/>
            </ww:checkbox>
            <input type="hidden" name="directoryID" value="<ww:property value="directoryID" />"/>
            <input type="hidden" name="name" value="<ww:property value="name" />"/>
        </ww:set>
        <ww:component template="form.jsp" id="groupForm">
            <ww:param name="action"><ww:url namespace="/console/secure/group" action="update" method="updateGeneral" includeParams="none" /></ww:param>
            <ww:param name="cancelUri"><ww:url namespace="/console/secure/group" action="view" method="default" escapeAmp="false"><ww:param name="tab" value="1" /><ww:param name="directoryID" value="directoryID" /><ww:param name="name" value="name" /></ww:url></ww:param>
            <ww:param name="content" value="#formContent" />
        </ww:component>
    </div>
</div>

</body>
</html>
