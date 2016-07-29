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
    <title><ww:text name="directory.delegated.create.title"/></title>
    <meta name="section" content="directories"/>
    <meta name="pagename" content="adddirectory"/>
    <meta name="help.url" content="<ww:property value="getText('help.directory.add.delegated.details')"/>"/>
    <script>
        function configurePage() {
            hideShowUserEncryption();
            hideShowGroupImportOptions();
            hideShowPagedResultsSize();
        <ww:if test="initialLoad == true">
            updateConfiguration();
        </ww:if>
        }
        AJS.$(configurePage);

        // sets the default values for the ldap connector
        function updateConfiguration() {
            // get the form
            var form = document.getElementById('directorydelegated');

        <%
            LDAPPropertiesHelper ldapPropertiesHelper =(LDAPPropertiesHelper) ContainerManager.getComponent("ldapPropertiesHelper");
            Collection values = ldapPropertiesHelper.getImplementations().values();

            for (Iterator itr = values.iterator(); itr.hasNext(); ) {
                String impl = (String) itr.next();
                Properties props = ldapPropertiesHelper.getConfigurationDetails().get(impl);
        %>

            if (form.connector.value == '<%=impl%>') {
                form.pagedResults.checked = <%=props.get(LDAPPropertiesMapper.LDAP_PAGEDRESULTS_KEY)%>;
                form.referral.checked = <%=props.get(LDAPPropertiesMapper.LDAP_REFERRAL_KEY)%>;

                form.userFirstnameAttr.value = '<%=props.get(LDAPPropertiesMapper.USER_FIRSTNAME_KEY)%>';
                form.userGroupMemberAttr.value = '<%=props.get(LDAPPropertiesMapper.USER_GROUP_KEY)%>';
                form.userMailAttr.value = '<%=props.get(LDAPPropertiesMapper.USER_EMAIL_KEY)%>';
                form.userNameAttr.value = '<%=props.get(LDAPPropertiesMapper.USER_USERNAME_KEY)%>';
                form.userNameRdnAttr.value = '<%=props.get(LDAPPropertiesMapper.USER_USERNAME_RDN_KEY)%>';
                form.userLastnameAttr.value = '<%=props.get(LDAPPropertiesMapper.USER_LASTNAME_KEY)%>';
                form.userDisplayNameAttr.value = '<%=props.get(LDAPPropertiesMapper.USER_DISPLAYNAME_KEY)%>';
                form.userObjectClass.value = '<%=props.get(LDAPPropertiesMapper.USER_OBJECTCLASS_KEY)%>';
                form.userObjectFilter.value = '<%=props.get(LDAPPropertiesMapper.USER_OBJECTFILTER_KEY)%>';
				form.userExternalIdAttr.value = '<%=props.get(LDAPPropertiesMapper.LDAP_EXTERNAL_ID)%>';

                form.groupDescriptionAttr.value = '<%=props.get(LDAPPropertiesMapper.GROUP_DESCRIPTION_KEY)%>';
                form.groupMemberAttr.value = '<%=props.get(LDAPPropertiesMapper.GROUP_USERNAMES_KEY)%>';
                form.groupNameAttr.value = '<%=props.get(LDAPPropertiesMapper.GROUP_NAME_KEY)%>';
                form.groupObjectClass.value = '<%=props.get(LDAPPropertiesMapper.GROUP_OBJECTCLASS_KEY)%>';
                form.groupObjectFilter.value = '<%=props.get(LDAPPropertiesMapper.GROUP_OBJECTFILTER_KEY)%>';
            }
        <%
            }
        %>
            // Hide the user encryption if we are not using OpenLDAP or ApacheDS
            hideShowUserEncryption();
            hideShowPagedResultsSize();
        }

        function hideShowUserEncryption() {
            // get the form
            var form = document.getElementById('directorydelegated');
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

        function hideShowGroupImportOptions() {
            var display = document.getElementById('directorydelegated').importGroups.checked ? "block" : "none";
            document.getElementById("importGroupsOptions1").style.display = display;
            document.getElementById("importGroupsOptions2").style.display = display;
        }

        function testConfiguration() {
            document.getElementById('directorydelegated').action = "<ww:url namespace="/console/secure/directory" action="createdelegated" method="testConfiguration" includeParams="none"/>";

            setDirectoryConnectorReturnTab(2);

            document.getElementById('directorydelegated').submit();
        }

        function testGroupSearch() {
            document.getElementById('directorydelegated').action = "<ww:url namespace="/console/secure/directory" action="testGroupSearchDelegated" method="testGroupSearch" includeParams="none"/>";

            setDirectoryConnectorReturnTab(3);

            document.getElementById('directorydelegated').submit();
        }

        function testPrincipalSearch() {
            document.getElementById('directorydelegated').action = "<ww:url namespace="/console/secure/directory" action="testPrincipalSearchDelegated" method="testPrincipalSearch" includeParams="none"/>";

            setDirectoryConnectorReturnTab(3);

            document.getElementById('directorydelegated').submit();
        }

        function setDirectoryConnectorReturnTab(tabNumber) {
            var tabNumberElement = document.createElement("input");
            tabNumberElement.setAttribute("type", "hidden");
            tabNumberElement.setAttribute("name", "tab");
            tabNumberElement.setAttribute("id", "tab");
            tabNumberElement.setAttribute("value", tabNumber);

            document.getElementById('directorydelegated').appendChild(tabNumberElement);
        }

        AJS.$(document).on('tabSelect', '.tabs-menu > li.menu-item > a', function (e, tabData) {
            var helpLinks = [
                '<ww:property value="getText('help.directory.add.delegated.details')"/>',
                '<ww:property value="getText('help.directory.add.delegated.connector')"/>',
                '<ww:property value="getText('help.directory.add.delegated.configuration')"/>',
                '<ww:property value="getText('help.directory.add.delegated.permissions')"/>'
            ];
            setHelpLink(helpLinks[tabData.tab.parent().prevAll().length]);
        });

        function hideShowPagedResultsSize() {
            // Hide the paged results if we are not using AD
            document.getElementById("paged_results_size").style.display = (document.getElementById('directorydelegated').pagedResults.checked ? "block" : "none");
        }
    </script>
</head>
<body>

<h2><ww:text name="directory.delegated.create.title"/></h2>
<ww:set name="formContent">
    <div class="aui-tabs horizontal-tabs">
        <ul class="tabs-menu">
            <li class="menu-item<ww:if test="tab == 1 || tab == null"> active-tab</ww:if>" id="hreftab1">
                <a href="#tab1">
                    <strong><ww:text name="menu.details.label"/></strong>
                </a>
            </li>
            <li class="menu-item<ww:if test="tab == 2"> active-tab</ww:if>" id="hreftab2">
                <a href="#tab2">
                    <strong><ww:text name="menu.connector.label"/></strong>
                </a>
            </li>
            <li class="menu-item<ww:if test="tab == 3"> active-tab</ww:if>" id="hreftab3">
                <a href="#tab3">
                    <strong><ww:text name="menu.configuration.label"/></strong>
                </a>
            </li>
            <li class="menu-item" id="hreftab4">
                <a href="#tab4">
                    <strong><ww:text name="menu.permissions.label"/></strong>
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
                    <ww:text name="directoryinternal.name.description"/>
                </ww:param>
                <ww:param name="required" value="true" />
            </ww:textfield>
            <ww:textfield name="description" size="50">
                <ww:param name="label" value="getText('directoryinternal.description.label')"/>
                <ww:param name="fieldWidth" value="'long'"/>
                <ww:param name="description">
                    <ww:text name="directoryinternal.description.description"/>
                </ww:param>
            </ww:textfield>
            <ww:checkbox name="active" fieldValue="true">
                <ww:param name="label" value="getText('directory.active.label')"/>
                <ww:param name="description">
                    <ww:property value="getText('directory.active.description')"/>
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
                    <ww:text name="directory.connector.description"/>
                </ww:param>
                <ww:param name="required" value="true" />
            </ww:select>
            <ww:textfield name="URL" size="50">
                <ww:param name="label" value="getText('directoryconnector.url.label')"/>
                <ww:param name="description">
                    <ww:text name="directoryconnector.url.description"/>
                </ww:param>
                <ww:param name="required" value="true" />
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
            <div id="importGroupsOptions1">
                <ww:checkbox name="useUserMembershipAttribute" fieldValue="true">
                    <ww:param name="label" value="getText('directoryconnector.useusermembershipattribute.label')"/>
                    <ww:param name="description">
                        <ww:property value="getText('directoryconnector.useusermembershipattribute.description')"/>
                    </ww:param>
                </ww:checkbox>
            </div>
            <div id="user_encryption">
                <ww:select list="userEncryptionMethods" name="userEncryptionMethod" listKey="key" listValue="value">
                    <ww:param name="label" value="getText('directoryconnector.userencryptionmethod.label')"/>
                    <ww:param name="description">
                        <ww:text name="directoryconnector.userencryptionmethod.ldap.description"/>
                    </ww:param>
                </ww:select>
            </div>
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
                    <ww:text name="directoryconnector.password.description"/>
                </ww:param>
            </ww:password>
            <ww:hidden name="savedLdapPassword" value="%{ldapPassword}" />
            <div class="field-group">
                <input id="test-connection" type="button" class="aui-button" value="<ww:text name="directoryconnector.testconnection.label"/>" onClick="testConfiguration();"/>
            </div>
        </div>
        <div class="tabs-pane<ww:if test="tab == 3"> active-pane</ww:if>" id="tab3">
            <ww:component template="form_tab_messages.jsp">
                <ww:param name="tabID" value="3"/>
            </ww:component>
            <h3><ww:text name="directoryconnector.userconfiguration.label"/></h3>
            <div class="formBody">
                <ww:textfield name="userDNaddition" size="35">
                    <ww:param name="label" value="getText('directoryconnector.userdnaddition.label')"/>
                    <ww:param name="description">
                        <ww:text name="directoryconnector.userdnaddition.description"/>
                    </ww:param>
                </ww:textfield>
                <ww:textfield name="userObjectClass" size="35">
                    <ww:param name="label" value="getText('directoryconnector.userobjectclass.label')"/>
                    <ww:param name="description">
                        <ww:text name="directoryconnector.userobjectclass.description"/>
                    </ww:param>
                    <ww:param name="required" value="true" />
                </ww:textfield>
                <ww:textfield name="userObjectFilter" size="35">
                    <ww:param name="label" value="getText('directoryconnector.userobjectfilter.label')"/>
                    <ww:param name="description">
                        <ww:text name="directoryconnector.userobjectfilter.description"/>
                    </ww:param>
                    <ww:param name="required" value="true" />
                </ww:textfield>
                <ww:textfield name="userNameAttr" size="35">
                    <ww:param name="label" value="getText('directoryconnector.usernameattribute.label')"/>
                    <ww:param name="description">
                        <ww:text name="directoryconnector.usernameattribute.description"/>
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
                        <ww:text name="directoryconnector.userfirstnameattribute.description"/>
                    </ww:param>
                    <ww:param name="required" value="true" />
                </ww:textfield>
                <ww:textfield name="userLastnameAttr" size="35">
                    <ww:param name="label" value="getText('directoryconnector.userlastnameattribute.label')"/>
                    <ww:param name="description">
                        <ww:text name="directoryconnector.userlastnameattribute.description"/>
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
                        <ww:text name="directoryconnector.usermailattribute.description"/>
                    </ww:param>
                    <ww:param name="required" value="true" />
                </ww:textfield>
                <ww:textfield name="userGroupMemberAttr" size="35">
                    <ww:param name="label" value="getText('directoryconnector.usermemberofattribute.label')"/>
                    <ww:param name="description">
                        <ww:text name="directoryconnector.usermemberofattribute.description"/>
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

                <div id="importGroupsOptions2">
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
<ww:component template="form.jsp" id="directorydelegated">
    <ww:param name="action"><ww:url namespace="/console/secure/directory" action="createdelegated" method="update" includeParams="none" /></ww:param>
    <ww:param name="content" value="#formContent" />
    <ww:param name="submitLabel" value="getText('continue.label')" />
    <ww:param name="cancelUri"><ww:url namespace="/console/secure/directory" action="browse" includeParams="none" /></ww:param>
    <ww:param name="includeFormMessages" value="false" />
</ww:component>
</body>
</html>
