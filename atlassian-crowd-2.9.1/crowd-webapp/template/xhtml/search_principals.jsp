<%
    /**
     * Component Usage:
     *
     * %{parameters.webwork.namespace}
     * %{parameters.webwork.action}
     * %{parameters.applicationid}
     *
     *
     * e.g.
     * <ww:param name="webwork.namespace" value="/console/secure/application"/>
     * <ww:param name="webwork.action" value="viewusers"/>
     * <ww:param name="applicationid" value="ID"/>
     *
     * Action must provide:
     * - getResults(): returning List<User>
     * - getAliasForUser(String username): returning String alias or null if there is no alias.
     */
%>

<%@ taglib uri="/struts-tags" prefix="ww" %>

<ww:set name="formContent">
    <ww:property value="%{parameters.webwork.namespace}"/>
    <ww:textfield name="search">
        <ww:param name="label" value="getText('browser.filter.label')"/>
        <ww:param name="fieldAfter">
            <ww:if test="%{parameters.applicationid}">
                <input type="hidden" name="ID" value="<ww:property value="parameters.applicationid" />"/>
                <input type="submit" id="submit-search" class="aui-button aui-button-primary" value="<ww:text name="browser.filter.label"/>"/>
            </ww:if>
        </ww:param>
    </ww:textfield>

    <!-- Search by Application -->
    <ww:if test="%{parameters.applicationid}">
    </ww:if>
    <ww:else>
        <!-- Search by Directories -->
        <ww:select name="directoryID" list="directories" listKey="id" listValue="name">
            <ww:param name="label" value="getText('browser.directory.label')"/>
            <ww:param name="emptyOption" value="getText('selectdirectory.label')" />
        </ww:select>
        <ww:select name="active" list="activeOption" listKey="key" listValue="value">
            <ww:param name="label" value="getText('principal.active.label')"/>
            <ww:param name="fieldWidth" value="'medium'"/>
        </ww:select>
    </ww:else>
</ww:set>
<ww:component template="form.jsp" id="searchusers">
    <ww:param name="method" value="'get'" />
    <ww:param name="action"><ww:url includeParams="none"><ww:param name="namespace" value="%{parameters.webwork.namespace}"/><ww:param name="action" value="%{parameters.webwork.action}"/></ww:url></ww:param>
    <ww:param name="content" value="#formContent" />
    <ww:param name="includeSubmitButton" value="parameters.applicationid == null"/>
    <ww:param name="submitLabel" value="getText('browser.filter.label')" />
    <ww:param name="includeXsrfToken" value="false" />
</ww:component>

<ww:if test="results != null && results.size > 0">
    <table class="search-results aui" id="user-details">
        <thead>
            <tr>
                <th width="32px"></th>
                <th width="40%"><ww:property value="getText('principal.actualname.label')"/></th>
                <th><ww:property value="getText('principal.info.label')"/></th>
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
                 <td><ww:if test="avatarUrl != null">
                       <span class="aui-avatar aui-avatar-medium">
                         <span class="aui-avatar-inner">
                           <img src="<ww:property value="avatarUrl"/>" height="32" alt="">
                         </span>
                       </span>
                     </ww:if></td>
                    <td class="search-result-name" id="search-result-name-<ww:property value="#rowstatus.count"/>">
                        <a href="<ww:url namespace="/console/secure/user" action="view" method="default" includeParams="none" ><ww:param name="name" value="name"/><ww:param name="directoryID" value="directoryId" /></ww:url>"><ww:property value="displayName"/></a>
                    </td>
                    <td class="search-result-details" id="search-result-details-<ww:property value="#rowstatus.count"/>">
                        <ul>
                            <!-- In here goes aliases & other details relevant to the search made -->
                            <li><b><ww:text name="principal.name.label"/></b>:<em> <ww:property value="name"/></em></li>
                            <li><b><ww:text name="principal.email.label"/></b>:<em> <ww:property value="emailAddress"/></em></li>
                            <ww:if test="getAliasForUser(name) != null">
                                <li><b><ww:text name="principal.alias.label"/></b>:<em> <ww:property value="getAliasForUser(name)"/></em></li>
                            </ww:if>
                        </ul>
                    </td>
                </tr>
            </ww:if>
        </ww:iterator>
    </table>
</ww:if>

<form name="next" method="post"
      action="<ww:url includeParams="none"><ww:param name="namespace" value="%{parameters.webwork.namespace}"/><ww:param name="action" value="%{parameters.webwork.action}"/><ww:param name="ID" value="%{parameters.applicationid}"/></ww:url>">
    <input type="hidden" name="directoryID" value="<ww:property value="directoryID" />"/>
    <input type="hidden" name="search" value="<ww:property value="search" />"/>
    <input type="hidden" name="active" value="<ww:property value="active" />"/>
    <input type="hidden" name="resultsStart" value="<ww:property value="nextResultsStart" />"/>
    <input type="hidden" name="resultsPerPage" value="<ww:property value="resultsPerPage" />"/>
</form>

<form name="previous" method="post"
      action="<ww:url includeParams="none"><ww:param name="namespace" value="%{parameters.webwork.namespace}"/><ww:param name="action" value="%{parameters.webwork.action}"/><ww:param name="ID" value="%{parameters.applicationid}"/></ww:url>">
    <input type="hidden" name="directoryID" value="<ww:property value="directoryID" />"/>
    <input type="hidden" name="search" value="<ww:property value="search" />"/>
    <input type="hidden" name="active" value="<ww:property value="active" />"/>
    <input type="hidden" name="resultsStart" value="<ww:property value="previousResultsStart" />"/>
    <input type="hidden" name="resultsPerPage" value="<ww:property value="resultsPerPage" />"/>
</form>

<script>
    /* Takes the value of a text node as HTML, and <strong>s any occurrences of "searchTerm", returning the
    HTML to be applied to the containing object. Used by highlightSearchResults() */
    function highlightTerm(searchTerm) {
        var origHTML = this.innerHTML;
        var newHTML = "";
        var prev = 0, next = 0;
        var searchLen = searchTerm.length;

        next = origHTML.toLowerCase().indexOf(searchTerm.toLowerCase());
        while (next >= 0) {
            newHTML += origHTML.substring(prev, next) + "<strong>" + origHTML.substring(next, next + searchLen) + "</strong>";

            prev = next + searchLen;
            next = origHTML.toLowerCase().indexOf(searchTerm.toLowerCase(), prev);
        }
        newHTML += origHTML.substring(prev);

        // only overwrite on change
        if (newHTML != "") {
            this.innerHTML = newHTML;
        }
    }

    // Highlights the searched-for term in the results
    AJS.$(function () {
        var searchTerm = "<ww:property value="search"/>";
        if (searchTerm != "") {
            var userDetailsTable = document.getElementById('user-details');
            if (!userDetailsTable) {
                return;
            }
            var resultRows = userDetailsTable.getElementsByTagName('td');
            var len = resultRows.length;
            for (var i = 0; i < len; i++) {
                var cell = resultRows[i];
                if (cell.className == 'search-result-name') {
                    // name cell - text is within an anchor
                    cell = cell.getElementsByTagName('a')[0];
                    highlightTerm.call(cell, searchTerm);
                } else {
                    // details cell - a <ul> containing <li>s
                    var lis = cell.getElementsByTagName('li');
                    for (var j = 0; j < lis.length; j++) {
                        // items are encased in a <em>
                        var items = lis[j].getElementsByTagName('em');
                        if (items.length > 0) {
                            highlightTerm.call(items[0], searchTerm);
                        }
                    }
                }
            }
        }
    });
</script>
