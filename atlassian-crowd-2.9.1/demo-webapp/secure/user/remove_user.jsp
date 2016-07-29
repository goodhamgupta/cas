<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="/struts-tags" prefix="ww" %>
<html>
<head>
    <title><ww:property value="getText('menu.removeuser.label')"/></title>
    <meta name="section" content="users"/>
</head>
<body>


<div class="crowdForm">

    <div class="formTitle">
        <h2>
            <ww:property value="getText('menu.removeuser.label')"/>
            &nbsp;&ndash;&nbsp;
            <ww:property value="name"/>
        </h2>
    </div>

    <div class="formBody">
        <ww:include value="/include/generic_errors.jsp"/>

        <div class="fieldArea required">
            <div class="errorBox">
                <ww:property value="getText('user.remove.text')"/>
            </div>
            <label class="fieldLabelArea" for="userName">
                <ww:property value="getText('user.name.label')"/>
            </label>
            <div class="fieldValueArea" id="userName">
                <ww:property value="name"/>
            </div>
        </div>

    </div>
    <div class="formFooter wizardFooter">

        <div class="buttons">

            <form method="post" action="<ww:url namespace="/secure/user" action="removeuser" method="update" includeParams="none" />">

                <input type="hidden" name="name" value="<ww:property value="name" />"/>

                <input type="submit" class="button" value="<ww:property value="getText('continue.label')"/> &raquo;"/>
                <input type="button" class="button" value="<ww:property value="getText('cancel.label')"/>"
                       onClick="window.location='<ww:url namespace="/secure/user" action="viewuser" method="default" includeParams="none"><ww:param name="name" value="name" /></ww:url>';"/>
            </form>

        </div>

    </div>


</div>
</body>
</html>
