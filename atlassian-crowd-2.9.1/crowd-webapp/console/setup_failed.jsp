<%@ page pageEncoding='utf-8' %>
<%@ taglib uri="/struts-tags" prefix="ww" %>

<html>
    <head>
        <title><ww:text name="setupfailed.title"/></title>
        <meta name="help.url" content="<ww:text name="help.setup.failed"/>"/>
    </head>
    <body>

    <div class="crowdForm">

        <div class="formTitle">
            <h2><ww:text name="setupfailed.title"/></h2>
        </div>

        <div class="formBody">
            <ww:component template="form_messages.jsp"/>

            <ww:text name="setupcomplete.error.text"/>
        </div>

    </div>

    </body>
</html>
