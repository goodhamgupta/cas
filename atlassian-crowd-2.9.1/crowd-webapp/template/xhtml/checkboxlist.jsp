<%@ taglib uri="/struts-tags" prefix="webwork" %>
<%@ include file="controlheader-group.jsp" %>
<webwork:property value="parameters['nameValue']"/>
<webwork:iterator value="parameters.list" status="checkboxStatus">
    <webwork:push value="[0]"/>

    <webwork:if test="parameters.listKey != null">
        <webwork:set name="itemKey" value="stack.findString(parameters.listKey)"/>
    </webwork:if>
    <webwork:else>
        <webwork:set name="itemKey" value="[0]"/>
    </webwork:else>

    <webwork:if test="parameters.listValue != null">
        <webwork:set name="itemValue" value="stack.findString(parameters.listValue)"/>
    </webwork:if>
    <webwork:else>
        <webwork:set name="itemValue" value="[0]"/>
    </webwork:else>

    <webwork:if test="parameters.listDescription != null">
        <webwork:set name="itemDescription" value="stack.findString(parameters.listDescription)"/>
    </webwork:if>

    <div class="checkbox">
        <input type="checkbox"
                <webwork:if test="#itemKey in parameters['nameValue'] || #itemKey in parameters['selectedValue']">checked="checked"</webwork:if>
                name="<webwork:property value="parameters['name']"/>"
                id="<webwork:property value="parameters['name']"/>_<webwork:property value="#checkboxStatus.index"/>"
                value="<webwork:property value="#itemKey"/>"
                <webwork:if test="parameters['onchange'] != null">onchange="<webwork:property value="parameters['onchange']"/>"</webwork:if>
                <webwork:if test="parameters['onclick'] != null">onclick="<webwork:property value="parameters['onclick']"/>"</webwork:if>
                class="checkbox"
        />
        <label for="<webwork:property value="parameters['name']"/>_<webwork:property value="#checkboxStatus.index"/>"><webwork:property value="#itemValue"/></label>
        <webwork:if test="#itemDescription != null">
            <div class="description"><webwork:property value="#itemDescription" escape="false" /></div>
        </webwork:if>
    </div>

    <webwork:property value="stack.pop"/>
</webwork:iterator>

<%@ include file="controlfooter-core.jsp" %>
<%@ include file="controlfooter-group.jsp" %>
