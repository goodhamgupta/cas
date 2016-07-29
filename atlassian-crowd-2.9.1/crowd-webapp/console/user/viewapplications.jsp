<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="/struts-tags" prefix="ww" %>
<html>
<head>
    <title><ww:text name="menu.user.console.viewapplications.label"/></title>
    <meta name="section" content="user.console"/>
    <meta name="pagename" content="viewapplications"/>
    <meta name="help.url" content="<ww:text name="help.user.console.viewapplications"/>"/>
</head>
<body>
<h2><ww:text name="menu.user.console.viewapplications.label"/></h2>
<ww:component template="form_messages.jsp"/>
<ww:if test="applications.empty">
    <p><ww:text name="user.console.noapplications.text"/></p>
</ww:if>
<ww:else>
    <p><ww:text name="user.console.applications.text"/></p>
    <table class="aui" id="applicationsTable">
        <thead>
            <tr>
                <th><ww:text name="user.console.application.header"/></th>
                <th><ww:text name="user.console.description.header"/></th>
                <th><ww:text name="principal.alias.label"/></th>
            </tr>
        </thead>
        <ww:iterator value="applications" status="rowstatus">
            <tr>
                <td width="30%"><ww:property value="name"/></td>
                <td width="45%"><ww:property value="description"/></td>
                <td width="25%">
                    <ww:if test="aliasingEnabled && !''.equals(aliases.get(#rowstatus.index))">
                        <ww:property value="aliases.get(#rowstatus.index)"/>
                    </ww:if>
                    <ww:else>
                        <em style="color: gray;"><ww:text name="alias.none.label"/></em>
                    </ww:else>
                </td>
            </tr>
        </ww:iterator>
    </table>
</ww:else>
</body>
</html>
