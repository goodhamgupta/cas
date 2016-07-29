<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="/struts-tags" prefix="ww" %>
<html>
<head>
    <title><ww:text name="menu.trustedproxies.label"/></title>
    <meta name="section" content="administration"/>
    <meta name="pagename" content="trustedproxies"/>
    <meta name="help.url" content="<ww:text name="help.admin.trusted_proxies"/>"/>
</head>
<body>

<h2><ww:property value="getText('menu.trustedproxies.label')"/></h2>

<form name="trustedProxyServers" method="post" action="<ww:url namespace="/console/secure/admin" action="updatetrustedproxies" method="addAddress" includeParams="none" />" class="aui">
    <ww:component template="form_messages.jsp"/>

    <table id="addressesTable" class="aui">
        <thead>
            <tr>
                <th width="64%"><ww:property value="getText('browser.address.label')"/></th>
                <th width="18%"><ww:property value="getText('browser.action.label')"/></th>
            </tr>
        </thead>
        <tfoot>
            <tr>
                <td>
                    <ww:textfield name="address">
                        <ww:param name="inline" value="true"/>
                        <ww:param name="fieldWidth" value="'full-width'"/>
                        <ww:param name="placeholder" value="getText('browser.address.label')"/>
                    </ww:textfield>
                </td>
                <td>
                    <input type="submit" class="aui-button aui-button-primary" value="<ww:property value="getText('add.label')"/>" /><%-- empty comment removes erroneous whitespace between elements
                    --%><a href="<ww:url namespace="/console/secure/admin" action="viewtrustedproxies" method="default" includeParams="none" />" class="aui-button aui-button-link"><ww:property value="getText('cancel.label')"/></a>
                </td>
            </tr>
        </tfoot>
        <ww:iterator value="addresses" status="rowstatus">
            <tr>
                <td><ww:property/></td>
                <td>
                    <a href="<ww:url namespace="/console/secure/admin" action="updatetrustedproxies" method="removeAddress" includeParams="none"><ww:param name="address"><ww:property/></ww:param><ww:param name="%{xsrfTokenName}" value="%{xsrfToken}"/></ww:url>">
                        <ww:property value="getText('remove.label')"/>
                    </a>
                </td>
            </tr>
        </ww:iterator>
    </table>
    <ww:hidden name="%{xsrfTokenName}" value="%{xsrfToken}"/>
</form>
</body>
</html>
