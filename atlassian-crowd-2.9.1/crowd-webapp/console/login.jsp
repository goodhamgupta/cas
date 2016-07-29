<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="/struts-tags" prefix="ww" %>
<html>
<head>
    <title><ww:property value="getText('login.title')"/></title>
    <meta name="help.url" content="<ww:property value="getText('help.login')"/>"/>
    <meta name="bodyCssClass" content="aui-page-focused aui-page-focused-medium"/>
    <meta name="decorator" content="atl.general"/>
    <!--[if lte IE 9]><script>
        AJS.$(function () {
            AJS.$('[autofocus]:not(:focus)').eq(0).focus();
        });
    </script><![endif]-->
</head>

<body>

<h1><ww:text name="login.verb"/> <ww:property value="applicationName"/></h1>
<ww:if test="!domainValid">
    <div class="aui-message error">
        <p class="title">
            <ww:text name="invaliddommain.label">
                <ww:param name="0"><ww:property value="applicationName"/></ww:param>
                <ww:param name="1"><a href="<ww:text name="help.prefix"/><ww:text name="help.admin.ssodomain"/>" target="_crowdhelp"></ww:param>
                <ww:param name="2"></a></ww:param>
            </ww:text>
        </p>
        <span class="aui-icon icon-error"></span>
    </div>
</ww:if>
<ww:if test="#request['passwordUpdateSuccessful'] || #parameters['passwordUpdateSuccessful']">
    <div class="aui-message success">
        <p class="title">
            <ww:property value="getText('resetpassword.complete.label')"/>
        </p>
        <span class="aui-icon icon-success"></span>
    </div>
</ww:if>

<ww:set name="formContent">
    <ww:textfield name="j_username">
        <ww:param name="label" value="getText('username.label')"/>
        <ww:param name="autofocus" value="#request['j_username'] == null || #request['j_username'] == ''" />
    </ww:textfield>
    <ww:password name="j_password">
        <ww:param name="label" value="getText('password.label')"/>
        <ww:param name="autofocus" value="#request['j_username'] != null && #request['j_username'] != ''" />
    </ww:password>
</ww:set>
<ww:component template="form.jsp" id="login">
    <!-- The double use of console is necessary to get Webwork 2.2.6 to render the form action url properly. -->
    <ww:param name="action"><ww:url namespace="/console" value="/console/j_security_check"/></ww:param>
    <ww:param name="cancelUri"><ww:if test="showForgotPassword"><ww:url namespace="/console" action="forgottenlogindetails" method="default"/></ww:if></ww:param>
    <ww:param name="submitLabel" value="getText('login.label')" />
    <ww:param name="cancelLabel" value="getText('forgottenlogindetails.link.label')" />
    <ww:param name="cancelId" value="'forgottenlogindetails'" />
    <ww:param name="content" value="#formContent" />
</ww:component>

</body>
</html>
