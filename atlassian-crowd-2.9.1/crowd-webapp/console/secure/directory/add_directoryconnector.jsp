<%@ page import="com.atlassian.crowd.directory.ldap.LDAPPropertiesMapper" %>
<%@ page import="com.atlassian.crowd.directory.ldap.util.LDAPPropertiesHelper" %>
<%@ page import="com.atlassian.spring.container.ContainerManager" %>
<%@ page import="java.util.Collection" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.util.Properties" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="/struts-tags" prefix="ww" %>
<html>
<head>
    <title><ww:text name="directoryconnectorcreate.title"/></title>
    <meta name="section" content="directories"/>
    <meta name="pagename" content="adddirectory"/>
    <meta name="help.url" content="<ww:property value="getText('help.directory.add.connector.details')"/>"/>
    <script>
        function configurePage() {
            hideShowUserEncryption();
            hideShowUseNestedGroups();
        <ww:if test="initialLoad == true">
            updateConfiguration();
        </ww:if>
        }
        AJS.$(configurePage);

        // sets the default values for the ldap connector
        function updateConfiguration() {
            // get the form
            var form = document.getElementById('directoryconnector');

        <%
            LDAPPropertiesHelper ldapPropertiesHelper =(LDAPPropertiesHelper) ContainerManager.getComponent("ldapPropertiesHelper");
            Collection values = ldapPropertiesHelper.getImplementations().values();

            for (Iterator itr = values.iterator(); itr.hasNext(); ) {
                String impl = (String) itr.next();
                Properties props = ldapPropertiesHelper.getConfigurationDetails().get(impl);
        %>

            if (form.connector.value == '<%=impl%>') {
                form.groupDescriptionAttr.value = '<%=props.get(LDAPPropertiesMapper.GROUP_DESCRIPTION_KEY)%>';
                form.groupMemberAttr.value = '<%=props.get(LDAPPropertiesMapper.GROUP_USERNAMES_KEY)%>';
                form.groupNameAttr.value = '<%=props.get(LDAPPropertiesMapper.GROUP_NAME_KEY)%>';
                form.groupObjectClass.value = '<%=props.get(LDAPPropertiesMapper.GROUP_OBJECTCLASS_KEY)%>';
                form.groupObjectFilter.value = '<%=props.get(LDAPPropertiesMapper.GROUP_OBJECTFILTER_KEY)%>';

                form.userFirstnameAttr.value = '<%=props.get(LDAPPropertiesMapper.USER_FIRSTNAME_KEY)%>';
                form.userGroupMemberAttr.value = '<%=props.get(LDAPPropertiesMapper.USER_GROUP_KEY)%>';
                form.userMailAttr.value = '<%=props.get(LDAPPropertiesMapper.USER_EMAIL_KEY)%>';
                form.userNameAttr.value = '<%=props.get(LDAPPropertiesMapper.USER_USERNAME_KEY)%>';
                form.userNameRdnAttr.value = '<%=props.get(LDAPPropertiesMapper.USER_USERNAME_RDN_KEY)%>';
                form.userLastnameAttr.value = '<%=props.get(LDAPPropertiesMapper.USER_LASTNAME_KEY)%>';
                form.userDisplayNameAttr.value = '<%=props.get(LDAPPropertiesMapper.USER_DISPLAYNAME_KEY)%>';
                form.userObjectClass.value = '<%=props.get(LDAPPropertiesMapper.USER_OBJECTCLASS_KEY)%>';
                form.userPasswordAttr.value = '<%=props.get(LDAPPropertiesMapper.USER_PASSWORD_KEY)%>';
                form.userObjectFilter.value = '<%=props.get(LDAPPropertiesMapper.USER_OBJECTFILTER_KEY)%>';
                form.userExternalIdAttr.value = '<%=props.get(LDAPPropertiesMapper.LDAP_EXTERNAL_ID)%>';

                form.pagedResults.checked = <%=props.get(LDAPPropertiesMapper.LDAP_PAGEDRESULTS_KEY)%>;
                form.referral.checked = <%=props.get(LDAPPropertiesMapper.LDAP_REFERRAL_KEY)%>;
                form.useRelaxedDNStandardisation.checked = <%=props.get(LDAPPropertiesMapper.LDAP_RELAXED_DN_STANDARDISATION)%>;
            }
        <%
            }
        %>
            // Hide the user encryption if we are not using OpenLDAP or ApacheDS
            hideShowUserEncryption();
            // Hide the option to filter the expired users if we are not using ActiveDirectory
            hideShowExpiredUsersFiltering();
            // Hide nested groups for directories that don't support them.
            hideShowUseNestedGroups();

            // Hide the paged results option if we are not using paged results.
            hideShowPagedResultsSize();

            // The "memberOf" for group membership only applies to AD.
            hideShowUseUMAForGroupMembership();

            // The primary group support only applies to AD.
            hideShowPrimaryGroupSupport();

            // Enable incremental sync option only applies to AD.
            hideShowIncrementalSyncConfiguration();

            // Local user status support only applies to AD
            hideShowLocalUserStatus();
        }

        function hideShowUserEncryption() {
            // get the form
            var form = document.getElementById('directoryconnector');
            var connectorVal = form.connector.value;

            // Hide the user encryption if we are not using OpenLDAP or ApacheDS
            if (
                    connectorVal == 'com.atlassian.crowd.directory.OpenLDAP' ||
                    connectorVal == 'com.atlassian.crowd.directory.OpenLDAPRfc2307' ||
                    connectorVal == 'com.atlassian.crowd.directory.GenericLDAP' ||
                    connectorVal == 'com.atlassian.crowd.directory.Rfc2307' ||
                    connectorVal == 'com.atlassian.crowd.directory.ApacheDS' ||
                    connectorVal == 'com.atlassian.crowd.directory.ApacheDS15'
            ) {
                document.getElementById("user_encryption").style.display="block";
                form.userEncryptionMethod.value = "ssha";
            } else {
                document.getElementById("user_encryption").style.display="none";
                form.userEncryptionMethod.value = "";
            }
        }

        function hideShowExpiredUsersFiltering() {
            // get the form
            var form = document.getElementById('directoryconnector');

            // Hide the option to filter expired users if we are not using ActiveDirectory
            if (form.connector.value == 'com.atlassian.crowd.directory.MicrosoftActiveDirectory') {
                document.getElementById("expired_user_filtering").style.display="block";
            } else {
                document.getElementById("expired_user_filtering").style.display="none";
            }
        }

        function hideShowPagedResultsSize() {
            // Hide the user encryption if we are not using OpenLDAP or ApacheDS
            document.getElementById("paged_results_size").style.display = (document.getElementById('directoryconnector').pagedResults.checked ? "block" : "none");
        }

        function hideShowUseNestedGroups() {
            // get the form
            var form = document.getElementById('directoryconnector');

            // Hide nested groups for the directories that don't support them.
            if (
                    form.connector.value == 'com.atlassian.crowd.directory.Rfc2307' ||
                    form.connector.value == 'com.atlassian.crowd.directory.AppleOpenDirectory' ||
                    form.connector.value == 'com.atlassian.crowd.directory.OpenLDAPRfc2307' ||
                    form.connector.value == 'com.atlassian.crowd.directory.FedoraDS'
            ) {
                document.getElementById("nested_groups").style.display="none";
            } else {
                document.getElementById("nested_groups").style.display="block";
            }
        }

        function hideShowUseUMAForGroupMembership() {
            // get the form
            var form = document.getElementById('directoryconnector');

            // Hide nested groups for the directories that don't support them.
            if (form.connector.value == 'com.atlassian.crowd.directory.MicrosoftActiveDirectory') {
                document.getElementById("uma_groupmembership").style.display="block";
            } else {
                document.getElementById("uma_groupmembership").style.display="none";
            }
        }

        function hideShowPrimaryGroupSupport() {
            // get the form
            var form = document.getElementById('directoryconnector');

            // Hide primary group support for the directories that don't support them.
            if (form.connector.value == 'com.atlassian.crowd.directory.MicrosoftActiveDirectory') {
                document.getElementById("primary_group_support").style.display="block";
            } else {
                document.getElementById("primary_group_support").style.display="none";
            }
        }

        function hideShowIncrementalSyncConfiguration() {
            // get the form
            var form = document.getElementById('directoryconnector');

            // Hide enable incremental sync for directories that don't support it.
            if (form.connector.value == 'com.atlassian.crowd.directory.MicrosoftActiveDirectory') {
                document.getElementById("enable_incremental_sync").style.display="block";
            } else {
                document.getElementById("enable_incremental_sync").style.display="none";
            }
        }

        function hideShowLocalUserStatus() {
            // get the form
            var form = document.getElementById('directoryconnector');

            // Hide enable local user status for directories that don't support it.
            if (form.connector.value == 'com.atlassian.crowd.directory.MicrosoftActiveDirectory') {
                document.getElementById("local_user_status").style.display="block";
            } else {
                document.getElementById("local_user_status").style.display="none";
            }
        }

        function testConfiguration() {
            document.getElementById('directoryconnector').action = "<ww:url namespace="/console/secure/directory" action="testConfiguration" method="testConfiguration" includeParams="none"/>";

            setDirectoryConnectorReturnTab(2);

            document.getElementById('directoryconnector').submit();
        }

        function testGroupSearch() {
            document.getElementById('directoryconnector').action = "<ww:url namespace="/console/secure/directory" action="testGroupSearch" method="testGroupSearch" includeParams="none"/>";

            setDirectoryConnectorReturnTab(3);

            document.getElementById('directoryconnector').submit();
        }

        function testPrincipalSearch() {
            document.getElementById('directoryconnector').action = "<ww:url namespace="/console/secure/directory" action="testPrincipalSearch" method="testPrincipalSearch" includeParams="none"/>";

            setDirectoryConnectorReturnTab(3);

            document.getElementById('directoryconnector').submit();
        }

        function setDirectoryConnectorReturnTab(tabNumber) {
            var tabNumberElement = document.createElement("input");
            tabNumberElement.setAttribute("type", "hidden");
            tabNumberElement.setAttribute("name", "tab");
            tabNumberElement.setAttribute("id", "tab");
            tabNumberElement.setAttribute("value", tabNumber);

            document.getElementById('directoryconnector').appendChild(tabNumberElement);
        }

        AJS.$(document).on('tabSelect', '.tabs-menu > li.menu-item > a', function (e, tabData) {
            var helpLinks = [
                '<ww:property value="getText('help.directory.add.connector.details')"/>',
                '<ww:property value="getText('help.directory.add.connector.connector')"/>',
                '<ww:property value="getText('help.directory.add.connector.configuration')"/>',
                '<ww:property value="getText('help.directory.add.connector.permissions')"/>'
            ];
            setHelpLink(helpLinks[tabData.tab.parent().prevAll().length]);
        });
    </script>
