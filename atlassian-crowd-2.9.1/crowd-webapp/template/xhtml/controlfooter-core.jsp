<%@ taglib uri="/struts-tags" prefix="webwork" %>

<webwork:if test="parameters['fieldAfter'] != null">
    <webwork:property value="parameters['fieldAfter']" escape="false" />
</webwork:if>
<webwork:if test="fieldErrors[parameters['name']] != null">
    <webwork:iterator value="fieldErrors[parameters['name']]">
        <div class="error">
            <webwork:property />
        </div>
    </webwork:iterator>
</webwork:if>
<webwork:if test="parameters['description'] != null">
    <div class="description"><webwork:property value="parameters['description']" escape="false" /></div>
</webwork:if>
