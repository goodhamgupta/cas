<%@ taglib uri="/struts-tags" prefix="webwork" %>

<webwork:if test="parameters['group'] != false">
    <%@ include file="controlheader-group.jsp" %>
</webwork:if>
<div class="checkbox">
    <input type="checkbox"
            <webwork:if test="parameters['nameValue'] == true || parameters['selectedValue'] == true">checked="checked"</webwork:if>
            name="<webwork:property value="parameters['name']"/>"
            value="<webwork:property value="parameters['fieldValue']"/>"
            <webwork:if test="parameters['disabled'] == true">disabled="disabled"</webwork:if>
            <webwork:if test="parameters['tabindex'] != null">tabindex="<webwork:property value="parameters['tabindex']"/>"</webwork:if>
            <webwork:if test="parameters['onchange'] != null">onchange="<webwork:property value="parameters['onchange']"/>"</webwork:if>
            <webwork:if test="parameters['onclick'] != null">onclick="<webwork:property value="parameters['onclick']"/>"</webwork:if>
            id="<webwork:if test="parameters['id'] != null && parameters['id'].length() > 0"><webwork:property value="parameters['id']"/></webwork:if><webwork:else><webwork:property value="parameters['name']"/></webwork:else>"
            class="checkbox<webwork:if test="parameters['cssClass'] != null"> <webwork:property value="parameters['cssClass']"/></webwork:if>"
            <webwork:if test="parameters['autofocus'] == true">autofocus</webwork:if>
            <%@ include file="data-attributes.jsp" %>
    />
    <%@ include file="controllabel.jsp" %>
    <%@ include file="controlfooter-core.jsp" %>
</div>
<webwork:if test="parameters['group'] != false">
    <%@ include file="controlfooter-group.jsp" %>
</webwork:if>
