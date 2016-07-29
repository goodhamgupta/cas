<%@ taglib prefix="ww" uri="/struts-tags" %>

<ww:if test="fieldErrors">
    <%-- this is a JSP translation of the fielderror.ftl file that comes with WW 'simple' theme, with some simplifications --%>
    <ww:set name="eKeys" value="fieldErrors.keySet()" />
    <ww:set name="haveMatchedErrorField" value="%{false}" />
    <ww:if test="fieldErrorFieldNames.size() > 0">
        <ww:iterator value="fieldErrorFieldNames" id="fieldErrorFieldName">
            <ww:iterator value="eKeys" id="eKey">
                <ww:if test="eKey == fieldErrorFieldName">
                    <ww:set name="eValue" value="fieldErrors[#fieldErrorFieldName]"/>
                    <ww:if test="#haveMatchedErrorField == false">
                        <div class="aui-message error">
                        <ww:if test="fieldErrorFieldNames.size() > 1"><ul></ww:if>
                    </ww:if>
                    <ww:set name="haveMatchedErrorField" value="%{true}"/>
                    <ww:iterator value="eValue">
                        <ww:if test="fieldErrorFieldNames.size() == 1"><p class="title"><ww:property/></p></ww:if>
                        <ww:else><li><ww:property/></li></ww:else>
                    </ww:iterator>
                </ww:if>
            </ww:iterator>
        </ww:iterator>
        <ww:if test="#haveMatchedErrorField">
                <ww:if test="fieldErrorFieldNames.size() > 1"></ul></ww:if>
                <span class="aui-icon icon-error"></span>
            </div>
        </ww:if>
    </ww:if>
    <ww:else>
        <ww:if test="#eKeys.size() > 0">
            <div class="aui-message error">
                <ww:if test="#eKeys.size() == 1">
                    <ww:iterator value="eKeys" id="eKey">
                        <ww:set name="eValue" value="fieldErrors[#eKey]"/>
                        <ww:iterator value="eValue">
                            <p class="title"><ww:property/></p>
                        </ww:iterator>
                    </ww:iterator>
                </ww:if>
                <ww:else>
                    <ul>
                        <ww:iterator value="eKeys" id="eKey">
                            <ww:set name="eValue" value="fieldErrors[#eKey]"/>
                            <ww:iterator value="eValue">
                                <li><ww:property/></li>
                            </ww:iterator>
                        </ww:iterator>
                    </ul>
                </ww:else>
                <span class="aui-icon icon-error"></span>
            </div>
        </ww:if>
    </ww:else>
</ww:if>
