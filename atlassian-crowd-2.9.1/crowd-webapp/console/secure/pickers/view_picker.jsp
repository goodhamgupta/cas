<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="/struts-tags" prefix="ww" %>
<html>
<head>
    <title></title>
</head>
<body>

<form id="browseentities" name="browseentities" method="post" class="aui">
    <ww:component template="form_messages.jsp"/>
    <ww:textfield name="searchString">
        <ww:param name="label" value="getText('browser.filter.label')"/>
        <ww:param name="fieldAfter">
            <input id="searchButton" name="searchButton" type="submit" class="aui-button" value="<ww:property value=" getText('browser.filter.label')"/>"/>
        </ww:param>
    </ww:textfield>
    <ww:select name="activeFlag" list="activeOption" listKey="key" listValue="value">
        <ww:param name="label" value="getText('principal.active.label')"/>
        <ww:param name="fieldWidth" value="'medium'"/>
    </ww:select>
    <ww:select list="resultsPerPageOption" listKey="toString()" listValue="toString()" name="resultsPerPage">
        <ww:param name="label" value="getText('browser.maximumresults.label')"/>
        <ww:param name="fieldWidth" value="'short'"/>
    </ww:select>
</form>
<form id="selectentities" name="selectentities" method="post" class="aui">
    <div id="results-table">
        <p class="picker-msg">
            <ww:property value="initialMessage"/>
        </p>
    </div>
</form>
</body>
</html>