</head>
<body>

<h2><ww:text name="directoryconnectorcreate.title"/></h2>
<ww:set name="formContent">
    <div class="aui-tabs horizontal-tabs">
        <ul class="tabs-menu">
            <li class="menu-item<ww:if test="tab == 1 || tab == null"> active-tab</ww:if>" id="hreftab1">
                <a href="#tab1">
                    <strong><ww:property value="getText('menu.details.label')"/></strong>
                </a>
            </li>
            <li class="menu-item<ww:if test="tab == 2"> active-tab</ww:if>" id="hreftab2">
                <a href="#tab2">
                    <strong><ww:property value="getText('menu.connector.label')"/></strong>
                </a>
            </li>
            <li class="menu-item<ww:if test="tab == 3"> active-tab</ww:if>" id="hreftab3">
                <a href="#tab3">
                    <strong><ww:property value="getText('menu.configuration.label')"/></strong>
                </a>
            </li>
            <li class="menu-item" id="hreftab4">
                <a href="#tab4">
                    <strong><ww:property value="getText('menu.permissions.label')"/></strong>
                </a>
            </li>
        </ul>
        <div class="tabs-pane<ww:if test="tab == 1 || tab == null"> active-pane</ww:if>" id="tab1">
            <ww:component template="form_tab_messages.jsp">
                <ww:param name="tabID" value="1"/>
            </ww:component>
            <ww:textfield name="name" size="50">
                <ww:param name="label" value="getText('directoryinternal.name.label')"/>
                <ww:param name="description">
                    <ww:property value="getText('directoryinternal.name.description')"/>
                </ww:param>
                <ww:param name="required" value="true" />
            </ww:textfield>
            <ww:textfield name="description" size="50">
                <ww:param name="label" value="getText('directoryinternal.description.label')"/>
                <ww:param name="fieldWidth" value="'long'"/>
                <ww:param name="description">
                    <ww:property value="getText('directoryinternal.description.description')"/>
                </ww:param>
            </ww:textfield>
            <ww:checkbox name="active" fieldValue="true">
                <ww:param name="label" value="getText('directory.active.label')"/>
                <ww:param name="description">
                    <ww:property value="getText('directory.active.description')"/>
                </ww:param>
            </ww:checkbox>
            <ww:checkbox name="cacheEnabled" fieldValue="true">
                <ww:param name="label" value="getText('directory.caching.enabled.label')"/>
                <ww:param name="description">
                    <ww:property value="getText('directory.caching.enabled.description')"/>
                </ww:param>
            </ww:checkbox>
        </div>
        <div class="tabs-pane<ww:if test="tab == 2"> active-pane</ww:if>" id="tab2">
            <ww:component template="form_tab_messages.jsp">
                <ww:param name="tabID" value="2"/>
            </ww:component>
            <ww:select name="connector" list="connectors" listKey="value" listValue="key" onchange="javascript:updateConfiguration();">
                <ww:param name="label" value="getText('directory.connector.label')"/>
                <ww:param name="description">
                    <ww:property value="getText('directory.connector.description')"/>
                </ww:param>
                <ww:param name="required" value="true" />
            </ww:select>
            <ww:textfield name="URL" size="50">
                <ww:param name="label" value="getText('directoryconnector.url.label')"/>
                <ww:param name="description">
                    <ww:property value="getText('directoryconnector.url.description')"/>
                </ww:param>
                <ww:param name="required" value="true" />
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
            <div id="expired_user_filtering">
                <ww:checkbox name="filterExpiredUsers" fieldValue="true">
                    <ww:param name="label" value="getText('directoryconnector.filterexpiredusers.label')"/>
                    <ww:param name="description">
                        <ww:property value="getText('directoryconnector.filterexpiredusers.description')"/>
                    </ww:param>
                </ww:checkbox>
            </div>
            <div id="local_user_status">
                <ww:checkbox name="localUserStatusEnabled" fieldValue="true">
                    <ww:param name="label" value="getText('directoryconnector.localuserstatus.label')"/>
                    <ww:param name="description">
                        <ww:property value="getText('directoryconnector.localuserstatus.description')"/>
                    </ww:param>
                </ww:checkbox>
            </div>
            <ww:checkbox name="localGroupsEnabled" fieldValue="true">
                <ww:param name="label" value="getText('directoryconnector.localgroups.label')"/>
                <ww:param name="description">
                    <ww:property value="getText('directoryconnector.localgroups.description')"/>
                </ww:param>
            </ww:checkbox>
            <div id="nested_groups">
                <ww:checkbox name="useNestedGroups" fieldValue="true">
                    <ww:param name="label" value="getText('directoryconnector.nestedgroups.label')"/>
                    <ww:param name="description">
                        <ww:property value="getText('directoryconnector.nestedgroups.description')"/>
                    </ww:param>
                </ww:checkbox>
            </div>
            <ww:checkbox name="useUserMembershipAttribute" fieldValue="true">
                <ww:param name="label" value="getText('directoryconnector.useusermembershipattribute.label')"/>
                <ww:param name="description">
                    <ww:property value="getText('directoryconnector.useusermembershipattribute.description')"/>
                </ww:param>
            </ww:checkbox>
            <div id="uma_groupmembership">
                <ww:checkbox name="useUserMembershipAttributeForGroupMembership" fieldValue="true">
                    <ww:param name="label" value="getText('directoryconnector.useuma.forgroupmembership.label')"/>
                    <ww:param name="description">
                        <ww:property value="getText('directoryconnector.useuma.forgroupmembership.description')"/>
                    </ww:param>
                </ww:checkbox>
            </div>
            <ww:checkbox name="pagedResults" fieldValue="true" onclick="javascript:hideShowPagedResultsSize();" >
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
            <div id="primary_group_support">
                <ww:checkbox name="primaryGroupSupport" fieldValue="true">
                    <ww:param name="label" value="getText('directoryconnector.primarygroupsupport.label')"/>
                    <ww:param name="description">
                        <ww:property value="getText('directoryconnector.primarygroupsupport.description')"/>
                    </ww:param>
                </ww:checkbox>
            </div>
            <div id="enable_incremental_sync">
                <ww:checkbox name="incrementalSyncEnabled" fieldValue="true">
                    <ww:param name="label" value="getText('directoryconnector.incrementalsync.enable.label')"/>
                    <ww:param name="description">
                        <ww:property value="getText('directoryconnector.incrementalsync.enable.description')"/>
                    </ww:param>
                </ww:checkbox>
            </div>
            <div id="polling_interval">
                <ww:textfield name="pollingIntervalInMin">
                    <ww:param name="label" value="getText('directoryconnector.polling.interval.label')"/>
                    <ww:param name="type" value="'number'" />
                    <ww:param name="fieldWidth" value="'short'"/>
                    <ww:param name="description">
                        <ww:property value="getText('directoryconnector.polling.interval.description')"/>
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
            <div id="user_encryption">
                <ww:select list="userEncryptionMethods" name="userEncryptionMethod" listKey="key" listValue="value">
                    <ww:param name="label" value="getText('directoryconnector.userencryptionmethod.label')"/>
                    <ww:param name="description">
                        <ww:property value="getText('directoryconnector.userencryptionmethod.ldap.description')"/>
                    </ww:param>
                </ww:select>
            </div>
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
                    <ww:property value="getText('directoryconnector.password.description')"/>
                </ww:param>
            </ww:password>
            <ww:hidden name="savedLdapPassword" value="%{ldapPassword}" />
            <div class="field-group">
                <input id="test-connection" type="button" class="aui-button" value="<ww:property value="getText('directoryconnector.testconnection.label')"/>" onClick="testConfiguration();"/>
            </div>
        </div>
        <div class="tabs-pane<ww:if test="tab == 3"> active-pane</ww:if>" id="tab3">
            <ww:component template="form_tab_messages.jsp">
                <ww:param name="tabID" value="3"/>
            </ww:component>

            <h3><ww:property value="getText('directoryconnector.userconfiguration.label')"/></h3>
            <ww:textfield name="userDNaddition" size="35">
                <ww:param name="label" value="getText('directoryconnector.userdnaddition.label')"/>
                <ww:param name="description">
                    <ww:property value="getText('directoryconnector.userdnaddition.description')"/>
                </ww:param>
            </ww:textfield>
            <ww:textfield name="userObjectClass" size="35">
                <ww:param name="label" value="getText('directoryconnector.userobjectclass.label')"/>
                <ww:param name="description">
                    <ww:property value="getText('directoryconnector.userobjectclass.description')"/>
                </ww:param>
                <ww:param name="required" value="true" />
            </ww:textfield>
            <ww:textfield name="userObjectFilter" size="35">
                <ww:param name="label" value="getText('directoryconnector.userobjectfilter.label')"/>
                <ww:param name="description">
                    <ww:property value="getText('directoryconnector.userobjectfilter.description')"/>
                </ww:param>
                <ww:param name="required" value="true" />
            </ww:textfield>
            <ww:textfield name="userNameAttr" size="35">
                <ww:param name="label" value="getText('directoryconnector.usernameattribute.label')"/>
                <ww:param name="description">
                    <ww:property value="getText('directoryconnector.usernameattribute.description')"/>
                </ww:param>
                <ww:param name="required" value="true" />
            </ww:textfield>
            <ww:textfield name="userNameRdnAttr" size="35">
                <ww:param name="label" value="getText('directoryconnector.usernamerdnattribute.label')"/>
                <ww:param name="description">
                    <ww:property value="getText('directoryconnector.usernamerdnattribute.description')"/>
                </ww:param>
                <ww:param name="required" value="true" />
            </ww:textfield>
            <ww:textfield name="userFirstnameAttr" size="35">
                <ww:param name="label" value="getText('directoryconnector.userfirstnameattribute.label')"/>
                <ww:param name="description">
                    <ww:property value="getText('directoryconnector.userfirstnameattribute.description')"/>
                </ww:param>
                <ww:param name="required" value="true" />
            </ww:textfield>
            <ww:textfield name="userLastnameAttr" size="35">
                <ww:param name="label" value="getText('directoryconnector.userlastnameattribute.label')"/>
                <ww:param name="description">
                    <ww:property value="getText('directoryconnector.userlastnameattribute.description')"/>
                </ww:param>
                <ww:param name="required" value="true" />
            </ww:textfield>
            <ww:textfield name="userDisplayNameAttr" size="35">
                <ww:param name="label" value="getText('directoryconnector.userdisplaynameattribute.label')"/>
                <ww:param name="description">
                    <ww:property value="getText('directoryconnector.userdisplaynameattribute.description')"/>
                </ww:param>
                <ww:param name="required" value="true" />
            </ww:textfield>
            <ww:textfield name="userMailAttr" size="35">
                <ww:param name="label" value="getText('directoryconnector.usermailattribute.label')"/>
                <ww:param name="description">
                    <ww:property value="getText('directoryconnector.usermailattribute.description')"/>
                </ww:param>
                <ww:param name="required" value="true" />
            </ww:textfield>
            <ww:textfield name="userGroupMemberAttr" size="35">
                <ww:param name="label" value="getText('directoryconnector.usermemberofattribute.label')"/>
                <ww:param name="description">
                    <ww:property value="getText('directoryconnector.usermemberofattribute.description')"/>
                </ww:param>
                <ww:param name="required" value="true" />
            </ww:textfield>
            <ww:textfield name="userPasswordAttr" size="35">
                <ww:param name="label" value="getText('directoryconnector.userpassword.label')"/>
                <ww:param name="description">
                    <ww:property value="getText('directoryconnector.userpassword.description')"/>
                </ww:param>
                <ww:param name="required" value="true" />
            </ww:textfield>

	        <ww:textfield name="userExternalIdAttr" size="35">
    	        <ww:param name="label" value="getText('directoryconnector.userexternalidattribute.label')"/>
        	    <ww:param name="description">
            	    <ww:property value="getText('directoryconnector.userexternalidattribute.description')"/>
	            </ww:param>
    	        <ww:param name="required" value="false" />
        	</ww:textfield>

            <div class="field-group">
                <input id="test-search-principal" type="button" class="aui-button" value="<ww:property value="getText('directoryconnector.testsearch.label')"/>" onClick="testPrincipalSearch();"/>
            </div>

            <h3><ww:property value="getText('directoryconnector.groupconfiguration.label')"/></h3>
            <ww:textfield name="groupDNaddition" size="35">
                <ww:param name="label" value="getText('directoryconnector.groupdnaddition.label')"/>
                <ww:param name="description">
                    <ww:property value="getText('directoryconnector.groupdnaddition.description')"/>
                </ww:param>
            </ww:textfield>
            <ww:textfield name="groupObjectClass" size="35">
                <ww:param name="label" value="getText('directoryconnector.groupobjectclass.label')"/>
                <ww:param name="description">
                    <ww:property value="getText('directoryconnector.groupobjectclass.description')"/>
                </ww:param>
                <ww:param name="required" value="true" />
            </ww:textfield>
            <ww:textfield name="groupObjectFilter" size="35">
                <ww:param name="label" value="getText('directoryconnector.groupobjectfilter.label')"/>
                <ww:param name="description">
                    <ww:property value="getText('directoryconnector.groupobjectfilter.description')"/>
                </ww:param>
                <ww:param name="required" value="true" />
            </ww:textfield>
            <ww:textfield name="groupNameAttr" size="35">
                <ww:param name="label" value="getText('directoryconnector.groupname.label')"/>
                <ww:param name="description">
                    <ww:property value="getText('directoryconnector.groupname.description')"/>
                </ww:param>
                <ww:param name="required" value="true" />
            </ww:textfield>
            <ww:textfield name="groupDescriptionAttr" size="35">
                <ww:param name="label" value="getText('directoryconnector.groupdescription.label')"/>
                <ww:param name="description">
                    <ww:property value="getText('directoryconnector.groupdescription.description')"/>
                </ww:param>
                <ww:param name="required" value="true" />
            </ww:textfield>
            <ww:textfield name="groupMemberAttr" size="35">
                <ww:param name="label" value="getText('directoryconnector.groupmember.label')"/>
                <ww:param name="description">
                    <ww:property value="getText('directoryconnector.groupmember.description')"/>
                </ww:param>
                <ww:param name="required" value="true" />
            </ww:textfield>
            <div class="field-group">
                <input id="test-search-group" type="button" class="aui-button" value="<ww:property value="getText('directoryconnector.testsearch.label')"/>" onClick="testGroupSearch();"/>
            </div>
        </div>
        <div class="tabs-pane" id="tab4">
            <ww:component template="form_tab_messages.jsp">
                <ww:param name="tabID" value="4"/>
            </ww:component>
            <ww:component template="permissions.jsp">
                <ww:param name="legend" value="getText('menu.permissions.label')"/>
            </ww:component>
        </div>
    </div>
</ww:set>
<ww:component template="form.jsp" id="directoryconnector">
    <ww:param name="action"><ww:url namespace="/console/secure/directory" action="createconnector" method="update" includeParams="none" /></ww:param>
    <ww:param name="content" value="#formContent" />
    <ww:param name="submitLabel" value="getText('continue.label')" />
    <ww:param name="cancelUri"><ww:url namespace="/console/secure/directory" action="browse" includeParams="none" /></ww:param>
    <ww:param name="includeFormMessages" value="false" />
</ww:component>

</body>
</html>
