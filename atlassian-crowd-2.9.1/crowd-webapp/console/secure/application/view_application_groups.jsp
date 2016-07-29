<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="/struts-tags" prefix="ww" %>
<html>
<head>
    <title>
        <ww:text name="menu.viewapplication.label"/>
    </title>
    <meta name="section" content="applications"/>
    <meta name="pagename" content="view"/>
    <meta name="help.url" content="<ww:text name="help.application.view.groups"/>"/>

    <script>
        AJS.$(document).on('click', '#add-group', function () {
            AJS.$('#groupsForm')
                    .attr('action', '<ww:url namespace="/console/secure/application" action="updategroups" method="addGroup" includeParams="none"/>')
                    .submit();
        });
    </script>
</head>
<body>


<h2 id="application-name">
    <img class="application-icon" title="<ww:property value="getImageTitle(application.active, application.type)"/>" alt="<ww:property value="getImageTitle(application.active, application.type)"/>" src="<ww:property value="getImageLocation(application.active, application.type)" />"/>
    <ww:property value="application.name"/>
</h2>

<div class="aui-tabs horizontal-tabs aui-tabs-disabled">

    <ww:component template="application_tab_headers.jsp">
        <ww:param name="pagekey" value="'application-groups'"/>
    </ww:component>

    <div class="tabs-pane active-pane" id="tab3">
        <ww:set name="formContent">
            <p><ww:property value="getText('application.groupmappings.text')"/></p>
            <table id="groupsTable" class="aui">
                <thead>
                    <tr>
                        <th width="82%">
                            <ww:property value="getText('browser.directory.label')"/>&nbsp;-&nbsp;<ww:property value="getText('browser.group.label')"/>
                        </th>
                        <th width="18%">
                            <ww:property value="getText('browser.action.label')"/>
                        </th>
                    </tr>
                </thead>
                <ww:if test="unsubscribedGroups.size > 0">
                    <tfoot>
                        <tr>
                            <td colspan="2">
                                <ww:select name="unsubscribedGroup" list="unsubscribedGroups" listKey="getDirectory().getId() + '-' + getGroupName()" listValue="getDirectory().getName() + ' - ' + getGroupName()">
                                    <ww:param name="inline" value="true" />
                                    <ww:param name="fieldWidth" value="'long'" />
                                </ww:select>
                                <input id="add-group" type="button" class="aui-button" value="<ww:property value="getText('add.label')"/>" />
                            </td>
                        </tr>
                    </tfoot>
                </ww:if>
                <ww:iterator value="groupMappingsForApplication" status="rowstatus">
                    <tr>
                        <td>
                            <a href="<ww:url namespace="/console/secure/group" action="view"><ww:param name="directoryID" value="directory.id"/><ww:param name="name" value="groupName"/></ww:url>">
                                <ww:property value="directory.name"/>&nbsp;-&nbsp;<ww:property value="groupName"/>
                            </a>
                            <input type="hidden" name="group<ww:property value="#rowstatus.count" />" value="<ww:property value="directory.id" />"/>
                        </td>
                        <td>
                            <a id="remove-<ww:property value="groupName"/>" href="<ww:url namespace="/console/secure/application" action="updategroups" method="removeGroup" includeParams="none" >
                                                                                      <ww:param name="ID" value="application.id"/>
                                                                                      <ww:param name="removeDirectoryID" value="directory.id"/>
                                                                                      <ww:param name="removeName" value="groupName"/>
                                                                                      <ww:param name="tab" value="3"/>
                                                                                      <ww:param name="%{xsrfTokenName}" value="%{xsrfToken}"/>
                                                                                  </ww:url>"
                               title="<ww:property value="getText('remove.label')"/> <ww:property value="groupName"/>">
                                <ww:property value="getText('remove.label')"/>
                            </a>
                        </td>
                    </tr>
                </ww:iterator>
            </table>
            <input type="hidden" name="ID" value="<ww:property value="ID" />"/>
            <input type="hidden" name="tab" value="3"/>
        </ww:set>
        <ww:component template="form.jsp" id="groupsForm">
            <ww:param name="action"><ww:url namespace="/console/secure/application" action="updategroups" method="update" includeParams="none" /></ww:param>
            <ww:param name="content" value="#formContent" />
            <ww:param name="includeSubmitButton" value="false"/>
        </ww:component>
    </div>
</div>
</body>
</html>
