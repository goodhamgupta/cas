<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="/struts-tags" prefix="ww" %>
<html>
<head>
    <title><ww:property value="getText('session.principal.title')"/></title>
    <meta name="section" content="sessions"/>
    <meta name="pagename" content="sessions"/>
    <meta name="help.url" content="<ww:property value="getText('help.admin.sessions.user')"/>"/>
</head>
<body>
    <h2><ww:property value="getText('session.principal.title')"/></h2>

    <div class="aui-tabs horizontal-tabs aui-tabs-disabled">
        <ul class="tabs-menu">
            <li class="menu-item">
                <a href="<ww:url namespace="/console/secure/session" action="browseapplicationsessions" includeParams="none" />">
                    <strong><ww:property value="getText('session.application.title')"/></strong>
                </a>
            </li>
            <li class="menu-item active-tab">
                <a href="<ww:url namespace="/console/secure/session" action="browseusersessions" includeParams="none" />">
                    <strong><ww:property value="getText('session.principal.title')"/></strong>
                </a>
            </li>
        </ul>

        <div class="tabs-pane active-pane">
            <ww:set name="formContent">
                <ww:select list="directories" listKey="id" listValue="name" name="selectedDirectoryID">
                    <ww:param name="label" value="getText('browser.directory.label')"/>
                    <ww:param name="selectedValue" value="getSelectedDirectoryID()"/>
                </ww:select>
                <ww:textfield name="name" size="15">
                    <ww:param name="label" value="getText('session.name.label')"/>
                    <ww:param name="fieldWidth" value="'medium'"/>
                </ww:textfield>
                <ww:select list="resultsPerPageOption" listKey="toString()" listValue="toString()" name="resultsPerPage">
                    <ww:param name="label" value="getText('browser.resultsperpage.label')"/>
                    <ww:param name="fieldWidth" value="'short'"/>
                </ww:select>
            </ww:set>
            <ww:component template="form.jsp" id="browse-principals">
                <ww:param name="action"><ww:url namespace="/console/secure/session" action="browseusersessions" includeParams="none"/></ww:param>
                <ww:param name="cancelUri"><ww:url namespace="/console/secure/session" action="browseusersessions" includeParams="none"/></ww:param>
                <ww:param name="submitLabel" value="getText('browser.filter.label')" />
                <ww:param name="cancelLabel" value="getText('browser.resetfilter.label')" />
                <ww:param name="content" value="#formContent" />
            </ww:component>

            <table id="principal-session-results" class="aui">
                <thead>
                    <tr>
                        <th width="18%"><ww:property value="getText('principal.name.label')"/></th>
                        <th width="18%"><ww:property value="getText('browser.directory.label')"/></th>
                        <th width="22%"><ww:property value="getText('session.initialization.label')"/></th>
                        <th width="22%"><ww:property value="getText('session.lastaccessed.label')"/></th>
                        <th width="20%"><ww:property value="getText('browser.action.label')"/></th>
                    </tr>
                </thead>
                <ww:component template="pager.jsp">
                    <ww:param name="columns" value="5" />
                    <ww:param name="start" value="resultsStart" />
                    <ww:param name="size" value="results.size" />
                    <ww:param name="perPage" value="resultsPerPage" />
                </ww:component>
                <ww:iterator value="results" status="rowstatus">
                    <ww:if test="#rowstatus.count <= resultsPerPage">
                        <tr>
                            <td>
                                <a href="<ww:url namespace="/console/secure/user" action="view" method="default" includeParams="none"><ww:param name="name" value="name" /><ww:param name="directoryID" value="directoryId" /></ww:url>">
                                    <ww:property value="name"/>
                                </a>
                            </td>
                            <td>
                                <a
                                    <ww:if test="[0].directory(directoryId).type.name() == 'INTERNAL'">
                                        href="<ww:url namespace="/console/secure/directory" action="viewinternal"><ww:param name="ID" value="directoryId" /></ww:url>"
                                    </ww:if>
                                    <ww:elseif test="[0].directory(directoryId).type.name() == 'CONNECTOR'">
                                        href="<ww:url namespace="/console/secure/directory" action="viewconnector" includeParams="none" ><ww:param name="ID" value="directoryId" /></ww:url>"
                                    </ww:elseif>
                                    <ww:elseif test="[0].directory(directoryID).type.name() == 'DELEGATED'">
                                        href="<ww:url namespace="/console/secure/directory" action="viewdelegated" includeParams="none" ><ww:param name="ID" value="directoryId" /></ww:url>"
                                    </ww:elseif>
                                    <ww:else>
                                        href="<ww:url namespace="/console/secure/directory" action="viewcustom" includeParams="none" ><ww:param name="ID" value="directoryId" /></ww:url>"
                                    </ww:else>
                                >
                                    <ww:property value="[0].directory(directoryId).name"/>
                                </a>
                            </td>
                            <td><ww:property value="getFormattedDateTime(createdDate)"/></td>
                            <td><ww:property value="getFormattedDateTime(lastAccessedTime)"/></td>
                            <td>
                                <a href="<ww:url namespace="/console/secure/session" action="removeusersession" method="removePrincipalSession" includeParams="none"><ww:param name="randomHash" value="randomHash" /><ww:param name="%{xsrfTokenName}" value="%{xsrfToken}"/></ww:url>">
                                    <ww:property value="getText('expire.label')"/>
                                </a>
                            </td>
                        </tr>
                    </ww:if>
                </ww:iterator>
            </table>

            <form name="next" method="post" action="<ww:url namespace="/console/secure/session" action="browseusersessions" includeParams="none"/>">
                <input type="hidden" name="ID" value="<ww:property value="ID" />"/>
                <input type="hidden" name="directoryID" value="<ww:property value="directoryID" />"/>
                <input type="hidden" name="name" value="<ww:property value="name" />"/>
                <input type="hidden" name="resultsStart" value="<ww:property value="nextResultsStart" />"/>
                <input type="hidden" name="resultsPerPage" value="<ww:property value="resultsPerPage" />"/>
            </form>

            <form name="previous" method="post" action="<ww:url namespace="/console/secure/session" action="browseusersessions" includeParams="none"/>">
                <input type="hidden" name="ID" value="<ww:property value="ID" />"/>
                <input type="hidden" name="directoryID" value="<ww:property value="directoryID" />"/>
                <input type="hidden" name="name" value="<ww:property value="name" />"/>
                <input type="hidden" name="resultsStart" value="<ww:property value="previousResultsStart" />"/>
                <input type="hidden" name="resultsPerPage" value="<ww:property value="resultsPerPage" />"/>
            </form>
        </div>
    </div>
</body>
</html>
