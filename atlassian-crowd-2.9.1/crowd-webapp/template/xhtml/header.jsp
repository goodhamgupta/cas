<%@ taglib uri="/WEB-INF/crowd.tld" prefix="cwd" %>
<%@ taglib uri="/struts-tags" prefix="ww" %>

<cwd:soy moduleKey="com.atlassian.auiplugin:aui-experimental-soy-templates" template="aui.page.pageHeader">
    <ww:param name="content">
        <cwd:soy moduleKey="com.atlassian.auiplugin:aui-experimental-soy-templates" template="aui.page.pageHeaderMain">
            <ww:param name="content">
                <ww:property value="parameters['mainContent']" escape="false" />
            </ww:param>
        </cwd:soy>
        <ww:if test="parameters['actionsContent'] != null">
            <cwd:soy moduleKey="com.atlassian.auiplugin:aui-experimental-soy-templates" template="aui.page.pageHeaderActions">
                <ww:param name="content">
                    <ww:property value="parameters['actionsContent']" escape="false" />
                </ww:param>
            </cwd:soy>
        </ww:if>
    </ww:param>
</cwd:soy>
