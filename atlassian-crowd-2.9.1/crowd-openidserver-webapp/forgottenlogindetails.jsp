<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="/struts-tags" prefix="ww" %>
<html>
<head>
    <title>
        <ww:property value="getText('forgottenlogindetails.title')"/>
    </title>

    <script>
        var CROWD_FLD = (function () {
            var CrowdFLDConfig = (function () {
                return {
                    PASSWORD_CONTENT_ID: "forgot-password-info",
                    USERNAME_CONTENT_ID: "forgot-username-info",
                    PASSWORD_RADIO_ID: "radioPasswordOption",
                    USERNAME_RADIO_ID: "radioUsernameOption",
                    SUBMIT_BUTTON_ID: "submit-btn"
                };
            })();

            function hideAndDisplayDiv(hiddenDiv, displayedDiv) {
                document.getElementById(displayedDiv).style.display = 'block';
                document.getElementById(hiddenDiv).style.display = 'none';
            }

            function doForgotPassword() {
                var radioButton = document.getElementById(CrowdFLDConfig.PASSWORD_RADIO_ID);
                if (!radioButton.checked) {
                    radioButton.checked = true;
                }
                hideAndDisplayDiv(CrowdFLDConfig.USERNAME_CONTENT_ID, CrowdFLDConfig.PASSWORD_CONTENT_ID);
                document.getElementById(CrowdFLDConfig.SUBMIT_BUTTON_ID).style.display = 'block';
            }

            function doForgotUsername() {
                var radioButton = document.getElementById(CrowdFLDConfig.USERNAME_RADIO_ID);
                if (!radioButton.checked) {
                    radioButton.checked = true;
                }
                hideAndDisplayDiv(CrowdFLDConfig.PASSWORD_CONTENT_ID, CrowdFLDConfig.USERNAME_CONTENT_ID);
                document.getElementById(CrowdFLDConfig.SUBMIT_BUTTON_ID).style.display = 'block';
            }

            return {
                doForgotPassword: function () {
                    doForgotPassword();
                },

                doForgotUsername: function () {
                    doForgotUsername();
                },

                initialise: function () {
                    if (document.getElementById(CrowdFLDConfig.USERNAME_RADIO_ID).checked) {
                        doForgotUsername();
                    }
                    else if (document.getElementById(CrowdFLDConfig.PASSWORD_RADIO_ID).checked) {
                        doForgotPassword();
                    }
                    else
                    {
                        document.getElementById(CrowdFLDConfig.USERNAME_CONTENT_ID).style.display = 'none';
                        document.getElementById(CrowdFLDConfig.PASSWORD_CONTENT_ID).style.display = 'none';
                        document.getElementById(CrowdFLDConfig.SUBMIT_BUTTON_ID).style.display = 'none';
                    }
                }
            };
        })();
    </script>
</head>

<body onload="CROWD_FLD.initialise()">

<form method="post" action="<ww:url namespace="/" action="forgottenlogindetails" method="update" />"
      name="forgottenlogindetails">

    <ww:hidden name="%{xsrfTokenName}" value="%{xsrfToken}"/>

    <div class="crowdForm">

        <h2>
            <ww:text name="forgottenlogindetails.title" />
        </h2>

        <div class="formBodyNoTop">

            <ww:include value="/include/generic_errors.jsp"/>

            <div class="fieldArea">

                <label for="forgottenDetailSelection" class="fieldLabelArea"><ww:text name="forgottenlogindetails.fieldset.legend.which" /></label>
                <div id="forgottenDetailSelection" class="fieldValueArea">
                    <div class="radio">
                        <input type="radio" id="radioPasswordOption" name="forgottenDetail" value="password" onclick="CROWD_FLD.doForgotPassword()" <ww:if test="forgottenDetail == 'password'">checked="checked"</ww:if> /><label for="radioPasswordOption"><ww:text name="forgottenlogindetails.option.password"/></label>
                    </div>
                    <div class="radio">
                        <input type="radio" id="radioUsernameOption" name="forgottenDetail" value="username" onclick="CROWD_FLD.doForgotUsername()" <ww:if test="forgottenDetail == 'username'">checked="checked"</ww:if> /><label for="radioUsernameOption"><ww:text name="forgottenlogindetails.option.username"/></label>
                    </div>
                </div>

            </div>

            <div id="forgot-password-info">
                <div class="instruction">
                    <ww:text name="forgottenpassword.desc.line1"/><br/>
                    <ww:text name="forgottenpassword.desc.line2"/>
                </div>
                <ww:textfield name="username" size="30">
                    <ww:param name="label" value="getText('username.label')"/>
                    <ww:param name="required" value="true"/>
                    <ww:param name="description" value="getText('forgottenpassword.username.description')"/>
                </ww:textfield>
            </div>

            <div id="forgot-username-info">
                <div class="instruction">
                    <ww:text name="forgottenusername.desc.line1"/>
                </div>
                <ww:textfield name="email" size="30">
                    <ww:param name="label" value="getText('forgottenusername.email.label')"/>
                    <ww:param name="required" value="true"/>
                    <ww:param name="description" value="getText('forgottenusername.email.description')"/>
                </ww:textfield>
            </div>

        </div>
        <div class="formFooter wizardFooter">
            <div class="buttons">
                <input id="submit-btn" type="submit" name="save"
                       value="<ww:property value="getText('continue.label')"/>"/>
            </div>
        </div>

    </div>

</form>

</body>
</html>
