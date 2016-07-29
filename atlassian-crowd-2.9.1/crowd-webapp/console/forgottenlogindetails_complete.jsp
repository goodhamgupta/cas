<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="/struts-tags" prefix="ww" %>
<html>
<head>
    <title>
        <ww:if test="forgottenDetail == 'USERNAME'">
            <ww:property value="getText('forgottenusername.title')"/>
        </ww:if>
        <ww:else>
            <ww:property value="getText('forgottenpassword.title')"/>
        </ww:else>
    </title>
    <meta name="help.url" content="<ww:text name="help.reset.forgotten.password"/>"/>
    <meta name="bodyCssClass" content="aui-page-focused aui-page-focused-medium"/>
</head>

<body>

<h1>
    <ww:if test="forgottenDetail == 'username'">
        <ww:property value="getText('forgottenusername.title')"/>
    </ww:if>
    <ww:else>
        <ww:property value="getText('forgottenpassword.title')"/>
    </ww:else>
</h1>

<ww:component template="form_messages.jsp"/>

<p>
    <ww:if test="forgottenDetail == 'username'">
        <ww:property value="getText('forgottenusername.complete.label')"/>
    </ww:if>
    <ww:else>
        <ww:property value="getText('forgottenpassword.complete.label')"/>
    </ww:else>
</p>

</body>
</html>
