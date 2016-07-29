<%@ taglib uri="/struts-tags" prefix="ww" %>

<ww:component template="form_messages.jsp"/>

<ww:if test="not isAtCorrectStep()">
    <div class="aui-message warning">
        <p class="title"><ww:property value="getText('setup.not.at.correct.step.error', {'<a href=\"selectsetupstep.action\">','</a>'}, false)" escape="false"/></p>
        <span class="aui-icon icon-warning"></span>
    </div>
</ww:if>
