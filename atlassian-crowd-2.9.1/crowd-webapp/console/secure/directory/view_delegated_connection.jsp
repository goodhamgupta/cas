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
    <meta name="help.url" content="<ww:property value="getText('help.directory.delegated.connection')"/>"/>
    <script>
        function testConfiguration() {
            var form = document.getElementById('connectordetails');
            form.action = "<ww:url namespace="/console/secure/directory" action="updatedelegatedconnection" method="testUpdateConfiguration" includeParams="none"/>";
            form.submit();
        }

        function hideShowGroupImportOptions() {
            document.getElementById("importGroupsOptions").style.display = (document.getElementById('connectordetails').importGroups.checked ? "block" : "none");
        }

	    function hideShowPagedResultsSize() {
	        // get the form
	        var form = document.getElementById('connectordetails');

	        // Hide the paged results if we are not using AD
	        if (form.pagedResults.checked) {
	            document.getElementById("paged_results_size").style.display = "block";
	        } else {
	            document.getElementById("paged_results_size").style.display = "none";
	            form.pagedResultsSize.value = "";
	        }
	    }

        AJS.$(function () {
            hideShowGroupImportOptions();
            hideShowPagedResultsSize();
        });
    </script>
</head>
<body>
<h2>
    <ww:text name="menu.viewdirectory.label">
        <ww:param><ww:property value="directory.name"/></ww:param>
    </ww:text>
</h2>

