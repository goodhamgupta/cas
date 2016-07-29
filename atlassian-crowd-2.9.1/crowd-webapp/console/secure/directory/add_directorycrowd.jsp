<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="/struts-tags" prefix="ww" %>
<html>
<head>
    <title><ww:text name="directorycrowdcreate.title"/></title>
    <meta name="section" content="directories"/>
    <meta name="pagename" content="adddirectory"/>
    <meta name="help.url" content="<ww:property value="getText('help.directory.add.crowd.details')"/>"/>
    <script>
        function testConnection() {
            var form = document.getElementById('directorycrowd');
            form.action = "<ww:url namespace="/console/secure/directory" action="testcreateremotecrowd" method="testConnection" includeParams="none"/>";

            var tabNumberElement = document.createElement("input");
            tabNumberElement.setAttribute("type", "hidden");
            tabNumberElement.setAttribute("name", "tab");
            tabNumberElement.setAttribute("id", "tab");
            tabNumberElement.setAttribute("value", "2");

            form.appendChild(tabNumberElement);

            form.submit();
        }

        AJS.$(document).on('tabSelect', '.tabs-menu > li.menu-item > a', function (e, tabData) {
            var helpLinks = [
                '<ww:property value="getText('help.directory.add.crowd.details')"/>',
                '<ww:property value="getText('help.directory.add.crowd.connection')"/>',
                '<ww:property value="getText('help.directory.add.crowd.permissions')"/>'
            ];
            setHelpLink(helpLinks[tabData.tab.parent().prevAll().length]);
        });
    </script>
</head>
<body>

<h2><ww:text name="directorycrowdcreate.title"/></h2>
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
                    <strong><ww:property value="getText('menu.connection.label')"/></strong>
                </a>
            </li>
            <li class="menu-item" id="hreftab3">
                <a href="#tab3">
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
            <ww:checkbox name="useNestedGroups" fieldValue="true">
                <ww:param name="label" value="getText('directoryinternal.nestedgroups.disable.label')"/>
                <ww:param name="description">
                    <ww:property value="getText('directoryinternal.nestedgroups.disable.description')"/>
                </ww:param>
            </ww:checkbox>
        </div>
        <div class="tabs-pane<ww:if test="tab == 2"> active-pane</ww:if>" id="tab2">
            <ww:component template="form_tab_messages.jsp">
                <ww:param name="tabID" value="2"/>
            </ww:component>
            <ww:textfield name="url" size="50">
                <ww:param name="label" value="getText('directorycrowd.url.label')"/>
                <ww:param name="description">
                    <ww:property value="getText('directorycrowd.url.description')"/>
                </ww:param>
                <ww:param name="required" value="true" />
            </ww:textfield>
            <ww:textfield name="applicationName" size="50">
                <ww:param name="label" value="getText('directorycrowd.applicationname.label')"/>
                <ww:param name="description">
                    <ww:property value="getText('directorycrowd.applicationname.description')"/>
                </ww:param>
                <ww:param name="required" value="true" />
            </ww:textfield>
            <ww:password name="applicationPassword" size="50">
                <ww:param name="label" value="getText('directorycrowd.applicationpassword.label')"/>
                <ww:param name="description">
                    <ww:property value="getText('directorycrowd.applicationpassword.description')"/>
                </ww:param>
                <ww:param name="required" value="true" />
            </ww:password>
            <ww:hidden name="savedApplicationPassword" value="%{applicationPassword}" />
            <ww:textfield name="httpTimeout">
                <ww:param name="label" value="getText('directorycrowd.http.timeout.label')"/>
                <ww:param name="type" value="'number'" />
                <ww:param name="fieldWidth" value="'short'"/>
                <ww:param name="description">
                    <ww:property value="getText('directorycrowd.http.timeout.description')"/>
                </ww:param>
            </ww:textfield>
            <ww:textfield name="httpMaxConnections">
                <ww:param name="label" value="getText('directorycrowd.http.maxconnections.label')"/>
                <ww:param name="type" value="'number'" />
                <ww:param name="fieldWidth" value="'short'"/>
                <ww:param name="description">
                    <ww:property value="getText('directorycrowd.http.maxconnections.description')"/>
                </ww:param>
            </ww:textfield>
            <ww:textfield name="httpProxyHost" size="50">
                <ww:param name="label" value="getText('directorycrowd.proxy.host.label')"/>
                <ww:param name="description">
                    <ww:property value="getText('directorycrowd.proxy.host.description')"/>
                </ww:param>
            </ww:textfield>
            <ww:textfield name="httpProxyPort">
                <ww:param name="label" value="getText('directorycrowd.proxy.port.label')"/>
                <ww:param name="description">
                    <ww:property value="getText('directorycrowd.proxy.port.description')"/>
                </ww:param>
            </ww:textfield>
            <ww:textfield name="httpProxyUsername">
                <ww:param name="label" value="getText('directorycrowd.proxy.username.label')"/>
                <ww:param name="description">
                    <ww:property value="getText('directorycrowd.proxy.username.description')"/>
                </ww:param>
            </ww:textfield>
            <ww:password name="httpProxyPassword">
                <ww:param name="label" value="getText('directorycrowd.proxy.password.label')"/>
                <ww:param name="description">
                    <ww:property value="getText('directorycrowd.proxy.password.description')"/>
                </ww:param>
            </ww:password>
            <ww:checkbox name="incrementalSyncEnabled" fieldValue="true">
                <ww:param name="label" value="getText('directorycrowd.incrementalsync.enable.label')"/>
                <ww:param name="description">
                    <ww:property value="getText('directorycrowd.incrementalsync.enable.description')"/>
                </ww:param>
            </ww:checkbox>
            <div id="polling_interval">
                <ww:textfield name="pollingIntervalInMin">
                    <ww:param name="label" value="getText('directorycrowd.polling.interval.label')"/>
                    <ww:param name="type" value="'number'" />
                    <ww:param name="fieldWidth" value="'short'"/>
                    <ww:param name="description">
                        <ww:property value="getText('directorycrowd.polling.interval.description')"/>
                    </ww:param>
                </ww:textfield>
            </div>
            <div class="field-group">
                <input id="test-connection" type="button" class="aui-button" value="<ww:property value="getText('directorycrowd.testconnection.label')"/>" onClick="testConnection();"/>
            </div>
        </div>
        <div class="tabs-pane" id="tab3">
            <ww:component template="form_tab_messages.jsp">
                <ww:param name="tabID" value="3"/>
            </ww:component>
            <ww:component template="permissions.jsp">
                <ww:param name="legend" value="getText('menu.permissions.label')"/>
            </ww:component>
        </div>
    </div>
</ww:set>
<ww:component template="form.jsp" id="directorycrowd">
    <ww:param name="action"><ww:url namespace="/console/secure/directory" action="createremotecrowd" method="update" includeParams="none" /></ww:param>
    <ww:param name="content" value="#formContent" />
    <ww:param name="submitLabel" value="getText('continue.label')" />
    <ww:param name="cancelUri"><ww:url namespace="/console/secure/directory" action="browse" includeParams="none" /></ww:param>
    <ww:param name="includeFormMessages" value="false" />
</ww:component>

</body>
</html>
