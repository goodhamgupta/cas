<%@ taglib uri="/struts-tags" prefix="webwork" %>
<webwork:iterator value="parameters.dataAttributes"> data-<webwork:property value="key"/>="<webwork:property value="value"/>"</webwork:iterator>
