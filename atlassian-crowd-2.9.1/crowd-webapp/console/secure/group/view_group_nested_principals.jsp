<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="/struts-tags" prefix="ww" %>
<%@ taglib uri="/WEB-INF/crowd.tld" prefix="cwd" %>
<html>
<head>
    <title><ww:property value="getText('menu.viewgroup.label')"/></title>
    <meta name="section" content="groups"/>
    <meta name="pagename" content="viewgroupnestedusers" />
    <meta name="help.url" content="<ww:property value="getText('help.group.view.allusers')"/>"/>
</head>
<body>
<h2><ww:property value="getText('menu.viewgroup.label')"/>&nbsp;&ndash;&nbsp;<ww:property value="groupName"/></h2>

<div class="aui-tabs horizontal-tabs aui-tabs-disabled">
    <ul class="tabs-menu">
        <li class="menu-item">
            <a href="<ww:url action="view" namespace="/console/secure/group" method="default" includeParams="none"><ww:param name="directoryID" value="directoryID"/><ww:param name="name" value="groupName" /> </ww:url>">
                <ww:property value="getText('menu.details.label')"/>
            </a>
        </li>
        <li class="menu-item">
            <a id="view-group-users" href="<ww:url action="viewmembers" namespace="/console/secure/group" includeParams="none" ><ww:param name="directoryID" value="directoryID"/><ww:param name="groupName" value="groupName"/></ww:url>">
                <ww:property value="getText('group.directmembers.label')"/>
            </a>
        </li>
        <li class="menu-item active-tab">
            <a><ww:property value="getText('group.nestedmembers.label')"/></a>
        </li>
    </ul>
    <div class="tabs-pane active-pane">
        <ww:if test="principals.empty">
            <cwd:soy moduleKey="com.atlassian.auiplugin:aui-experimental-soy-templates" template="aui.message.info">
                <ww:param name="content">
                    <ww:text name="viewprincipals.group.noprincipals.assigned">
                        <ww:param><ww:property value="groupName"/></ww:param>
                    </ww:text>
                </ww:param>
            </cwd:soy>
        </ww:if>
        <ww:else>
            <table id="view-group-nested-principals" class="aui">
                <thead>
                    <tr>
                        <th width="30%"><ww:text name="principal.name.label"/></th>
                        <th width="60%"><ww:text name="principal.email.label"/></th>
                        <th width="10%"><ww:text name="principal.active.label"/></th>
                    </tr>
                </thead>
                <ww:iterator value="principals" status="rowstatus">
                    <tr>
                        <td>
                            <a id="view-principal" href="<ww:url namespace="/console/secure/user" action="view" method="default" includeParams="none"><ww:param name="name" value="name" /><ww:param name="directoryID" value="[1].directoryID" /></ww:url>">
                                <ww:property value="name"/>
                            </a>
                        </td>
                        <td><ww:property value="emailAddress"/></td>
                        <td><ww:property value="active"/></td>
                    </tr>
                </ww:iterator>
            </table>
        </ww:else>
    </div>
</div>

</body>
</html>
