<%@ taglib uri="/struts-tags" prefix="ww" %>
<%@ taglib uri="/WEB-INF/crowd.tld" prefix="cwd" %>

<cwd:soy moduleKey="com.atlassian.auiplugin:aui-experimental-soy-templates" template="aui.form.form">
    <ww:param name="id" value="parameters['id']" />
    <ww:param name="method" value="parameters['method']" />
    <ww:param name="action" value="parameters['action']" />
    <ww:param name="enctype" value="parameters['enctype']" />
    <ww:param name="isUnsectioned" value="parameters['isUnsectioned']" />
    <ww:param name="isLongLabels" value="parameters['isLongLabels']" />
    <ww:param name="isTopLabels" value="parameters['isTopLabels']" />
    <ww:param name="content">
        <ww:if test="parameters['includeFormMessages'] != false">
            <ww:if test="parameters['tabID'] != null">
                <ww:component template="form_tab_messages.jsp">
                    <ww:param name="tabID" value="parameters['tabID']"/>
                </ww:component>
            </ww:if>
            <ww:else>
                <ww:component template="form_messages.jsp"/>
            </ww:else>
        </ww:if>
        <ww:property value="parameters['content']" escape="false" />
        <ww:if test="parameters['includeSubmitButton'] != false || (parameters['cancelUri'] != null && parameters['cancelUri'] != '') || parameters['beforeButtonContent'] != null || parameters['afterButtonContent'] != null">
            <cwd:soy moduleKey="com.atlassian.auiplugin:aui-experimental-soy-templates" template="aui.form.buttons">
                <ww:param name="content">
                    <ww:property value="parameters['beforeButtonContent']" escape="false" />
                    <ww:if test="parameters['includeSubmitButton'] != false">
                        <cwd:soy moduleKey="com.atlassian.auiplugin:aui-experimental-soy-templates" template="aui.buttons.button">
                            <ww:param name="tagName" value="'input'" />
                            <ww:param name="inputType" value="'submit'" />
                            <ww:param name="type"><ww:if test="parameters['isPrimary'] != false">primary</ww:if></ww:param>
                            <ww:param name="text">
                                <ww:if test="parameters['submitLabel'] != null">
                                    <ww:property value="parameters['submitLabel']" escape="false" />
                                </ww:if>
                                <ww:else>
                                    <ww:text name="update.label" />
                                </ww:else>
                            </ww:param>
                            <ww:param name="extraAttributes">
                                <ww:if test="parameters['submitName'] != null">
                                    name="<ww:property value="parameters['submitName']" escape="false" />"
                                </ww:if>
                            </ww:param>
                        </cwd:soy>
                    </ww:if>
                    <ww:if test="parameters['cancelUri'] != null && parameters['cancelUri'] != ''">
                        <cwd:soy moduleKey="com.atlassian.auiplugin:aui-experimental-soy-templates" template="aui.buttons.button">
                            <ww:param name="href" value="parameters['cancelUri']" />
                            <ww:param name="id" value="parameters['cancelId']" />
                            <ww:param name="type" value="'link'" />
                            <ww:param name="text">
                                <ww:if test="parameters['cancelLabel'] != null">
                                    <ww:property value="parameters['cancelLabel']" escape="false" />
                                </ww:if>
                                <ww:else>
                                    <ww:text name="cancel.label" />
                                </ww:else>
                            </ww:param>
                        </cwd:soy>
                    </ww:if>
                    <ww:property value="parameters['afterButtonContent']" escape="false" />
                </ww:param>
            </cwd:soy>
            <ww:property value="parameters['belowButtonContent']" escape="false" />
        </ww:if>
        <ww:if test="parameters['includeXsrfToken'] != false">
            <ww:hidden name="%{xsrfTokenName}" value="%{xsrfToken}"/>
        </ww:if>
    </ww:param>
</cwd:soy>
