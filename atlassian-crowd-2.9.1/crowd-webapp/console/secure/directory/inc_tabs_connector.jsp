<%@ taglib uri="/struts-tags" prefix="ww" %>
<ul class="tabs-menu">
    <li class="menu-item<% if (Integer.parseInt(request.getParameter("selectedTab")) == 1) { %> active-tab<% } %>">
        <a id="connector-general" href="<ww:url action="viewconnector" namespace="/console/secure/directory" includeParams="none"><ww:param name="ID" value="ID" /></ww:url>"><ww:text name="menu.details.label"/></a>
    </li>
    <li class="menu-item<% if (Integer.parseInt(request.getParameter("selectedTab")) == 2) { %> active-tab<% } %>">
        <a id="connector-connectiondetails" href="<ww:url namespace="/console/secure/directory" action="updateconnectorconnection" includeParams="none"><ww:param name="ID" value="ID" /></ww:url>"><strong><ww:text name="menu.connector.label"/></strong></a>
    </li>
    <li class="menu-item<% if (Integer.parseInt(request.getParameter("selectedTab")) == 3) { %> active-tab<% } %>">
        <a id="connector-configuration" href="<ww:url namespace="/console/secure/directory" action="updateconnectorconfiguration" includeParams="none"><ww:param name="ID" value="ID" /></ww:url>"><strong><ww:text name="menu.configuration.label"/></strong></a>
    </li>
    <li class="menu-item<% if (Integer.parseInt(request.getParameter("selectedTab")) == 4) { %> active-tab<% } %>">
        <a id="connector-permissions" href="<ww:url namespace="/console/secure/directory" action="updateconnectorpermissions" includeParams="none"><ww:param name="ID" value="ID" /></ww:url>"><strong><ww:text name="menu.permissions.label"/></strong></a>
    </li>
    <li class="menu-item<% if (Integer.parseInt(request.getParameter("selectedTab")) == 5) { %> active-tab<% } %>">
        <a id="connector-options" href="<ww:url namespace="/console/secure/directory" action="updateconnectoroptions" includeParams="none"><ww:param name="ID" value="ID" /></ww:url>"><strong><ww:text name="menu.optional.label"/></strong></a>
    </li>
</ul>
