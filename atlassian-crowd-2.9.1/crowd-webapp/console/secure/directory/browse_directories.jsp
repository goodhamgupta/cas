<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="/struts-tags" prefix="ww" %>
<html>
<head>
    <title><ww:property value="getText('browser.directory.title')"/></title>
    <meta name="section" content="directories"/>
    <meta name="pagename" content="browsedirectory"/>
    <meta name="help.url" content="<ww:property value="getText('help.directory.browse')"/>"/>    
</head>
<body>

<h2><ww:property value="getText('browser.directory.title')"/></h2>
<ww:set name="formContent">
    <ww:textfield name="name" size="75">
        <ww:param name="label" value="getText('directory.name.label')"/>
        <ww:param name="value" value="name"/>
        <ww:param name="fieldWidth" value="'medium'"/>
    </ww:textfield>
    <ww:select list="activeOption" name="active" listKey="key" listValue="value">
        <ww:param name="label" value="getText('directory.active.label')"/>
        <ww:param name="fieldWidth" value="'medium'"/>
    </ww:select>
    <ww:select list="resultsPerPageOption" name="resultsPerPage" listKey="toString()" listValue="toString()">
        <ww:param name="label" value="getText('browser.resultsperpage.label')"/>
        <ww:param name="fieldWidth" value="'short'"/>
    </ww:select>
</ww:set>
<ww:component template="form.jsp" id="directoryBrowser">
    <ww:param name="action"><ww:url namespace="/console/secure/directory" action="browse" includeParams="none" /></ww:param>
    <ww:param name="content" value="#formContent" />
    <ww:param name="submitLabel" value="getText('browser.filter.label')" />
    <ww:param name="cancelLabel" value="getText('browser.resetfilter.label')" />
    <ww:param name="cancelUri"><ww:url namespace="/console/secure/directory" action="browse" /></ww:param>
</ww:component>

<table id="directory-table" class="aui">
    <thead>
        <tr>
            <th width="45%"><ww:property value="getText('directory.name.label')"/></th>
            <th width="10%"><ww:property value="getText('directory.active.label')"/></th>
            <th width="35%"><ww:property value="getText('directory.type.label')"/></th>
            <th width="10%"><ww:property value="getText('browser.action.label')"/></th>
        </tr>
    </thead>
    <ww:component template="pager.jsp">
        <ww:param name="columns" value="4" />
        <ww:param name="start" value="resultsStart" />
        <ww:param name="size" value="results.size" />
        <ww:param name="perPage" value="resultsPerPage" />
    </ww:component>
    <tbody>
        <ww:iterator value="results" status="rowstatus">
            <ww:if test="#rowstatus.count <= resultsPerPage">
                <ww:set name="typeAsString"><ww:property value="type.name()"/></ww:set>
                <tr>
                    <td>
                        <ww:if test="#typeAsString == 'INTERNAL'">
                            <a href="<ww:url namespace="/console/secure/directory" action="viewinternal"><ww:param name="ID" value="id" /></ww:url>">
                        </ww:if>
                        <ww:elseif test="#typeAsString == 'CROWD'">
                            <a href="<ww:url namespace="/console/secure/directory" action="viewremotecrowd" includeParams="none" ><ww:param name="ID" value="id" /></ww:url>">
                        </ww:elseif>
                        <ww:elseif test="#typeAsString == 'CONNECTOR'">
                            <a href="<ww:url namespace="/console/secure/directory" action="viewconnector" includeParams="none" ><ww:param name="ID" value="id" /></ww:url>">
                        </ww:elseif>
                        <ww:elseif test="#typeAsString == 'CUSTOM'">
                            <a href="<ww:url namespace="/console/secure/directory" action="viewcustom" includeParams="none" ><ww:param name="ID" value="id" /></ww:url>">
                        </ww:elseif>
                        <ww:elseif test="#typeAsString == 'DELEGATING'">
                            <a href="<ww:url namespace="/console/secure/directory" action="viewdelegated" includeParams="none" ><ww:param name="ID" value="id" /></ww:url>">
                        </ww:elseif>
                        <ww:else>
                            <a href="<ww:url namespace="/console/secure/directory" action="viewcustom" includeParams="none" ><ww:param name="ID" value="id" /></ww:url>">
                        </ww:else>
                            <ww:property value="name"/>
                        </a>
                    </td>
                    <td><ww:property value="active"/></td>
                    <td><ww:property value="implementationDescriptiveName"/></td>
                    <td>
                        <ww:if test="(#typeAsString == 'CROWD' || #typeAsString == 'CONNECTOR') && isCacheEnabled(top)">
                            <a href="<ww:url namespace="/console/secure/directory" action="synchronisedirectorycache" method="default" includeParams="none"><ww:param name="ID" value="id" /><ww:param name="%{xsrfTokenName}" value="%{xsrfToken}"/></ww:url>" title="<ww:property value="getText('directory.caching.sync.label')"/>"><ww:property value="getText('directory.caching.sync.label')"/></a>
                        </ww:if>
                    </td>
                </tr>
            </ww:if>
        </ww:iterator>
    </tbody>
</table>

<form name="next" method="post" action="<ww:url namespace="/console/secure/directory" action="browse" includeParams="none" />">
    <input type="hidden" name="ID" value="<ww:property value="id" />"/>
    <input type="hidden" name="name" value="<ww:property value="name" />"/>
    <input type="hidden" name="active" value="<ww:property value="active" />"/>
    <input type="hidden" name="resultsStart" value="<ww:property value="nextResultsStart" />"/>
    <input type="hidden" name="resultsPerPage" value="<ww:property value="resultsPerPage" />"/>
</form>
<form name="previous" method="post" action="<ww:url namespace="/console/secure/directory" action="browse" includeParams="none" />">
    <input type="hidden" name="ID" value="<ww:property value="id" />"/>
    <input type="hidden" name="name" value="<ww:property value="name" />"/>
    <input type="hidden" name="active" value="<ww:property value="active" />"/>
    <input type="hidden" name="resultsStart" value="<ww:property value="previousResultsStart" />"/>
    <input type="hidden" name="resultsPerPage" value="<ww:property value="resultsPerPage" />"/>
</form>

</body>
</html>
