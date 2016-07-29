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
    <meta name="help.url" content="<ww:text name="help.directory.connector.connection"/>"/>
    <script>
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

        function testConfiguration() {
            var form = document.getElementById('connectordetails');

            form.action = "<ww:url namespace="/console/secure/directory" action="testUpdateConfiguration" method="testUpdateConfiguration" includeParams="none"/>";

            var tabNumberElement = document.createElement("input");
            tabNumberElement.setAttribute("type", "hidden");
            tabNumberElement.setAttribute("name", "tab");
            tabNumberElement.setAttribute("id", "tab");
            tabNumberElement.setAttribute("value", "2");

            form.appendChild(tabNumberElement);

            form.submit();
        }

        AJS.$(hideShowPagedResultsSize);
    </script>
</head>
<body>
<h2>
    <ww:text name="menu.viewdirectory.label">
        <ww:param><ww:property value="directory.name"/></ww:param>
    </ww:text>
</h2>

<div class="aui-tabs horizontal-tabs aui-tabs-disabled">
    <jsp:include page="inc_tabs_connector.jsp">
        <jsp:param name="selectedTab" value="2" />
    </jsp:include>
    <div class="tabs-pane active-pane">
        <ww:set name="formContent">
            <ww:component template="form_row.jsp">
                <ww:param name="label" value="getText('directory.type.label')"/>
                <ww:param name="value" value="directoryImplementationDescriptiveName"/>
            </ww:component>
            <ww:textfield name="URL" size="50">
                <ww:param name="label" value="getText('directoryconnector.url.label')"/>
                <ww:param name="description">
                    <ww:property value="getText('directoryconnector.url.description')"/>
                </ww:param>
                <ww:param name="required" value="true"/>
            </ww:textfield>
            <ww:checkbox name="secure" fieldValue="true">
                <ww:param name="label" value="getText('directoryconnector.secure.label')"/>
                <ww:param name="description">
                    <ww:property value="getText('directoryconnector.secure.description')"/>
                </ww:param>
            </ww:checkbox>
            <ww:checkbox name="referral" fieldValue="true">
                <ww:param name="label" value="getText('directoryconnector.referral.label')"/>
                <ww:param name="description">
                    <ww:property value="getText('directoryconnector.referral.description')"/>
                </ww:param>
            </ww:checkbox>
            <ww:if test="directory.implementationClass.equals('com.atlassian.crowd.directory.MicrosoftActiveDirectory')">
                <ww:checkbox name="filterExpiredUsers" fieldValue="true">
                    <ww:param name="label" value="getText('directoryconnector.filterexpiredusers.label')"/>
                    <ww:param name="description">
                        <ww:property value="getText('directoryconnector.filterexpiredusers.description')"/>
                    </ww:param>
                </ww:checkbox>
            </ww:if>
            <ww:if test="directory.implementationClass.equals('com.atlassian.crowd.directory.MicrosoftActiveDirectory')">
                <ww:checkbox name="localUserStatusEnabled" fieldValue="true">
                    <ww:param name="label" value="getText('directoryconnector.localuserstatus.label')"/>
                    <ww:param name="description">
                        <ww:property value="getText('directoryconnector.localuserstatus.description')"/>
                    </ww:param>
                </ww:checkbox>
            </ww:if>
            <ww:checkbox name="localGroupsEnabled" fieldValue="true">
                <ww:param name="label" value="getText('directoryconnector.localgroups.label')"/>
                <ww:param name="description">
                    <ww:property value="getText('directoryconnector.localgroups.description')"/>
                </ww:param>
            </ww:checkbox>
            <ww:checkbox name="useNestedGroups" fieldValue="true">
                <ww:param name="label" value="getText('directoryconnector.nestedgroups.label')"/>
                <ww:param name="description">
                    <ww:property value="getText('directoryconnector.nestedgroups.description')"/>
                </ww:param>
            </ww:checkbox>
            <ww:checkbox name="useUserMembershipAttribute" fieldValue="true">
                <ww:param name="label" value="getText('directoryconnector.useusermembershipattribute.label')"/>
                <ww:param name="description">
                    <ww:property value="getText('directoryconnector.useusermembershipattribute.description')"/>
                </ww:param>
            </ww:checkbox>
            <ww:if test="directory.implementationClass.equals('com.atlassian.crowd.directory.MicrosoftActiveDirectory')">
                <ww:checkbox name="useUserMembershipAttributeForGroupMembership" fieldValue="true">
                    <ww:param name="label" value="getText('directoryconnector.useuma.forgroupmembership.label')"/>
                    <ww:param name="description">
                        <ww:property value="getText('directoryconnector.useuma.forgroupmembership.description')"/>
                    </ww:param>
                </ww:checkbox>
            </ww:if>
            <ww:checkbox name="pagedResults" fieldValue="true" onclick="javascript:hideShowPagedResultsSize();">
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
            <ww:checkbox name="useRelaxedDNStandardisation" fieldValue="true">
                <ww:param name="label" value="getText('directoryconnector.useRelaxedDNStandardisation.label')"/>
                <ww:param name="description">
                    <ww:property value="getText('directoryconnector.useRelaxedDNStandardisation.description')"/>
                </ww:param>
            </ww:checkbox>
            <ww:if test="directory.implementationClass.equals('com.atlassian.crowd.directory.MicrosoftActiveDirectory')">
                <ww:checkbox name="primaryGroupSupport" fieldValue="true">
                    <ww:param name="label" value="getText('directoryconnector.primarygroupsupport.label')"/>
                    <ww:param name="description">
                        <ww:property value="getText('directoryconnector.primarygroupsupport.description')"/>
                    </ww:param>
                </ww:checkbox>
            </ww:if>
            <ww:if test="directory.implementationClass.equals('com.atlassian.crowd.directory.MicrosoftActiveDirectory')">
                <ww:checkbox name="incrementalSyncEnabled" fieldValue="true">
                    <ww:param name="label" value="getText('directoryconnector.incrementalsync.enable.label')"/>
                    <ww:param name="description">
                        <ww:property value="getText('directoryconnector.incrementalsync.enable.description')"/>
                    </ww:param>
                </ww:checkbox>
            </ww:if>
            <ww:textfield name="pollingIntervalInMin">
                <ww:param name="label" value="getText('directoryconnector.polling.interval.label')"/>
                <ww:param name="type" value="'number'" />
                <ww:param name="fieldWidth" value="'short'"/>
                <ww:param name="description">
                    <ww:property value="getText('directoryconnector.polling.interval.description')"/>
                </ww:param>
            </ww:textfield>
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
            <ww:if test="userEncryptionConfigurable">
                <ww:select list="userEncryptionMethods" name="userEncryptionMethod" listKey="key" listValue="value">
                    <ww:param name="label" value="getText('directoryconnector.userencryptionmethod.label')"/>
                    <ww:param name="description">
                        <ww:property value="getText('directoryconnector.userencryptionmethod.ldap.description')"/>
                    </ww:param>
                </ww:select>
            </ww:if>
            <ww:textfield name="baseDN" size="50">
                <ww:param name="label" value="getText('directoryconnector.basedn.label')"/>
                <ww:param name="description">
                    <ww:property value="getText('directoryconnector.basedn.description')"/>
                </ww:param>
            </ww:textfield>
            <ww:textfield name="userDN" size="50">
                <ww:param name="label" value="getText('directoryconnector.userdn.label')"/>
                <ww:param name="description">
                    <ww:property value="getText('directoryconnector.userdn.description')"/>
                </ww:param>
            </ww:textfield>
            <ww:password name="ldapPassword" size="50">
                <ww:param name="label" value="getText('directoryconnector.password.label')"/>
                <ww:param name="description">
                    <ww:property value="getText('directoryconnector.passwordupdate.description')"/>
                </ww:param>
            </ww:password>
            <ww:hidden name="savedLdapPassword" value="%{ldapPassword}" />
            <div class="field-group">
                <input id="test-connection" type="button" class="aui-button" value="<ww:property value="getText('directoryconnector.testconnection.label')"/>" onClick="testConfiguration();"/>
            </div>
            <input type="hidden" name="ID" value="<ww:property value="ID" />"/>
        </ww:set>
        <ww:component template="form.jsp" id="connectordetails">
            <ww:param name="action"><ww:url namespace="/console/secure/directory" action="updateconnectorconnection" method="update" includeParams="none" /></ww:param>
            <ww:param name="content" value="#formContent" />
            <ww:param name="cancelUri"><ww:url namespace="/console/secure/directory" action="viewconnector" method="default" includeParams="none" ><ww:param name="ID" value="ID" /></ww:url></ww:param>
        </ww:component>
    </div>
</div>

</body>
</html>
