<%@ taglib uri="/struts-tags" prefix="ww" %>

<ww:if test="containsErrorMessages()">
    <div class="aui-message error">
        <ww:iterator value="actionErrors">
            <p<ww:if test="actionErrors.size() == 1"> class="title"</ww:if>><ww:property/></p>
        </ww:iterator>
        <span class="aui-icon icon-error"></span>
    </div>
</ww:if>

<ww:if test="containsActionMessages()">
    <%-- all on one line to eliminate whitespace --%>
    <ww:set name="type"><ww:if test="actionMessageAlertColor == 'green'">success</ww:if><ww:elseif test="actionMessageAlertColor == 'blue'">info</ww:elseif><ww:else>warning</ww:else></ww:set>
    <div class="aui-message <ww:property value="#type"/>">
        <ww:iterator value="actionMessages">
            <p<ww:if test="actionMessages.size() == 1"> class="title"</ww:if>><ww:property/></p>
        </ww:iterator>
        <span class="aui-icon icon-<ww:property value="#type"/>"></span>
    </div>
</ww:if>

<ww:if test="#request['updateSuccessful'] || #parameters['updateSuccessful']">
    <div class="aui-message success">
        <p class="title">
            <ww:property value="getText('updatesuccessful.label')"/>
        </p>
        <span class="aui-icon icon-success"></span>
    </div>
</ww:if>
