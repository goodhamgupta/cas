<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="/struts-tags" prefix="ww" %>
<html>
<head>
    <title><ww:property value="getText('directoryinternalcreate.title')"/></title>
    <meta name="section" content="directories"/>
    <meta name="pagename" content="adddirectory"/>
    <meta name="help.url" content="<ww:property value="getText('help.directory.add.internal.details')"/>"/>
    <script>
        AJS.$(document).on('tabSelect', '.tabs-menu > li.menu-item > a', function (e, tabData) {
            var helpLinks = [
                '<ww:property value="getText('help.directory.add.internal.details')"/>',
                '<ww:property value="getText('help.directory.add.internal.permissions')"/>'
            ];
            setHelpLink(helpLinks[tabData.tab.parent().prevAll().length]);
        });
    </script>
</head>
<body>

<h2><ww:property value="getText('directoryinternalcreate.title')"/></h2>
<ww:set name="formContent">
    <div class="aui-tabs horizontal-tabs">
        <ul class="tabs-menu">
            <li class="menu-item active-tab" id="hreftab1">
                <a href="#tab1">
                    <strong><ww:property value="getText('menu.details.label')"/></strong>
                </a>
            </li>
            <li class="menu-item" id="hreftab2">
                <a href="#tab2">
                    <strong><ww:property value="getText('menu.permissions.label')"/></strong>
                </a>
            </li>
        </ul>
        <div class="tabs-pane active-pane create" id="tab1">
            <ww:component template="form_tab_messages.jsp">
                <ww:param name="tabID" value="1"/>
            </ww:component>
            <ww:textfield name="name" size="50">
                <ww:param name="label" value="getText('directoryinternal.name.label')"/>
                <ww:param name="description">
                    <ww:property value="getText('directoryinternal.name.description')"/>
                </ww:param>
                <ww:param name="required" value="true" />
            </ww:textfield>
            <ww:textfield name="description" size="50">
                <ww:param name="label" value="getText('directoryinternal.description.label')"/>
                <ww:param name="fieldWidth" value="'long'"/>
                <ww:param name="description">
                    <ww:property value="getText('directoryinternal.description.description')"/>
                </ww:param>
            </ww:textfield>
            <ww:checkbox name="active" fieldValue="true">
                <ww:param name="label" value="getText('directory.active.label')"/>
                <ww:param name="description">
                    <ww:property value="getText('directory.active.description')"/>
                </ww:param>
            </ww:checkbox>
            <ww:textfield name="passwordRegex" size="50">
                <ww:param name="label" value="getText('directoryinternal.passwordregex.label')"/>
                <ww:param name="description">
                    <ww:property value="getText('directoryinternal.passwordregex.description')"/>
                </ww:param>
            </ww:textfield>
            <ww:textfield name="passwordComplexityMessage" size="50">
                <ww:param name="label" value="getText('directoryinternal.passwordcomplexity.help.label')"/>
                <ww:param name="description">
                    <ww:property value="getText('directoryinternal.passwordcomplexity.help.description')"/>
                </ww:param>
            </ww:textfield>
            <ww:textfield name="passwordMaxAttempts">
                <ww:param name="label" value="getText('directoryinternal.passwordmaxattempts.label')"/>
                <ww:param name="type" value="'number'" />
                <ww:param name="fieldWidth" value="'short'"/>
                <ww:param name="description">
                    <ww:property value="getText('directoryinternal.passwordmaxattempts.description')"/>
                </ww:param>
            </ww:textfield>
            <ww:textfield name="passwordMaxChangeTime">
                <ww:param name="label" value="getText('directoryinternal.passwordmaxchangetime.label')"/>
                <ww:param name="type" value="'number'" />
                <ww:param name="fieldWidth" value="'short'"/>
                <ww:param name="description">
                    <ww:property value="getText('directoryinternal.passwordmaxchangetime.description')"/>
                </ww:param>
            </ww:textfield>
            <ww:textfield name="passwordHistoryCount">
                <ww:param name="label" value="getText('directoryinternal.passwordhistorycount.label')"/>
                <ww:param name="type" value="'number'" />
                <ww:param name="fieldWidth" value="'short'"/>
                <ww:param name="description">
                    <ww:property value="getText('directoryinternal.passwordhistorycount.description')"/>
                </ww:param>
            </ww:textfield>
            <ww:select list="userEncryptionMethods" name="userEncryptionMethod" listKey="key" listValue="value" required="true">
                <ww:param name="label" value="getText('directoryconnector.userencryptionmethod.label')"/>
                <ww:param name="description">
                    <ww:property value="getText('directoryconnector.userencryptionmethod.internal.description')"/>
                </ww:param>
            </ww:select>
            <ww:checkbox name="useNestedGroups" fieldValue="true">
                <ww:param name="label" value="getText('directoryinternal.nestedgroups.disable.label')"/>
                <ww:param name="description">
                    <ww:property value="getText('directoryinternal.nestedgroups.disable.description')"/>
                </ww:param>
            </ww:checkbox>
        </div>
        <div class="tabs-pane" id="tab2">
            <ww:component template="form_tab_messages.jsp">
                <ww:param name="tabID" value="2"/>
            </ww:component>
            <ww:component template="permissions.jsp">
                <ww:param name="legend" value="getText('menu.permissions.label')"/>
            </ww:component>
        </div>
    </div>
</ww:set>
<ww:component template="form.jsp" id="directoryinternal">
    <ww:param name="action"><ww:url namespace="/console/secure/directory" action="createinternal" method="update" includeParams="none" /></ww:param>
    <ww:param name="content" value="#formContent" />
    <ww:param name="submitLabel" value="getText('continue.label')" />
    <ww:param name="cancelUri"><ww:url namespace="/console/secure/directory" action="browse" includeParams="none" /></ww:param>
    <ww:param name="includeFormMessages" value="false" />
</ww:component>

</body>
</html>
