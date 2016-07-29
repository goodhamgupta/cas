<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="/struts-tags" prefix="ww" %>
<html>
<head>
    <title><ww:property value="getText('browser.group.title')"/></title>
    <meta name="section" content="groups"/>
    <meta name="pagename" content="browsegroup"/>
    <meta name="help.url" content="<ww:property value="getText('help.group.browse')"/>"/>
</head>
<body>
<h2><ww:property value="getText('browser.group.title')"/></h2>
<ww:set name="formContent">
    <ww:select name="directoryID" list="directories" listKey="id" listValue="name">
        <ww:param name="label" value="getText('browser.directory.label')"/>
        <ww:param name="emptyOption" value="getText('selectdirectory.label')" />
    </ww:select>
    <ww:textfield name="name" size="15">
        <ww:param name="label" value="getText('application.name.label')"/>
        <ww:param name="fieldWidth" value="'medium'"/>
    </ww:textfield>
    <ww:select list="activeOption" listKey="key" listValue="value" name="active">
        <ww:param name="label" value="getText('application.active.label')"/>
        <ww:param name="fieldWidth" value="'medium'"/>
    </ww:select>
    <ww:select list="resultsPerPageOption" listKey="toString()" listValue="toString()" name="resultsPerPage">
        <ww:param name="label" value="getText('browser.resultsperpage.label')"/>
        <ww:param name="fieldWidth" value="'short'"/>
    </ww:select>
</ww:set>
<ww:component template="form.jsp" id="browsegroups">
    <ww:param name="method" value="'get'" />
    <ww:param name="action"><ww:url namespace="/console/secure/group" action="browse" includeParams="none" /></ww:param>
    <ww:param name="cancelUri"><ww:url namespace="/console/secure/group" action="browse" includeParams="none" /></ww:param>
    <ww:param name="submitLabel" value="getText('browser.filter.label')" />
    <ww:param name="cancelLabel" value="getText('browser.resetfilter.label')" />
    <ww:param name="content" value="#formContent" />
    <ww:param name="includeXsrfToken" value="false" />
</ww:component>

<ww:if test="results != null && results.size > 0">
    <table id="group-details" class="aui">
        <thead>
            <tr>
                <th width="90%"><ww:property value="getText('group.name.label')"/></th>
                <th width="10%"><ww:property value="getText('group.active.label')"/></th>
            </tr>
        </thead>
        <ww:component template="pager.jsp">
            <ww:param name="columns" value="2" />
            <ww:param name="start" value="resultsStart" />
            <ww:param name="size" value="results.size" />
            <ww:param name="perPage" value="resultsPerPage" />
        </ww:component>
        <ww:iterator value="results" status="rowstatus">
            <ww:if test="#rowstatus.count <= resultsPerPage">
                <tr>
                    <td>
                        <a href="<ww:url namespace="/console/secure/group" action="view" method="default" includeParams="none"><ww:param name="name" value="name" /><ww:param name="directoryID" value="[1].directoryID" /></ww:url>">
                            <ww:property value="name"/>
                        </a>
                    </td>
                    <td><ww:property value="active"/></td>
                </tr>
            </ww:if>
        </ww:iterator>
    </table>
</ww:if>

<form name="next" method="post" action="<ww:url namespace="/console/secure/group" action="browse" includeParams="none" />">
    <input type="hidden" name="ID" value="<ww:property value="ID" />"/>
    <input type="hidden" name="directoryID" value="<ww:property value="directoryID" />"/>
    <input type="hidden" name="name" value="<ww:property value="name" />"/>
    <input type="hidden" name="active" value="<ww:property value="active" />"/>
    <input type="hidden" name="resultsStart" value="<ww:property value="nextResultsStart" />"/>
    <input type="hidden" name="resultsPerPage" value="<ww:property value="resultsPerPage" />"/>
</form>
<form name="previous" method="post" action="<ww:url namespace="/console/secure/group" action="browse" includeParams="none" />">
    <input type="hidden" name="ID" value="<ww:property value="ID" />"/>
    <input type="hidden" name="directoryID" value="<ww:property value="directoryID" />"/>
    <input type="hidden" name="name" value="<ww:property value="name" />"/>
    <input type="hidden" name="active" value="<ww:property value="active" />"/>
    <input type="hidden" name="resultsStart" value="<ww:property value="previousResultsStart" />"/>
    <input type="hidden" name="resultsPerPage" value="<ww:property value="resultsPerPage" />"/>
</form>

</body>
</html>
