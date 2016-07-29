<%@ taglib uri="/struts-tags" prefix="ww" %>
<ul class="tabs-menu">
    <li class="menu-item<% if (Integer.parseInt(request.getParameter("selectedTab")) == 1) { %> active-tab<% } %>">
        <a id="internal-general" href="<ww:url action="viewinternal" namespace="/console/secure/directory" includeParams="none"><ww:param name="ID" value="ID" /></ww:url>"><ww:text name="menu.details.label"/></a>
    </li>
    <li class="menu-item<% if (Integer.parseInt(request.getParameter("selectedTab")) == 2) { %> active-tab<% } %>">
        <a id="internal-configuration" href="<ww:url namespace="/console/secure/directory" action="updateinternalconfiguration" includeParams="none"><ww:param name="ID" value="ID" /></ww:url>"><strong><ww:text name="menu.configuration.label"/></strong></a>
    </li>
    <li class="menu-item<% if (Integer.parseInt(request.getParameter("selectedTab")) == 3) { %> active-tab<% } %>">
        <a id="internal-permissions" href="<ww:url namespace="/console/secure/directory" action="updateinternalpermissions" includeParams="none"><ww:param name="ID" value="ID" /></ww:url>"><strong><ww:text name="menu.permissions.label"/></strong></a>
    </li>
    <li class="menu-item<% if (Integer.parseInt(request.getParameter("selectedTab")) == 4) { %> active-tab<% } %>">
        <a id="internal-options" href="<ww:url namespace="/console/secure/directory" action="updateinternaloptions" includeParams="none"><ww:param name="ID" value="ID" /></ww:url>"><strong><ww:text name="menu.optional.label"/></strong></a>
    </li>
</ul>
