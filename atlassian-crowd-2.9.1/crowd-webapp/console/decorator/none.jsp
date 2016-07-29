<%@ page pageEncoding='utf-8' %>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator" %>
<%@ taglib uri="/struts-tags" prefix="ww" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <decorator:usePage id="sitemeshPage"/>
</head>

<body onload="<decorator:getProperty property="body.onload"/>">
    <decorator:body/>
</body>

</html>