<div class="aui-tabs horizontal-tabs aui-tabs-disabled">
    <jsp:include page="inc_tabs_delegated.jsp">
        <jsp:param name="selectedTab" value="2" />
    </jsp:include>
    <div class="tabs-pane active-pane">
        <ww:set name="formContent">
            <ww:component template="form_row.jsp">
                <ww:param name="label" value="getText('directory.delegated.type.label')"/>
                <ww:param name="value" value="delegatedDirectoryType"/>
            </ww:component>
            <ww:textfield name="URL" size="50">
                <ww:param name="label" value="getText('directoryconnector.url.label')"/>
                <ww:param name="required" value="true" />
                <ww:param name="description">
                    <ww:text name="directoryconnector.url.description"/>
                </ww:param>
            </ww:textfield>
            <ww:checkbox name="secure" fieldValue="true">
                <ww:param name="label" value="getText('directoryconnector.secure.label')"/>
                <ww:param name="description">
                    <ww:text name="directoryconnector.secure.description"/>
                </ww:param>
            </ww:checkbox>
            <ww:checkbox name="referral" fieldValue="true">
                <ww:param name="label" value="getText('directoryconnector.referral.label')"/>
                <ww:param name="description">
                    <ww:text name="directoryconnector.referral.description"/>
                </ww:param>
            </ww:checkbox>
            <ww:checkbox name="useNestedGroups" fieldValue="true">
                <ww:param name="label" value="getText('directoryconnector.nestedgroups.label')"/>
                <ww:param name="description">
                    <ww:property value="getText('directoryconnector.nestedgroups.description')"/>
                </ww:param>
            </ww:checkbox>
            <ww:checkbox name="updateUsers" fieldValue="true">
                <ww:param name="label" value="getText('directoryconnector.updateUsers.label')"/>
                <ww:param name="description">
                    <ww:property value="getText('directoryconnector.updateUsers.description')"/>
                </ww:param>
            </ww:checkbox>
            <ww:checkbox name="importGroups" onchange="hideShowGroupImportOptions()">
                <ww:param name="label" value="getText('directoryconnector.importGroups.label')"/>
                <ww:param name="description">
                    <ww:property value="getText('directoryconnector.importGroups.description')"/>
                </ww:param>
            </ww:checkbox>
            <div id="importGroupsOptions">
                <ww:checkbox name="useUserMembershipAttribute" fieldValue="true">
                    <ww:param name="label" value="getText('directoryconnector.useusermembershipattribute.label')"/>
                    <ww:param name="description">
                        <ww:property value="getText('directoryconnector.useusermembershipattribute.description')"/>
                    </ww:param>
                </ww:checkbox>
            </div>
            <ww:if test="userEncryptionConfigurable">
                <ww:select list="userEncryptionMethods" name="userEncryptionMethod" listKey="key" listValue="value">
                    <ww:param name="label" value="getText('directoryconnector.userencryptionmethod.label')"/>
                    <ww:param name="description">
                        <ww:text name="directoryconnector.userencryptionmethod.ldap.description"/>
                    </ww:param>
                </ww:select>
            </ww:if>
            <ww:checkbox name="pagedResults" fieldValue="true" onclick="hideShowPagedResultsSize();">
                <ww:param name="label" value="getText('directoryconnector.pagedresultscontrol.label')"/>
                <ww:param name="description">
                    <ww:property value="getText('directoryconnector.pagedresultscontrol.description')"/>
                </ww:param>
            </ww:checkbox>
            <div id="paged_results_size">
                <ww:textfield name="pagedResultsSize">
                    <ww:param name="label" value="getText('directoryconnector.pagedresultscontrolsize.label')"/>
                    <ww:param name="type" value="'number'" />
                    <ww:param name="fieldWidth" value="'short'"/>
                    <ww:param name="description">
                        <ww:property value="getText('directoryconnector.pagedresultscontrolsize.description')"/>
                    </ww:param>
                </ww:textfield>
            </div>
            <ww:textfield name="readTimeoutInSec">
                <ww:param name="label" value="getText('directoryconnector.pool.readtimeout.label')"/>
                <ww:param name="type" value="'number'" />
                <ww:param name="fieldWidth" value="'short'"/>
                <ww:param name="description">
                    <ww:property value="getText('directoryconnector.pool.readtimeout.description')"/>
                </ww:param>
            </ww:textfield>
            <ww:textfield name="searchTimeoutInSec">
                <ww:param name="label" value="getText('directoryconnector.pool.searchtimeout.label')"/>
                <ww:param name="type" value="'number'" />
                <ww:param name="fieldWidth" value="'short'"/>
                <ww:param name="description">
                    <ww:property value="getText('directoryconnector.pool.searchtimeout.description')"/>
                </ww:param>
            </ww:textfield>
            <ww:textfield name="connectionTimeoutInSec">
                <ww:param name="label" value="getText('directoryconnector.pool.connectiontimeout.label')"/>
                <ww:param name="type" value="'number'" />
                <ww:param name="fieldWidth" value="'short'"/>
                <ww:param name="description">
                    <ww:property value="getText('directoryconnector.pool.connectiontimeout.description')"/>
                </ww:param>
            </ww:textfield>
            <ww:textfield name="baseDN" size="50">
                <ww:param name="label" value="getText('directoryconnector.basedn.label')"/>
                <ww:param name="description">
                    <ww:text name="directoryconnector.basedn.description"/>
                </ww:param>
            </ww:textfield>
            <ww:textfield name="userDN" size="50">
                <ww:param name="label" value="getText('directoryconnector.userdn.label')"/>
                <ww:param name="description">
                    <ww:text name="directoryconnector.userdn.description"/>
                </ww:param>
            </ww:textfield>
            <ww:password name="ldapPassword" size="50">
                <ww:param name="label" value="getText('directoryconnector.password.label')"/>
                <ww:param name="description">
                    <ww:text name="directoryconnector.passwordupdate.description"/>
                </ww:param>
            </ww:password>
            <ww:hidden name="savedLdapPassword" value="%{ldapPassword}" />
            <div class="field-group">
                <input id="test-connection" type="button" class="aui-button" value="<ww:text name="directoryconnector.testconnection.label"/>" onClick="testConfiguration();"/>
            </div>
            <input type="hidden" name="ID" value="<ww:property value="ID" />"/>
        </ww:set>
        <ww:component template="form.jsp" id="connectordetails">
            <ww:param name="action"><ww:url namespace="/console/secure/directory" action="updatedelegatedconnection" method="update" includeParams="none" /></ww:param>
            <ww:param name="content" value="#formContent" />
            <ww:param name="cancelUri"><ww:url namespace="/console/secure/directory" action="viewdelegated" method="default" includeParams="none" ><ww:param name="ID" value="ID" /></ww:url></ww:param>
        </ww:component>
    </div>
</div>
</body>
</html>
