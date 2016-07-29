<%@ taglib prefix="ww" uri="/struts-tags" %>

<ww:if test="fieldErrors">
    <!-- this is a JSP translation of the fielderror.ftl file that comes with WW 'simple' theme,
         with some simplifications -->
    <ww:set name="eKeys" value="fieldErrors.keySet()" />
    <ww:set name="haveMatchedErrorField" value="%{false}" />
    <ww:if test="fieldErrorFieldNames.size() > 0">
        <ww:iterator value="fieldErrorFieldNames" id="fieldErrorFieldName">
            <ww:iterator value="eKeys" id="eKey">
                <ww:if test="eKey == fieldErrorFieldName">
                    <ww:set name="eValue" value="fieldErrors[#fieldErrorFieldName]"/>
                    <ww:if test="#haveMatchedErrorField == false">
                        <div class="errorBox">
                        <ul>
                    </ww:if>
                    <ww:set name="haveMatchedErrorField" value="%{true}"/>
                    <ww:iterator value="eValue">
                        <li><span class="errorMessage"><ww:property/></span></li>
                    </ww:iterator>
                </ww:if>
            </ww:iterator>
        </ww:iterator>
        <ww:if test="#haveMatchedErrorField">
            </ul>
            </div>
        </ww:if>
    </ww:if>
    <ww:else>
        <ww:if test="#eKeys.size() > 0">
            <div class="errorBox">
            <ul>
                <ww:iterator value="eKeys" id="eKey">
                    <ww:set name="eValue" value="fieldErrors[#eKey]"/>
                    <ww:iterator value="eValue">
                        <li><span class="errorMessage"><ww:property/></span></li>
                    </ww:iterator>
                </ww:iterator>
            </ul>
            </div>
        </ww:if>
    </ww:else>
</ww:if>
