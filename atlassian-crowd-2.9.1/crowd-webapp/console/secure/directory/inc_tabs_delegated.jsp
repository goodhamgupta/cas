<%@ taglib uri="/struts-tags" prefix="ww" %>
<ul class="tabs-menu">
    <li class="menu-item<% if (Integer.parseInt(request.getParameter("selectedTab")) == 1) { %> active-tab<% } %>">
        <a id="delegated-general" href="<ww:url action="viewdelegated" namespace="/console/secure/directory" includeParams="none"><ww:param name="ID" value="ID" /></ww:url>"><ww:text name="menu.details.label"/></a>
    </li>
    <li class="menu-item<% if (Integer.parseInt(request.getParameter("selectedTab")) == 2) { %> active-tab<% } %>">
        <a id="delegated-connectiondetails" href="<ww:url namespace="/console/secure/directory" action="updatedelegatedconnection" includeParams="none"><ww:param name="ID" value="ID" /></ww:url>"><strong><ww:text name="menu.connector.label"/></strong></a>
    </li>
    <li class="menu-item<% if (Integer.parseInt(request.getParameter("selectedTab")) == 3) { %> active-tab<% } %>">
        <a id="delegated-configuration" href="<ww:url namespace="/console/secure/directory" action="updatedelegatedconfiguration" includeParams="none"><ww:param name="ID" value="ID" /></ww:url>"><strong><ww:text name="menu.configuration.label"/></strong></a>
    </li>
    <li class="menu-item<% if (Integer.parseInt(request.getParameter("selectedTab")) == 4) { %> active-tab<% } %>">
        <a id="delegated-permissions" href="<ww:url namespace="/console/secure/directory" action="updatedelegatedpermissions" includeParams="none"><ww:param name="ID" value="ID" /></ww:url>"><strong><ww:text name="menu.permissions.label"/></strong></a>
    </li>
    <li class="menu-item<% if (Integer.parseInt(request.getParameter("selectedTab")) == 5) { %> active-tab<% } %>">
        <a id="delegated-options" href="<ww:url namespace="/console/secure/directory" action="updatedelegatedoptions" includeParams="none"><ww:param name="ID" value="ID" /></ww:url>"><strong><ww:text name="menu.optional.label"/></strong></a>
    </li>
</ul>
