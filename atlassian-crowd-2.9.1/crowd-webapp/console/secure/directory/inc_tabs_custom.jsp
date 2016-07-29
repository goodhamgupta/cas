<%@ taglib uri="/struts-tags" prefix="ww" %>
<ul class="tabs-menu">
    <li class="menu-item<% if (Integer.parseInt(request.getParameter("selectedTab")) == 1) { %> active-tab<% } %>">
        <a id="custom-general" href="<ww:url namespace="/console/secure/directory" action="viewcustom" includeParams="none"><ww:param name="ID" value="ID" /></ww:url>"><ww:text name="menu.details.label"/></a>
    </li>
    <li class="menu-item<% if (Integer.parseInt(request.getParameter("selectedTab")) == 2) { %> active-tab<% } %>">
        <a id="custom-attributes" href="<ww:url namespace="/console/secure/directory" action="updatecustomattributes" includeParams="none"><ww:param name="ID" value="ID" /></ww:url>"><strong><ww:text name="menu.attributes.label"/></strong></a>
    </li>
    <li class="menu-item<% if (Integer.parseInt(request.getParameter("selectedTab")) == 3) { %> active-tab<% } %>">
        <a id="custom-permissions" href="<ww:url namespace="/console/secure/directory" action="updatecustompermissions" includeParams="none"><ww:param name="ID" value="ID" /></ww:url>"><strong><ww:text name="menu.permissions.label"/></strong></a>
    </li>
</ul>
