<%@ taglib uri="/struts-tags" prefix="ww" %>
<ul class="tabs-menu">
    <li class="menu-item<% if (Integer.parseInt(request.getParameter("selectedTab")) == 1) { %> active-tab<% } %>">
        <a id="crowd-general" href="<ww:url action="viewremotecrowd" namespace="/console/secure/directory" includeParams="none"><ww:param name="ID" value="ID" /></ww:url>"><ww:text name="menu.details.label"/></a>
    </li>
    <li class="menu-item<% if (Integer.parseInt(request.getParameter("selectedTab")) == 2) { %> active-tab<% } %>">
        <a id="crowd-connectiondetails" href="<ww:url namespace="/console/secure/directory" action="updateremotecrowdconnection" includeParams="none"><ww:param name="ID" value="ID" /></ww:url>"><strong><ww:text name="menu.connection.label"/></strong></a>
    </li>
    <li class="menu-item<% if (Integer.parseInt(request.getParameter("selectedTab")) == 3) { %> active-tab<% } %>">
        <a id="crowd-permissions" href="<ww:url namespace="/console/secure/directory" action="updateremotecrowdpermissions" includeParams="none"><ww:param name="ID" value="ID" /></ww:url>"><strong><ww:text name="menu.permissions.label"/></strong></a>
    </li>
    <li class="menu-item<% if (Integer.parseInt(request.getParameter("selectedTab")) == 4) { %> active-tab<% } %>">
        <a id="crowd-options" href="<ww:url namespace="/console/secure/directory" action="updateremotecrowdoptions" includeParams="none"><ww:param name="ID" value="ID" /></ww:url>"><strong><ww:text name="menu.optional.label"/></strong></a>
    </li>
</ul>
