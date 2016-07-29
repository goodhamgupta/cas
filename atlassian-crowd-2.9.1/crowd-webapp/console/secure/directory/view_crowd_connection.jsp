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
    <meta name="help.url" content="<ww:text name="help.directory.crowd.connection"/>"/>
    <script>
        function testConnection() {
            var form = document.getElementById('crowddetails');
            form.action = "<ww:url namespace="/console/secure/directory" action="testupdateremotecrowdconnection" method="testUpdateConnection" includeParams="none"/>";

            var tabNumberElement = document.createElement("input");
            tabNumberElement.setAttribute("type", "hidden");
            tabNumberElement.setAttribute("name", "tab");
            tabNumberElement.setAttribute("id", "tab");
            tabNumberElement.setAttribute("value", "2");

            form.appendChild(tabNumberElement);

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
    <jsp:include page="inc_tabs_crowd.jsp">
        <jsp:param name="selectedTab" value="2" />
    </jsp:include>
    <div class="tabs-pane active-pane">
        <ww:set name="formContent">
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
            <input type="hidden" name="ID" value="<ww:property value="ID" />"/>
        </ww:set>
        <ww:component template="form.jsp" id="crowddetails">
            <ww:param name="action"><ww:url namespace="/console/secure/directory" action="updateremotecrowdconnection" method="update" includeParams="none" /></ww:param>
            <ww:param name="content" value="#formContent" />
            <ww:param name="cancelUri"><ww:url namespace="/console/secure/directory" action="viewremotecrowd" method="default" includeParams="none" ><ww:param name="ID" value="ID" /></ww:url></ww:param>
        </ww:component>
    </div>
</div>

</body>
</html>
