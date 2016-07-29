<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="/struts-tags" prefix="ww" %>
<%@ taglib uri="/WEB-INF/crowd.tld" prefix="cwd" %>
<html>
<head>
    <title>
        <ww:text name="menu.viewapplication.label"/>
    </title>
    <meta name="section" content="applications"/>
    <meta name="pagename" content="view"/>
    <meta name="help.url" content="<ww:text name="help.application.view.directories"/>"/>

    <script>
        AJS.$(document).on('click', '#add-directory', function () {
            AJS.$('#directoriesForm')
                .attr('action', '<ww:url namespace="/console/secure/application" action="updatedirectory" method="addDirectory" includeParams="none" />')
                .submit();
        });
    </script>
    <style type="text/css">
        #directory-aggregation-checkbox {
            margin-left: 10px;
        }
    </style>
</head>
<body>

<h2 id="application-name">
    <img class="application-icon" title="<ww:property value="getImageTitle(application.active, application.type)"/>" alt="<ww:property value="getImageTitle(application.active, application.type)"/>" src="<ww:property value="getImageLocation(application.active, application.type)" />"/>
    <ww:property value="application.name"/>
</h2>

<div class="aui-tabs horizontal-tabs aui-tabs-disabled">

    <ww:component template="application_tab_headers.jsp">
        <ww:param name="pagekey" value="'application-directories'"/>
    </ww:component>

    <div class="tabs-pane active-pane" id="tab2">
        <ww:set name="formContent">
            <ww:if test="!isIncrementalSyncAvailable">
                <cwd:soy moduleKey="com.atlassian.auiplugin:aui-experimental-soy-templates" template="aui.message.warning">
                    <ww:param name="titleContent" value="getText('application.directorymappings.no.incremental.sync')" />
                    <ww:param name="content" value="''" />
                </cwd:soy>
            </ww:if>

            <p><ww:property value="getText('application.directorymappings.text')"/></p>

            <table id="directoriesTable" class="aui">
                <thead>
                    <ww:if test="application.directoryMappings.size > 1">
                        <tr>
                            <th width="40%"><ww:property value="getText('browser.directory.label')"/></th>
                            <th width="15%"><ww:property value="getText('browser.directoryorder.label')"/></th>
                            <th width="25%"><ww:property value="getText('browser.allowalltoauthenticate.label')"/></th>
                            <th width="20%"><ww:property value="getText('browser.action.label')"/></th>
                        </tr>
                    </ww:if>
                    <ww:else>
                        <tr>
                            <th width="55%"><ww:property value="getText('browser.directory.label')"/></th>
                            <th width="25%"><ww:property value="getText('browser.allowalltoauthenticate.label')"/></th>
                            <th width="20%"><ww:property value="getText('browser.action.label')"/></th>
                        </tr>
                    </ww:else>
                </thead>
                <ww:if test="unsubscribedDirectories.size > 0">
                    <tfoot>
                        <tr>
                            <td colspan="4">
                                <ww:select name="unsubscribedDirectoriesID" list="unsubscribedDirectories" listKey="id" listValue="name">
                                    <ww:param name="inline" value="true" />
                                    <ww:param name="fieldWidth" value="'long'" />
                                </ww:select>
                                <input id="add-directory" type="button" class="aui-button" value="<ww:property value="getText('add.label')"/>" />
                            </td>
                        </tr>
                    </tfoot>
                </ww:if>
                <ww:iterator value="application.directoryMappings" status="rowstatus">
                    <tr>
                        <td>
                            <ww:property value="directory.name"/>
                            <input type="hidden" name="directory<ww:property value="#rowstatus.count" />" value="<ww:property value="directory.id" />"/>
                        </td>
                        <ww:if test="application.directoryMappings.size > 1">
                            <td>
                                <ww:if test="#rowstatus.count > 1 && #rowstatus.count != 0">
                                    <a id="up-<ww:property value="directory.id"/>"
                                            href="<ww:url namespace="/console/secure/application" action="updatedirectory" method="up" includeParams="none">
                                                         <ww:param name="ID" value="ID"/>
                                                         <ww:param name="directoryID" value="directory.id"/>
                                                         <ww:param name="%{xsrfTokenName}" value="%{xsrfToken}"/>
                                                     </ww:url>"
                                            class="aui-button aui-button-link"><img
                                            src="<ww:url value="/console/images/icons/16x16/arrow_up_blue.gif" />"
                                            alt="<ww:property value="getText('moveup.label')" />"/></a>
                                </ww:if>
                                <ww:if test="#rowstatus.last == false">
                                    <a id="down-<ww:property value="directory.id"/>"
                                            href="<ww:url namespace="/console/secure/application" action="updatedirectory" method="down" includeParams="none">
                                                         <ww:param name="ID" value="ID"/>
                                                         <ww:param name="directoryID" value="directory.id"/>
                                                         <ww:param name="tab" value="2"/>
                                                         <ww:param name="%{xsrfTokenName}" value="%{xsrfToken}"/>
                                                     </ww:url>"
                                            class="aui-button aui-button-link"><img
                                            src="<ww:url value="/console/images/icons/16x16/arrow_down_blue.gif" />"
                                            alt="<ww:property value="getText('movedown.label')" />"/></a>
                                </ww:if>
                            </td>
                        </ww:if>
                        <td>
                            <ww:select list="allowAllToAuthenticateOption" listKey="key" listValue="value">
                                <ww:param name="name">directory<ww:property value="#rowstatus.count" />-allowAll</ww:param>
                                <ww:param name="selectedValue"><ww:property value="allowAllToAuthenticate"/></ww:param>
                                <ww:param name="fieldWidth" value="'short'" />
                                <ww:param name="inline" value="true" />
                            </ww:select>
                        </td>
                        <td>
                            <a href="<ww:url namespace="/console/secure/application" action="updatedirectory" method="removeDirectory" includeParams="none">
                                                 <ww:param name="ID" value="ID"/>
                                                 <ww:param name="directoryID" value="directory.id"/>
                                                 <ww:param name="%{xsrfTokenName}" value="%{xsrfToken}"/>
                                             </ww:url>" class="aui-button aui-button-link">
                                <ww:property value="getText('remove.label')"/>
                            </a>
                        </td>
                    </tr>
                </ww:iterator>
            </table>

            <input type="hidden" name="ID" value="<ww:property value="ID" />"/>

            <p>

            <div id="directory-aggregation-checkbox">
                <ww:checkbox name="membershipAggregationEnabled" fieldValue="true" disabled="application.directoryMappings.size <= 1">
                    <ww:param name="label" value="getText('options.membershipaggregation.label')" />
                    <ww:param name="description"><ww:property value="getText('options.membershipaggregation.description')"/></ww:param>
                </ww:checkbox>
            </div>
        </ww:set>
        <ww:component template="form.jsp" id="directoriesForm">
            <ww:param name="action"><ww:url namespace="/console/secure/application" action="updatedirectory" method="update" includeParams="none" /></ww:param>
            <ww:param name="isTopLabels" value="true" />
            <ww:param name="content" value="#formContent" />
            <ww:param name="includeSubmitButton" value="application.directoryMappings.size > 0"/>
        </ww:component>
    </div>
</div>
</body>
</html>
