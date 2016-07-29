<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="/struts-tags" prefix="ww" %>
<html>
<head>
    <title><ww:text name="menu.user.console.changepassword.label"/></title>
    <meta name="section" content="user.console"/>
    <meta name="pagename" content="changepassword"/>
    <meta name="help.url" content="<ww:text name="help.user.console.changepassword"/>"/>
</head>
<body>
<h2><ww:text name="menu.user.console.changepassword.label"/></h2>
<ww:set name="formContent">
    <ww:password name="originalPassword">
        <ww:param name="value" value="originalPassword"/>
        <ww:param name="label" value="getText('originalpassword.label')"/>
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
    <ww:password name="password">
        <ww:param name="value" value="password"/>
        <ww:param name="label" value="getText('newpassword.label')"/>
    </ww:password>
    <ww:password name="confirmPassword">
        <ww:param name="value" value="confirmPassword"/>
        <ww:param name="label" value="getText('confirmpassword.label')"/>
    </ww:password>
</ww:set>
<ww:component template="form.jsp" id="changepassword">
    <ww:param name="action"><ww:url namespace="/console/user" action="changepassword" includeParams="none"/></ww:param>
    <ww:param name="cancelUri"><ww:url namespace="/console/user" action="viewchangepassword" includeParams="none"/></ww:param>
    <ww:param name="content" value="#formContent" />
</ww:component>
</body>
</html>
