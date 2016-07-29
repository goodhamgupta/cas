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
</head>

<body>

<div class="crowdForm">

    <h2>
        <ww:if test="forgottenDetail == 'username'">
            <ww:property value="getText('forgottenusername.title')"/>
        </ww:if>
        <ww:else>
            <ww:property value="getText('forgottenpassword.title')"/>
        </ww:else>
    </h2>

    <div class="formBodyNoTop">

        <ww:include value="/include/generic_errors.jsp"/>

        <ww:if test="forgottenDetail == 'username'">
            <ww:property value="getText('forgottenusername.complete.label')"/>
        </ww:if>
        <ww:else>
            <ww:property value="getText('forgottenpassword.complete.label')"/>
        </ww:else>

    </div>

</div>

</body>
</html>
