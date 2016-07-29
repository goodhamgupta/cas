<%@ taglib uri="/WEB-INF/crowd.tld" prefix="cwd" %>
<%@ taglib uri="/struts-tags" prefix="ww" %>

<cwd:soy moduleKey="com.atlassian.auiplugin:aui-experimental-soy-templates" template="aui.progressTracker.progressTracker">
    <ww:param name="steps" value="parameters['steps']" />
</cwd:soy>
