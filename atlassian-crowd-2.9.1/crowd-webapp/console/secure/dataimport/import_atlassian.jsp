<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="/struts-tags" prefix="ww" %>
<html>
<head>
    <title><ww:property value="getText('dataimport.importatlassian.title')"/></title>
    <meta name="section" content="dataimport"/>
    <meta name="help.url" content="<ww:property value="getText('help.user.import.atlassian')"/>"/>
    <script>
        (function ($) {
            var internalAtlassianSecurityDirectories = [<ww:iterator value="internalAtlassianSecurityDirectories" status="currentdir">"<ww:property value="id" />"<ww:if test="!#currentdir.last">,</ww:if></ww:iterator>];

            function hideShowPasswordImport() {
                var $checkbox = $('#configurationImportPasswords');
                var $field = $checkbox.closest('.group');
                var directoryId = $(this).val();

                for (var i = 0, ii = internalAtlassianSecurityDirectories.length; i < ii; i++) {
                    var internalDirectoryId = internalAtlassianSecurityDirectories[i];
                    if (internalDirectoryId == directoryId) {
                        // display the password
                        $field.show();
                        $checkbox.prop('checked', true);
                        break;
                    } else {
                        $field.hide();
                        $checkbox.prop('checked', false);
                    }
                }
            }

            $(function () {
                var $select = $('#configurationDirectoryID').change(hideShowPasswordImport);
                hideShowPasswordImport.call($select[0]);
            });
        }(AJS.$));
    </script>
</head>
<body>

<ww:set name="progressTracker">
    <ww:component template="progress-tracker.jsp">
        <ww:param name="steps" value="getProgressSteps(1)" />
    </ww:component>
</ww:set>
<ww:component template="header.jsp">
    <ww:param name="mainContent">
        <h2><ww:property value="getText('dataimport.importatlassian.title')"/></h2>
    </ww:param>
    <ww:param name="actionsContent" value="#progressTracker" />
</ww:component>

<h3><ww:property value="getText('dataimport.importatlassian.text')"/></h3>
<ww:set name="formContent">
    <ww:select name="configurationApplication" list="atlassianApplications" listKey="key" listValue="value">
        <ww:param name="label" value="getText('dataimport.importatlassian.product.label')"/>
        <ww:param name="description">
            <ww:property value="getText('dataimport.importatlassian.product.description')"/>
        </ww:param>
        <ww:param name="required" value="true"/>
    </ww:select>
    <ww:select name="configurationDirectoryID" list="directories" listKey="id" listValue="name">
        <ww:param name="label" value="getText('dataimport.importdirectory.label')"/>
        <ww:param name="description">
            <ww:property value="getText('dataimport.importdirectory.description')"/>
        </ww:param>
        <ww:param name="required" value="true"/>
    </ww:select>
    <ww:checkbox name="configurationImportPasswords" >
        <ww:param name="label" value="getText('dataimport.importpassword.label')"/>
        <ww:param name="description" value="getText('dataimport.importpassword.description')" />
    </ww:checkbox>
    <ww:textfield name="configurationDatabaseURL" size="50" required="true">
        <ww:param name="label" value="getText('dataimport.importdburl.label')"/>
        <ww:param name="fieldWidth" value="'long'"/>
    </ww:textfield>
    <ww:textfield name="configurationDatabaseDriver" size="50" required="true">
        <ww:param name="label" value="getText('dataimport.importdriver.label')"/>
        <ww:param name="fieldWidth" value="'long'"/>
    </ww:textfield>
    <ww:textfield name="configurationUsername" required="true">
        <ww:param name="label" value="getText('dataimport.importdbusername.label')"/>
    </ww:textfield>
    <ww:password name="configurationPassword">
        <ww:param name="label" value="getText('dataimport.importdbpassword.label')"/>
    </ww:password>
</ww:set>
<ww:component template="form.jsp" id="dataimport">
    <ww:param name="action"><ww:url namespace="/console/secure/dataimport" action="importatlassian" method="checkAdditionalParamsRequired" includeParams="none"/></ww:param>
    <ww:param name="content" value="#formContent" />
    <ww:param name="submitLabel" value="getText('continue.label')" />
    <ww:param name="cancelUri">
        <ww:if test="directory.type.code == 1"><ww:url namespace="/console/secure/directory" action="viewinternal" method="default" includeParams="none"><ww:param name="ID" value="ID" /></ww:url></ww:if>
        <ww:elseif test="directory.type.code == 2"><ww:url namespace="/console/secure/directory" action="viewconnector" method="default" includeParams="none"><ww:param name="ID" value="ID" /></ww:url></ww:elseif>
        <ww:else><ww:url namespace="/console/secure/dataimport" action="importtype" method="default" includeParams="none" /></ww:else>
    </ww:param>
</ww:component>

</body>
</html>
