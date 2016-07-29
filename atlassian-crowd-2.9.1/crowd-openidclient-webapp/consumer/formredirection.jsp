<%@ page pageEncoding='utf-8' %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.Iterator" %>
<%@ taglib uri="/struts-tags" prefix="ww" %>
<!DOCTYPE html>
<html>
<head>
    <title>OpenID HTML Form Redirection</title>
</head>

<%
    // REQUIRES: String destinationUrl and Map parameterMap to be in request scope
%>

<body onload="document.forms['openid-form-redirection'].submit();">
    <form name="openid-form-redirection" action="<ww:property value="#request['destinationUrl']" />" method="post" accept-charset="utf-8">

        <ww:iterator value="#request['parameterMap'].entrySet()">
                <input type="hidden" name="<ww:property value="key" />" value="<ww:property value="value" />"/>
        </ww:iterator>

        <button type="submit">Continue...</button>

    </form>
</body>
</html>
