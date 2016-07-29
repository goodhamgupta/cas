<%@ taglib uri="/struts-tags" prefix="webwork" %>

<label for="<webwork:if test="parameters['id'] != null && parameters['id'].length() > 0"><webwork:property value="parameters['id']"/></webwork:if><webwork:else><webwork:property value="parameters['name']"/></webwork:else>">
    <webwork:property value="parameters['label']"/>
    <webwork:if test="parameters['required'] == true">
        <span class="aui-icon icon-required"> required</span>
    </webwork:if>
</label>
