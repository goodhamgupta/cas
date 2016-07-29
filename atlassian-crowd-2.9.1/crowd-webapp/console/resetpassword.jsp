<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="/struts-tags" prefix="ww" %>
<html>

<head>
    <title><ww:text name="forgottenpassword.title"/></title>

    <meta name="pagename" content="resetpassword"/>
    <meta name="help.url" content="<ww:text name="help.reset.forgotten.password"/>"/>
    <meta name="bodyCssClass" content="aui-page-focused aui-page-focused-medium"/>
</head>

<body>
    <h1><ww:text name="forgottenpassword.title"/></h1>

    <ww:if test="isDisabledUser">
        <div class="aui-message error">
            <p class="title">
                <span class="aui-icon icon-error"></span>
                <ww:text name="forgottenlogindetails.error.userdisabled"/>
            </p>
        </div>
    </ww:if>
        <ww:elseif test="isInvalidToken">
            <p class="warningBox">
                <ww:text name="forgottenlogindetails.error.expiredtoken"/>
                <br/>
                <a href="<ww:url namespace="/console" includeParams="none" action="forgottenlogindetails"/>"><ww:text name="forgottenpassword.getnewtoken"/></a>
            </p>
        </ww:elseif>
        <ww:else>
            <ww:set name="formContent">
                <ww:if test="%{passwordComplexityMessage != null && !hasFieldErrors()}">
                    <div class="aui-message info">
                        <p class="title">
                            <span class="aui-icon icon-info"></span>
                            <ww:text name="principal.password.complexity.policy"/>
                        </p>
                        <p><ww:property value="passwordComplexityMessage"/></p>
                    </div>
                </ww:if>

                <ww:password name="password" size="45" required="true">
                    <ww:param name="value" value="password"/>
                    <ww:param name="label">
                        <ww:property value="getText('newpassword.label')"/>
                    </ww:param>
                </ww:password>

                <ww:password name="confirmPassword" size="45" required="true">
                    <ww:param name="value" value="confirmPassword"/>
                    <ww:param name="label">
                        <ww:property value="getText('confirmpassword.label')"/>
                    </ww:param>
                </ww:password>

                <ww:hidden name="username"/>
                <ww:hidden name="directoryId"/>
                <ww:hidden name="token"/>
            </ww:set>
            <ww:component template="form.jsp" id="general">
                <ww:param name="action"><ww:url namespace="/console" action="resetpassword" method="update"/></ww:param>
                <ww:param name="cancelUri"><ww:url namespace="/console" action="login" includeParams="none"></ww:url></ww:param>
                <ww:param name="submitLabel" value="getText('update.label')" />
                <ww:param name="cancelLabel" value="getText('cancel.label')" />
                <ww:param name="cancelId" value="'forgottenlogindetails'" />
                <ww:param name="content" value="#formContent" />
            </ww:component>
        </ww:else>
</body>
</html>
