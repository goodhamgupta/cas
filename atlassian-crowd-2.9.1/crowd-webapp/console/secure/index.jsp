<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="/struts-tags" prefix="ww" %>
<html>
<head>
    <title>
        <ww:text name="console.title"/>
    </title>
    <meta name="section" content="home"/>
    <meta name="help" content="<ww:text name="help.home"/>"/>
    <meta name="bodyCssClass" content="aui-page-focused aui-page-focused-large"/>
</head>

<body>

<ww:if test="recoveryModeActive">
    <div class="aui-message warning">
        <p class="title">
            <ww:text name="console.recovery.mode.active"/>
        </p>
        <span class="aui-icon icon-warning"></span>
    </div>
</ww:if>

<ww:if test="mailServerConfigured == false">
    <div class="aui-message warning">
        <p class="title">
            <ww:text name="mailserver.unconfigured.console.message">
            <ww:param name="value0"><a href="<ww:url namespace="/console/secure/admin" action="mailserver" method="default" includeParams="none"/>"></ww:param>
                <ww:param name="value1" value="'</a>'"/>
            </ww:text>
        </p>
        <span class="aui-icon icon-warning"></span>
    </div>
</ww:if>

<h2><ww:text name="console.welcome"/></h2>
<p><ww:text name="console.text.intro"/></p>

<ww:property value="getText('console.text.html')" escape="false"/>

<ww:if test="nearExpiredLicense == true || atResourceLimit == true || licenseExpired == true || license.evaluation == true || license.maintenanceExpired == true">
    <div class="aui-message error">
        <ww:if test="nearExpiredLicense == true">
            <ww:text name="license.maintenance.expires.soon">
                <ww:param name="value0" value="expiryDate"/>
                <ww:param name="value1" value="daysLeft"/>
                <ww:param name="value2" value="'<a href=\"https://www.atlassian.com/software/Buy.jspa?action=renew\">'"/>
                <ww:param name="value3" value="'</a>'"/>
                <ww:param name="value4" value="'<a href=\"http://www.atlassian.com/licensing/purchase-licensing#softwaremaintenance-2\">'"/>
                <ww:param name="value5" value="'</a>'"/>

            </ww:text>
        </ww:if>
        <ww:if test="atResourceLimit == true">
            <ww:text name="license.resource.limit">
                <ww:param name="value0" value="license.maximumNumberOfUsers"/>
                <ww:param name="value1" value="currentLicenseResourceTotal"/>
                <ww:param name="value2" value="'<a href=\"https://www.atlassian.com/software/Buy.jspa?action=renew\">'"/>
                <ww:param name="value3" value="'</a>'"/>
                <ww:param name="value4" value="'<a href=\"http://www.atlassian.com/licensing/purchase-licensing#upgradingdownloadlicenses-1\">'"/>
                <ww:param name="value5" value="'</a>'"/>
            </ww:text>
        </ww:if>
        <ww:if test="licenseExpired == true">
            <ww:text name="license.expired"/>
        </ww:if>
        <ww:if test="license.maintenanceExpired == true">
            <ww:text name="license.maintenance.expired">
                <ww:param name="value0" ><ww:date format="dd MMM yyyy" name="license.maintenanceExpiryDate"/></ww:param>
                <ww:param name="value1" value="'<a href=\"https://www.atlassian.com/software/Buy.jspa?action=renew\">'"/>
                <ww:param name="value2" value="'</a>'"/>
                <ww:param name="value3" value="'<a href=\"http://www.atlassian.com/licensing/purchase-licensing#softwaremaintenance-2\">'"/>
                <ww:param name="value4" value="'</a>'"/>
            </ww:text>
        </ww:if>
        <ww:if test="evaluation == true">
            <ww:text name="license.evaluation.purchase">
                <ww:param name="value0" value="'<a href=\"http://www.atlassian.com/software/crowd/\">'"/>
                <ww:param name="value1" value="'</a>'"/>
            </ww:text>
        </ww:if>
        <span class="aui-icon icon-error"></span>
    </div>
</ww:if>
</body>
</html>
