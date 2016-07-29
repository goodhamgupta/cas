<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="/struts-tags" prefix="ww" %>
<html>
<head>
    <title></title>
</head>
<body>
<ww:if test="results.empty">
    <p class="picker-msg">
        <ww:text name="picker.no.results.message"/>
    </p>
</ww:if>
<ww:else>
    <table id="entity-details" class="aui">
        <thead>
            <tr>
                <th width="5%">
                    <input type="checkbox" id="selectAllRelations" name="selectAll"/>
                </th>
                <ww:if test="'USER'.equals(resultEntityType)">
                    <!-- User -->
                    <th width="40%"><ww:property value="getText('principal.actualname.label')"/></th>
                    <th width="55%"><ww:property value="getText('principal.info.label')"/></th>
                </ww:if>
                <ww:else>
                    <!-- Group -->
                    <th width="40%"><ww:property value="getText('group.name.label')"/></th>
                    <th width="55%"><ww:property value="getText('group.description.label')"/></th>
                </ww:else>
            </tr>
        </thead>
        <ww:iterator value="results" status="rowstatus">
            <ww:set name="principalname" value="name"/>
            <ww:if test="#rowstatus.count <= resultsPerPage">
                <tr>
                    <td>
                        <input type="checkbox" id="<ww:property value="name"/>" value="<ww:property value="name"/>" name="selectedEntityNames"/>
                    </td>
                    <td class="search-result-name checkbox">
                        <label for="<ww:property value="name"/>">
                            <ww:if test="'USER'.equals(resultEntityType)">
                                <!-- User  -->
                                <ww:if test="displayName != ''">
                                    <!-- Display Name is ideal -->
                                    <ww:property value="displayName"/>
                                </ww:if>
                                <ww:elseif test="firstName != '' && lastName != ''">
                                    <!-- Display First Name + Last Name if there's no Display Name -->
                                    <ww:property value="firstName"/>&nbsp;<ww:property value="lastName"/>
                                </ww:elseif>
                                <ww:elseif test="firstName != ''">
                                    <!-- User with only a first name -->
                                    <ww:property value="firstName"/>
                                </ww:elseif>
                                <ww:elseif test="lastName != ''">
                                    <!-- User with only a last name -->
                                    <ww:property value="lastName"/>
                                </ww:elseif>
                                <ww:else>
                                    <!-- fallback to username if nothing else exists -->
                                    <ww:property value="name"/>
                                </ww:else>
                            </ww:if>
                            <ww:else>
                                <!-- Group  -->
                                <ww:property value="name"/>
                            </ww:else>
                        </label>
                    </td>
                    <td class="search-result-details">
                        <ww:if test="'USER'.equals(resultEntityType)">
                            <!-- User  -->
                            <!-- In here goes aliases & other details relevant to the search made -->
                            <ww:property value="emailAddress"/><br/>
                            <em><ww:property value="name"/></em>
                        </ww:if>
                        <ww:else>
                            <!-- Group  -->
                            <ww:property value="description"/>
                        </ww:else>
                    </td>
                </tr>
            </ww:if>
        </ww:iterator>
    </table>
    <ww:hidden name="%{xsrfTokenName}" value="%{xsrfToken}"/>
</ww:else>
</body>
</html>
