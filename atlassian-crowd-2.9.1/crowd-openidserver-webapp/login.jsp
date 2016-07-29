<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="/struts-tags" prefix="ww" %>
<html>
    <head>
        <title><ww:property value="getText('login.title')"/></title>
    </head>

    <body>

    <form method="post" action="<ww:url namespace="/" action="login" includeParams="none" method="update" />" name="login">

        <ww:hidden name="%{xsrfTokenName}" value="%{xsrfToken}"/>
        <ww:hidden name="returnToUrl" value="%{returnToUrl}"/>

        <div class="crowdForm">

            <h2><ww:property value="getText('login.title')"/></h2>

            <div class="formBodyNoTop">

                <ww:include value="/include/generic_errors.jsp"/>

                <ww:textfield name="username" size="30">
                    <ww:param name="label" value="getText('username.label')"/>
                    <ww:param name="required" value="true"/>
                </ww:textfield>

                <ww:password name="password" size="30">
                    <ww:param name="label" value="getText('password.label')"/>
                    <ww:param name="required" value="true"/>
                </ww:password>

            </div>

            <div class="fieldArea">
                <div class="secondColumn">
                    <a id="forgottenlogindetails" href="<ww:url namespace="/" action="forgottenlogindetails" method="default"/>"><ww:text name="forgottenlogindetails.link.label" /></a>
                </div>
            </div>

            <div class="formFooter wizardFooter">
                <div class="buttons">
                    <input type="submit" class="button" value="<ww:property value="getText('login.label')"/> &raquo;"/>
                </div>
            </div>

        </div>

    </form>

    </body>
</html>
