<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="/struts-tags" prefix="ww" %>
<html>

<ww:i18n name="com.atlassian.crowd.console.action.BaseAction">
<head>
    <title><ww:text name="accessdenied.title"/></title>
    <meta name="bodyCssClass" content="aui-page-focused"/>
</head>

<body>
    <h2>
        <ww:text name="accessdenied.title"/>
    </h2>

    <div class="page-content">

        <p>
            <ww:text name="accessdenied.text"/>
        </p>

    </div>
</body>
</ww:i18n>
</html>
