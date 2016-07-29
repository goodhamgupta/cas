<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="/struts-tags" prefix="ww" %>
<html>

<head>
    <title><ww:text name="menu.user.console.changepassword.label"/></title>

    <meta name="pagename" content="changepassword"/>
    <meta name="help.url" content="<ww:text name="help.user.console.changepassword"/>"/>
    <meta name="bodyCssClass" content="aui-page-focused aui-page-focused-medium"/>
</head>

<body>

<h1><ww:text name="menu.user.console.changepassword.label"/></h1>

<ww:set name="formContent">
    <ww:textfield name="username" size="45" disabled="true" required="true">
        <ww:param name="value" value="username">
            <ww:property value="username"/>
        </ww:param>
        <ww:param name="label">
            <ww:property value="getText('username.label')"/>
        </ww:param>
    </ww:textfield>

    <ww:password name="originalPassword" size="45" required="true">
        <ww:param name="value" value="originalPassword"/>
        <ww:param name="label">
            <ww:property value="getText('originalpassword.label')"/>
        </ww:param>
    </ww:password>

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
</ww:set>
<ww:component template="form.jsp" id="general">
    <ww:param name="action"><ww:url namespace="/console" action="changeexpiredpassword" method="update" includeParams="none"/></ww:param>
    <ww:param name="cancelUri"><ww:url namespace="/console" action="login" includeParams="none"></ww:url></ww:param>
    <ww:param name="submitLabel" value="getText('update.label')" />
    <ww:param name="cancelLabel" value="getText('cancel.label')" />
    <ww:param name="cancelId" value="'forgottenlogindetails'" />
    <ww:param name="content" value="#formContent" />
</ww:component>

</body>
</html>
