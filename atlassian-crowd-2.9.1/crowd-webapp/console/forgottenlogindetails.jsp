<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="/struts-tags" prefix="ww" %>
<html>
<head>
    <title><ww:property value="getText('forgottenlogindetails.title')"/></title>
    <meta name="help.url" content="<ww:text name="help.reset.forgotten.password"/>"/>
    <meta name="bodyCssClass" content="aui-page-focused aui-page-focused-medium"/>
    <script>
        var CROWD_FLD = (function ($) {
            var CrowdFLDConfig = (function () {
                return {
                    PASSWORD_CONTENT_ID: "#forgot-password-info",
                    USERNAME_CONTENT_ID: "#forgot-username-info",
                    PASSWORD_RADIO_ID: "input[name='forgottenDetail'][value='password']",
                    USERNAME_RADIO_ID: "input[name='forgottenDetail'][value='username']",
                    SUBMIT_BUTTON_ID: "#forgottenlogindetails .buttons-container"
                };
            })();

            function hideAndDisplayDiv(hiddenDiv, displayedDiv) {
                $(displayedDiv).show();
                $(hiddenDiv).hide();
            }

            function doForgotPassword() {
                var radioButton = $(CrowdFLDConfig.PASSWORD_RADIO_ID);
                if (!radioButton.is(':checked')) {
                    radioButton.attr('checked', true);
                }
                hideAndDisplayDiv(CrowdFLDConfig.USERNAME_CONTENT_ID, CrowdFLDConfig.PASSWORD_CONTENT_ID);
                $(CrowdFLDConfig.SUBMIT_BUTTON_ID).show();
            }

            function doForgotUsername() {
                var radioButton = $(CrowdFLDConfig.USERNAME_RADIO_ID);
                if (!radioButton.is(':checked')) {
                    radioButton.attr('checked', true);
                }
                hideAndDisplayDiv(CrowdFLDConfig.PASSWORD_CONTENT_ID, CrowdFLDConfig.USERNAME_CONTENT_ID);
                $(CrowdFLDConfig.SUBMIT_BUTTON_ID).show();
            }

            return {
                doForgotPassword: doForgotPassword,
                doForgotUsername: doForgotUsername,
                initialise: function () {
                    if ($(CrowdFLDConfig.USERNAME_RADIO_ID).is(':checked')) {
                        doForgotUsername();
                    } else if ($(CrowdFLDConfig.PASSWORD_RADIO_ID).is(':checked')) {
                        doForgotPassword();
                    } else {
                        $(CrowdFLDConfig.USERNAME_CONTENT_ID).hide();
                        $(CrowdFLDConfig.PASSWORD_CONTENT_ID).hide();
                        $(CrowdFLDConfig.SUBMIT_BUTTON_ID).hide();
                    }

                    $(CrowdFLDConfig.USERNAME_RADIO_ID).click(doForgotUsername);
                    $(CrowdFLDConfig.PASSWORD_RADIO_ID).click(doForgotPassword);
                }
            };
        })(AJS.$);

        AJS.$(function() {
            CROWD_FLD.initialise();
        });
    </script>
</head>

<body>

<h1><ww:text name="forgottenlogindetails.title" /></h1>
<ww:set name="formContent">
    <ww:radio list="forgottenDetailOption" name="forgottenDetail" listKey="key" listValue="value">
        <ww:param name="legend" value="getText('forgottenlogindetails.fieldset.legend.which')" />
    </ww:radio>
    <div id="forgot-password-info">
        <p><ww:text name="forgottenpassword.desc.line1"/><br/><ww:text name="forgottenpassword.desc.line2"/></p>
        <ww:textfield name="username" size="30">
            <ww:param name="label" value="getText('username.label')"/>
            <ww:param name="description" value="getText('forgottenpassword.username.description')"/>
        </ww:textfield>
    </div>
    <div id="forgot-username-info">
        <p><ww:text name="forgottenusername.desc.line1"/></p>
        <ww:textfield name="email" size="30">
            <ww:param name="type" value="'email'"/>
            <ww:param name="label" value="getText('principal.email.label')"/>
            <ww:param name="description" value="getText('forgottenusername.email.description')"/>
        </ww:textfield>
    </div>
</ww:set>
<ww:component template="form.jsp" id="forgottenlogindetails">
    <ww:param name="action"><ww:url namespace="/console" action="forgottenlogindetails" method="update" /></ww:param>
    <ww:param name="submitLabel" value="getText('continue.label')" />
    <ww:param name="isTopLabels" value="true" />
    <ww:param name="content" value="#formContent" />
</ww:component>

</body>
</html>
