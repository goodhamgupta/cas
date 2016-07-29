<%@ page pageEncoding='utf-8' %>
<%@ taglib uri="/struts-tags" prefix="ww" %>
<html>
<head>
    <title><ww:property value="getText('options.title')"/></title>
    <meta name="section" content="administration" />
    <meta name="pagename" content="licensing" />
    <meta name="help.url" content="<ww:property value="getText('help.admin.licensing')"/>"/>
</head>
<body>
<h2><ww:property value="getText('menu.licensing.label')"/></h2>
<ww:set name="formContent">
    <ww:component template="form_row.jsp">
        <ww:param name="label" value="getText('license.organization.label')" />
        <ww:param name="value" value="license.organisation.name" />
    </ww:component>

    <ww:component template="form_row.jsp">
        <ww:param name="label" value="getText('license.type.label')" />
        <ww:param name="value" value="license.description" />
    </ww:component>

    <ww:component template="form_row.jsp">
        <ww:param name="label" value="getText('license.datepurchased.label')" />
        <ww:param name="value">
            <ww:date format="EEEE, dd MMM yyyy" name="license.purchaseDate"/>
        </ww:param>
        <ww:param name="escapeValue" value="false" />
    </ww:component>

    <ww:component template="form_row.jsp">
        <ww:param name="label" value="getText('license.supportperiod.label')" />
        <ww:param name="value">
            <ww:property value="getText('license.supportperiod.description')"/>&nbsp;<strong><ww:date format="EEEE, dd MMM yyyy" name="licenseExpiryDate"/></strong>
        </ww:param>
        <ww:param name="escapeValue" value="false" />
    </ww:component>

    <ww:component template="form_row.jsp">
        <ww:param name="label" value="getText('license.sen.label')" />
        <ww:param name="value">
            <ww:if test="license.supportEntitlementNumber != null">
                <ww:property value="license.supportEntitlementNumber" />
            </ww:if>
            <ww:else>
                <ww:text name="license.sen.label.missing"/>
            </ww:else>
        </ww:param>
        <ww:param name="escapeValue" value="false" />
    </ww:component>

    <ww:if test="license.partner" >
        <ww:component template="form_row.jsp">
            <ww:param name="label" value="getText('license.partner.label')" />
            <ww:param name="value" value="license.partner.name"/>
        </ww:component>
    </ww:if>

    <ww:component template="form_row.jsp">
        <ww:param name="label" value="getText('license.userlimit.label')" />
        <ww:param name="value">
            <ww:if test="license.unlimitedNumberOfUsers" >
                <ww:property value="getText('license.unlimited.label')"/>
            </ww:if>
            <ww:else>
                <ww:property value="license.maximumNumberOfUsers" />
            </ww:else>
        </ww:param>
        <ww:param name="escapeValue" value="false" />
    </ww:component>

    <ww:component template="form_row.jsp">
        <ww:param name="label" value="getText('license.userresources.label')" />
        <ww:param name="value">
            <span id="license-count"><ww:property value="currentResources" /></span>
        </ww:param>
        <ww:param name="escapeValue" value="false" />
        <ww:param name="description">
            <ww:text name="license.recalculate.total">
                <ww:param name="0"><a id="license-recalculate-total" href="<ww:url namespace="/console/secure/admin" action="licensing" method="recalculateUserLimit" includeParams="none"></ww:url>"></ww:param>
                <ww:param name="1"></a></ww:param>
            </ww:text>
        </ww:param>
        <ww:param name="escapeDescription" value="false" />
    </ww:component>

    <ww:component template="form_row.jsp">
        <ww:param name="label" value="getText('systeminfo.serverid.label')" />
        <ww:param name="value" value="serverId" />
    </ww:component>

    <ww:textarea name="key" rows="8" cols="60">
        <ww:param name="label" value="getText('license.key.label')" />
        <ww:param name="description">
            <ww:text name="license.key.description.1"/>
            <a href="<ww:url value="http://www.atlassian.com/ex/GenerateLicense.jspa" includeParams="none">
                                            <ww:param name="product" value="getText('application.name')" />
                                            <ww:param name="version" value="@com.atlassian.crowd.util.build.BuildUtils@BUILD_VERSION" />
                                            <ww:param name="sid" value="serverId" />
                                            <ww:param name="ref" value="'prod'" />
                                            </ww:url>">
                <ww:text name="license.key.description.2"/></a>
                &nbsp;<ww:text name="license.key.description.3">
                <ww:param name="0"><a  href="<ww:url value="http://my.atlassian.com/" includeParams="none"/>"></ww:param>
                <ww:param name="1"></a></ww:param>
            </ww:text>
        </ww:param>
        <ww:param name="escapeDescription" value="false" />
        <ww:param name="fieldWidth" value="'long'" />
    </ww:textarea>
</ww:set>
<ww:component template="form.jsp" id="licensing">
    <ww:param name="action"><ww:url namespace="/console/secure/admin" action="licensing" method="update" includeParams="none"/></ww:param>
    <ww:param name="cancelUri"><ww:url namespace="/console/secure/admin" action="licensing" method="default" includeParams="none"/></ww:param>
    <ww:param name="content" value="#formContent" />
</ww:component>
</body>
</html>
