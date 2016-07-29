<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="/struts-tags" prefix="ww" %>
<script>
    var totalTabs = '<%= request.getParameter("totalTabs") %>';
    var tab = '<ww:property value="tab" />';

    function init() {
        processTabs(tab);
    }

    function flickTab(tab, on) {
        var tabLinkElt = document.getElementById('hreftab' + tab);
        var tabContentElt = document.getElementById('tab' + tab);

        if (tabLinkElt) {
            tabLinkElt.className = (on ? 'on' : 'off');
        }
        if (tabContentElt) {
            tabContentElt.style.display = (on ? 'block' : 'none');
        }
    }

    function processTabs(tab) {
        <%
            int totalTabs = Integer.parseInt(request.getParameter("totalTabs"));
            for (int i = 1; i <= totalTabs; i++) {
        %>
                if (tab == '<%=i%>') {
                    flickTab('<%=i%>', true);
                } else {
                    flickTab('<%=i%>', false);
                }
        <%
            }
        %>
    }

    AJS.$(init);
</script>
