<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="/struts-tags" prefix="ww" %>
<html>
<head>
    <title><ww:property value="getText('browser.application.title')"/></title>
    <meta name="section" content="applications"/>
    <meta name="pagename" content="browse"/>
    <meta name="help.url" content="<ww:property value="getText('help.application.browse')"/>"/>    
</head>
<body>
<h2><ww:property value="getText('browser.application.title')"/></h2>
<ww:set name="formContent">
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
<ww:component template="form.jsp">
    <ww:param name="method" value="'get'" />
    <ww:param name="action"><ww:url namespace="/console/secure/application" action="browse" /></ww:param>
    <ww:param name="cancelUri"><ww:url namespace="/console/secure/application" action="browse" /></ww:param>
    <ww:param name="submitLabel" value="getText('browser.filter.label')" />
    <ww:param name="cancelLabel" value="getText('browser.resetfilter.label')" />
    <ww:param name="content" value="#formContent" />
    <ww:param name="includeXsrfToken" value="false" />
</ww:component>


<table id="application-table" class="aui">
    <thead>
        <tr>
            <th width="40%"><ww:property value="getText('application.name.label')"/></th>
            <th width="60%"><ww:property value="getText('application.description.label')"/></th>
        </tr>
    </thead>
    <ww:component template="pager.jsp">
        <ww:param name="columns" value="2" />
        <ww:param name="start" value="resultsStart" />
        <ww:param name="size" value="results.size" />
        <ww:param name="perPage" value="resultsPerPage" />
    </ww:component>
    <ww:iterator value="results" status="rowstatus" id="application">
        <ww:if test="#rowstatus.count <= resultsPerPage">
            <tr>
                <td>
                    <img class="application-icon" title="<ww:property value="getImageTitle(active, #application.type)"/>" alt="<ww:property value="getImageTitle(active, #application.type)"/>" src="<ww:property value="getImageLocation(active, #application.type)" />"/>
                    <a href="<ww:url namespace="/console/secure/application" action="viewdetails" ><ww:param name="ID" value="id"/></ww:url>"><ww:property value="name"/></a>
                </td>
                <td><ww:property value="description"/></td>
            </tr>
        </ww:if>
    </ww:iterator>
</table>

<form name="next" method="post" action="<ww:url namespace="/console/secure/application" action="browse" />">
    <input type="hidden" name="ID" value="<ww:property value="id" />"/>
    <input type="hidden" name="name" value="<ww:property value="name" />"/>
    <input type="hidden" name="active" value="<ww:property value="active" />"/>
    <input type="hidden" name="resultsStart" value="<ww:property value="nextResultsStart" />"/>
    <input type="hidden" name="resultsPerPage" value="<ww:property value="resultsPerPage" />"/>
</form>
<form name="previous" method="post" action="<ww:url namespace="/console/secure/application" action="browse" />">
    <input type="hidden" name="ID" value="<ww:property value="id" />"/>
    <input type="hidden" name="name" value="<ww:property value="name" />"/>
    <input type="hidden" name="active" value="<ww:property value="active" />"/>
    <input type="hidden" name="resultsStart" value="<ww:property value="previousResultsStart" />"/>
    <input type="hidden" name="resultsPerPage" value="<ww:property value="resultsPerPage" />"/>
</form>

</body>
</html>
