<%@ taglib uri="/struts-tags" prefix="ww" %>
<%
    pageContext.getServletContext().getRequestDispatcher("/console/login.action").forward(request, response);
%>
