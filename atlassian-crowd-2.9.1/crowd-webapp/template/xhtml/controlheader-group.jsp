<%@ taglib uri="/struts-tags" prefix="webwork" %>
<fieldset class="group">
    <webwork:if test="parameters['legend'] != null">
        <legend><span><webwork:property value="parameters['legend']"/></span></legend>
    </webwork:if>
