<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="/struts-tags" prefix="ww" %>
<html>
<head>
    <title>
        <ww:text name="menu.viewapplication.label"/>
    </title>
    <meta name="section" content="applications"/>
    <meta name="pagename" content="view"/>
    <meta name="help.url" content="<ww:text name="help.application.view.remoteaddr"/>"/>
</head>
<body>

<h2 id="application-name">
    <img class="application-icon" title="<ww:property value="getImageTitle(application.active, application.type)"/>" alt="<ww:property value="getImageTitle(application.active, application.type)"/>" src="<ww:property value="getImageLocation(application.active, application.type)" />"/>
    <ww:property value="application.name"/>
</h2>

<div class="aui-tabs horizontal-tabs aui-tabs-disabled">

    <ww:component template="application_tab_headers.jsp">
        <ww:param name="pagekey" value="'application-remoteaddress'"/>
    </ww:component>

    <div class="tabs-pane active-pane" id="tab6">
        <ww:set name="formContent">
            <p><ww:property value="getText('application.addressmappings.text')"/></p>
            <table id="addressesTable" class="aui">
                <thead>
                    <tr>
                        <th width="82%"><ww:property value="getText('browser.address.label')"/></th>
                        <th width="18%"><ww:property value="getText('browser.action.label')"/></th>
                    </tr>
                </thead>
                <tfoot>
                    <tr>
                        <td colspan="2">
                            <ww:textfield name="address">
                                <ww:param name="inline" value="true" />
                                <ww:param name="fieldWidth" value="'long'" />
                            </ww:textfield>
                            <input id="add-address" type="submit" class="aui-button aui-button-primary" value="<ww:property value="getText('add.label')"/>" />
                        </td>
                    </tr>
                </tfoot>
                <ww:iterator value="application.remoteAddresses" status="rowstatus">
                    <tr>
                        <td><ww:property value="address"/></td>
                        <td>
                            <a href="<ww:url namespace="/console/secure/application" action="updateaddresses" method="removeAddress" includeParams="none"><ww:param name="ID" value="ID" /><ww:param name="address" value="address" /><ww:param name="tab" value="5" /><ww:param name="%{xsrfTokenName}" value="%{xsrfToken}" /></ww:url>">
                                <ww:property value="getText('remove.label')"/>
                            </a>
                        </td>
                    </tr>
                </ww:iterator>
            </table>
            <input type="hidden" name="ID" value="<ww:property value="ID" />"/>
            <input type="hidden" name="tab" value="5"/>
        </ww:set>
        <ww:component template="form.jsp" id="addressForm">
            <ww:param name="action"><ww:url namespace="/console/secure/application" action="updateaddresses" method="addAddress" includeParams="none" /></ww:param>
            <ww:param name="content" value="#formContent" />
            <ww:param name="includeSubmitButton" value="false"/>
        </ww:component>
    </div>
</div>
</body>
</html>
