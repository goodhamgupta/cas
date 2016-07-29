<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="/struts-tags" prefix="ww" %>
<html>
<head>
    <title>
        <ww:text name="menu.viewdirectory.label">
            <ww:param><ww:property value="directory.name"/></ww:param>
        </ww:text>
    </title>
    <meta name="section" content="directories"/>
    <meta name="pagename" content="view"/>
    <meta name="help.url" content="<ww:property value="getText('help.directory.custom.attributes')"/>"/>
    <script>
        function addAttribute() {
            var form = document.getElementById('attributesForm');
            form.action = '<ww:url namespace="/console/secure/directory" action="updatecustomattributes" method="addAttribute" includeParams="none" />';
            form.submit();
        }
    </script>
</head>
<body>
<h2>
    <ww:text name="menu.viewdirectory.label">
        <ww:param><ww:property value="directory.name"/></ww:param>
    </ww:text>
</h2>

<div class="aui-tabs horizontal-tabs aui-tabs-disabled">
    <jsp:include page="inc_tabs_custom.jsp">
        <jsp:param name="selectedTab" value="2" />
    </jsp:include>
    <div class="tabs-pane active-pane">
        <ww:set name="formContent">
            <table id="attributesTable" class="aui">
                <thead>
                    <tr>
                        <th width="40%"><ww:text name="attribute.label"/></th>
                        <th width="40%"><ww:text name="values.label"/></th>
                        <th width="20%"><ww:text name="browser.action.label"/></th>
                    </tr>
                </thead>
                <tfoot>
                    <tr>
                        <td>
                            <ww:textfield name="attribute">
                                <ww:param name="inline" value="true"/>
                                <ww:param name="fieldWidth" value="'full-width'"/>
                                <ww:param name="placeholder" value="getText('attribute.label')"/>
                            </ww:textfield>
                        </td>
                        <td>
                            <ww:textfield name="value">
                                <ww:param name="inline" value="true"/>
                                <ww:param name="fieldWidth" value="'full-width'"/>
                                <ww:param name="placeholder" value="getText('value.label')"/>
                            </ww:textfield>
                        </td>
                        <td><input id="add-attribute" type="button" class="aui-button" value="<ww:text name="add.label"/>" onClick="addAttribute();"/></td>
                    </tr>
                </tfoot>
                <ww:iterator value="directory.attributes" status="rowstatus">
                    <tr>
                        <td>
                            <pre class="default-font"><ww:property value="key"/></pre>
                            <input type="hidden" name="attributes" value="<ww:property value="key" />"/>
                        </td>
                        <td>
                            <ww:iterator value="value" status="valuestatus">
                                <input type="text" name="<ww:property value="key" /><ww:property value="#valuestatus.count" />" value="<ww:property />" class="text full-width-field"/>
                            </ww:iterator>
                        </td>
                        <td>
                            <a id="remove-attribute-<ww:property value="key"/>" class="aui-button aui-button-link" href="<ww:url namespace="/console/secure/directory" action="updatecustomattributes" method="removeAttribute" includeParams="none"><ww:param name="attribute" value="key" /><ww:param name="ID" value="ID" /><ww:param name="%{xsrfTokenName}" value="%{xsrfToken}"/></ww:url>">
                                <ww:property value="getText('remove.label')"/>
                            </a>
                        </td>
                    </tr>
                </ww:iterator>
            </table>
            <input type="hidden" name="ID" value="<ww:property value="ID" />"/>
        </ww:set>
        <ww:component template="form.jsp" id="attributesForm">
            <ww:param name="action"><ww:url namespace="/console/secure/directory" action="updatecustomattributes" method="update" includeParams="none" /></ww:param>
            <ww:param name="content" value="#formContent" />
            <ww:param name="cancelUri">
                <ww:if test="!directory.attributes.isEmpty()">
                    <ww:url namespace="/console/secure/directory" action="updatecustom" method="default" includeParams="none"><ww:param name="ID" value="ID"/></ww:url>
                </ww:if>
            </ww:param>
            <ww:param name="includeSubmitButton" value="!directory.attributes.isEmpty()"/>
            <ww:param name="isTopLabels" value="true"/>
        </ww:component>
    </div>
</div>

</body>
</html>
