<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="/struts-tags" prefix="ww" %>
<html>
<head>
    <title>
        <ww:text name="error.title"/>
    </title>
</head>

<body>
<h2><ww:text name="error.title"/></h2>

    <ww:if test="!importErrors.isEmpty">
        <table class="aui">
            <thead>
                <tr>
                    <th><ww:text name="error.import.label"/></th>
                </tr>
            </thead>
            <tbody>
                <ww:iterator value="importErrors">
                    <tr>
                        <td><ww:property value="desc"/></td>
                    </tr>
                </ww:iterator>
            </tbody>
        </table>
        <div class="aui-message error">
            <p class="title"><a id="remove-errors" href="<ww:url action="error" method="removeImportErrorEvent" namespace="/console/error"/>"><ww:text name="error.import.remove"/></a></p>
            <span class="aui-icon icon-error"></span>
        </div>
    </ww:if>

    <ww:iterator value="eventMap">
        <h3><ww:property value="key.description"/>&nbsp;<ww:text name="common.words.error"/></h3>

        <table class="aui">
            <thead>
                <tr>
                    <th><ww:text name="error.time.label"/></th>
                    <th><ww:text name="error.level.label"/></th>
                    <th><ww:text name="error.description.label"/></th>
                    <th><ww:text name="error.exception.label"/></th>
                </tr>
            </thead>
            <tbody>
                <ww:iterator value="value" id="event">
                    <tr>
                        <td style="white-space: nowrap;"><ww:property value="date"/></td>
                        <td style="white-space: nowrap;"><ww:property value="level.level"/></td>
                        <td>
                            <ww:if test="key.type == 'license-too-old'">
                                <ww:text name="error.license.too.old.text">
                                    <ww:param name="0"><a href="<ww:url includeParams="none" namespace="/console" action="license" method="default"/>"></ww:param>
                                    <ww:param name="1"></a></ww:param>
                                </ww:text>
                            </ww:if>
                            <ww:elseif test="key.type == 'restart'">
                                <ww:text name="error.console.restart.text">
                                    <ww:param name="0"><a href="<ww:url includeParams="none" namespace="/console" action="login"/>"></ww:param>
                                    <ww:param name="1"></a></ww:param>
                                </ww:text>
                            </ww:elseif>
                            <ww:else>
                                <ww:property value="desc"/>
                            </ww:else>
                        </td>
                        <td>
                            <ww:if test="exception != null">
                                <ww:property value="exception"/>
                            </ww:if>
                        </td>
                    </tr>
                </ww:iterator>
            </tbody>
        </table>
    </ww:iterator>

</body>
</html>
