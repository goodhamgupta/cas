<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="/struts-tags" prefix="ww" %>
<html>
<head>
    <title><ww:property value="getText('directorycustomcreate.title')"/></title>
    <meta name="section" content="directories"/>
    <meta name="pagename" content="adddirectory"/>
    <meta name="help.url" content="<ww:property value="getText('help.directory.add.custom.details')"/>"/>
    <script>
        AJS.$(document).on('tabSelect', '.tabs-menu > li.menu-item > a', function (e, tabData) {
            var helpLinks = [
                '<ww:property value="getText('help.directory.add.custom.details')"/>',
                '<ww:property value="getText('help.directory.add.custom.permissions')"/>'
            ];
            setHelpLink(helpLinks[tabData.tab.parent().prevAll().length]);
        });
    </script>
</head>
<body>

<h2><ww:property value="getText('directorycustomcreate.title')"/></h2>
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
        <div class="tabs-pane active-pane" id="tab1">
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
            <ww:textfield name="implementationClass" size="50">
                <ww:param name="label" value="getText('directorycustom.implementationclass.label')"/>
                <ww:param name="description">
                    <ww:property value="getText('directorycustom.implementationclass.description')"/>
                </ww:param>
                <ww:param name="required" value="true" />
            </ww:textfield>
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
<ww:component template="form.jsp" id="directorycustom">
    <ww:param name="action"><ww:url namespace="/console/secure/directory" action="createcustom" method="update" includeParams="none"/></ww:param>
    <ww:param name="content" value="#formContent" />
    <ww:param name="submitLabel" value="getText('continue.label')" />
    <ww:param name="cancelUri"><ww:url namespace="/console/secure/directory" action="browse" includeParams="none" /></ww:param>
    <ww:param name="includeFormMessages" value="false" />
</ww:component>

</body>
</html>
