<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="/struts-tags" prefix="ww" %>
<html>
<head>
    <title>
        <ww:text name="license.title"/>
    </title>
</head>

<body>

<h2><ww:text name="license.title"/></h2>

    <form method="post" action="<ww:url namespace="/console" action="license" method="update" />" class="aui">
        <ww:if test="license.expired">
            <div class="aui-message warning">
                <p class="title"><ww:property value="getText('license.invalid.expired.text')"/></p>
                <span class="aui-icon icon-warning"></span>
            </div>
        </ww:if>
        <ww:elseif test="atResourceLimit">
            <div class="aui-message warning">
                <p class="title"><ww:property value="getText('license.invalid.limitreached.text')"/></p>
                <span class="aui-icon icon-warning"></span>
            </div>
        </ww:elseif>

        <ww:component template="form_messages.jsp"/>

        <ww:if test="sysAdmin">
            <ww:component template="form_row.jsp">
                <ww:param name="label" value="getText('license.organization.label')" />
                <ww:param name="value" value="license.organisation.name" />
            </ww:component>

            <ww:component template="form_row.jsp">
                <ww:param name="label" value="getText('license.type.label')" />
                <ww:param name="value" value="license.description" />
            </ww:component>

            <ww:if test="!license.evaluation">
                <ww:component template="form_row.jsp">
                    <ww:param name="label" value="getText('license.datepurchased.label')" />
                    <ww:param name="value">
                        <ww:date format="EEEE, dd MMM yyyy" name="license.purchaseDate"/>
                    </ww:param>
                    <ww:param name="escapeValue" value="false" />
                </ww:component>
            </ww:if>

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

            <ww:component template="form_row.jsp">
                <ww:param name="label" value="getText('license.supportperiod.label')" />
                <ww:param name="value">
                    <ww:if test="license.evaluation">
                        <ww:text name="license.supportperiod.evaluation.description"/>
                    </ww:if>
                    <ww:else>
                        <ww:text name="license.supportperiod.description"/>
                    </ww:else>
                    &nbsp;<time><ww:date format="EEEE, dd MMM yyyy" name="license.maintenanceExpiryDate"/></time>
                </ww:param>
                <ww:param name="escapeValue" value="false" />
            </ww:component>

            <ww:if test="license.partner">
                <ww:component template="form_row.jsp">
                    <ww:param name="label" value="getText('license.partner.label')" />
                    <ww:param name="value" value="license.partner.name"/>
                </ww:component>
            </ww:if>

            <ww:component template="form_row.jsp">
                <ww:param name="label" value="getText('license.userlimit.label')" />
                <ww:param name="value">
                    <ww:if test="license.unlimitedNumberOfUsers" >
                        <ww:text name="license.unlimited.label"/>
                    </ww:if>
                    <ww:else>
                        <ww:property value="license.maximumNumberOfUsers" />
                    </ww:else>
                </ww:param>
                <ww:param name="escapeValue" value="false" />
            </ww:component>

            <ww:component template="form_row.jsp">
                <ww:param name="label" value="getText('license.userresources.label')" />
                <ww:param name="value" value="currentResources" />
            </ww:component>

            <ww:component template="form_row.jsp">
                <ww:param name="label" value="getText('systeminfo.serverid.label')" />
                <ww:param name="value" value="crowdSid" />
            </ww:component>
        </ww:if>

        <ww:if test="authenticationRequired">
            <ww:textfield name="username" size="30">
                <ww:param name="label" value="getText('username.label')"/>
                <ww:param name="description" value="getText('license.username.description')"/>
            </ww:textfield>

            <ww:password name="password" size="30">
                <ww:param name="label" value="getText('password.label')"/>
            </ww:password>
        </ww:if>

        <ww:textarea name="key" rows="8" cols="60">
            <ww:param name="label">
                <ww:property value="getText('license.key.label')"/>
            </ww:param>
            <ww:param name="fieldWidth" value="'full-width'"/>
            <ww:param name="description">
                <ww:text name="license.key.description.1"/>
                <a href="<ww:url value="http://www.atlassian.com/ex/GenerateLicense.jspa">
                    <ww:param name="product" value="getText('application.name')" />
                    <ww:param name="version" value="@com.atlassian.crowd.util.build.BuildUtils@BUILD_VERSION" />
                    <ww:param name="sid" value="crowdSid" />
                    <ww:param name="ref" value="'prod'" />
                </ww:url>"><ww:text name="license.key.description.2"/></a>
                &nbsp;<ww:text name="license.key.description.3">
                    <ww:param name="0"><a  href="<ww:url value="http://my.atlassian.com/" includeParams="none"/>"></ww:param>
                    <ww:param name="1"></a></ww:param>
                </ww:text>
                <ww:text name="license.update.requires.restart"/>
            </ww:param>
        </ww:textarea>

        <div class="buttons-container">
            <div class="buttons">
                <input type="submit" class="aui-button aui-button-primary" value="<ww:property value="getText('update.label')"/>"/>
            </div>
        </div>
        <ww:hidden name="%{xsrfTokenName}" value="%{xsrfToken}"/>
    </form>

</body>
</html>
