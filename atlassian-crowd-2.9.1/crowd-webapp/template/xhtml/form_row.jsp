<%@ taglib uri="/struts-tags" prefix="ww" %>

<div class="field-group">
    <label<ww:if test="parameters['valueid'] != null"> for="<ww:property value="parameters['valueid']" escape="false"/>"</ww:if>>
        <ww:property value="parameters['label']" escape="false"/>
    </label>
    <span <ww:if test="parameters['valueid'] != null">id="<ww:property value="parameters['valueid']" escape="false"/>"</ww:if> class="field-value">
        <%-- escapeValue or escapeDescription can be set to 'false' if you have already performed escaping (example:
        there is a hyperlink) --%>
        <ww:if test="parameters['escapeValue'] == false">
            <ww:property value="parameters['value']" escape="false" />
        </ww:if>
        <ww:else>
            <ww:property value="parameters['value']"/>
        </ww:else>
    </span>
    <ww:if test="parameters['warning'] != null">
        <div class="error">
            <ww:property value="parameters['warning']" escape="true"/>
        </div>
    </ww:if>
    <ww:if test="parameters['description'] != null">
        <div class="description">
            <ww:if test="parameters['escapeDescription'] == false">
                <ww:property value="parameters['description']" escape="false" />
            </ww:if>
            <ww:else>
                <ww:property value="parameters['description']"/>
            </ww:else>
        </div>
    </ww:if>
</div>
