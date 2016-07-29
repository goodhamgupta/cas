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
    <meta name="help.url" content="<ww:property value="getText('help.directory.connector.configuration')"/>"/>
    <script>
        function testGroupSearch() {
            var form = document.getElementById('configuration_details');
            form.action = "<ww:url namespace="/console/secure/directory" action="testUpdateGroupSearch" method="testUpdateGroupSearch" includeParams="none"/>";
            form.submit();
        }

        function testPrincipalSearch() {
            var form = document.getElementById('configuration_details');
            form.action = "<ww:url namespace="/console/secure/directory" action="testUpdatePrincipalSearch" method="testUpdatePrincipalSearch" includeParams="none"/>";
            form.submit();
        }
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
        <jsp:param name="selectedTab" value="3" />
    </jsp:include>
    <div class="tabs-pane active-pane">
        <ww:set name="formContent">
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
            <input type="hidden" name="ID" value="<ww:property value="ID" />"/>
        </ww:set>
        <ww:component template="form.jsp" id="configuration_details">
            <ww:param name="action"><ww:url namespace="/console/secure/directory" action="updateconnectorconfiguration" method="update" includeParams="none" /></ww:param>
            <ww:param name="content" value="#formContent" />
            <ww:param name="cancelUri"><ww:url namespace="/console/secure/directory" action="viewconnector" method="default" includeParams="none" ><ww:param name="ID" value="ID" /></ww:url></ww:param>
        </ww:component>
    </div>
</div>

</body>
</html>
