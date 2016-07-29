<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="/struts-tags" prefix="ww" %>
<html>
<head>
    <title>
        <ww:text name="menu.viewapplication.label"/>
    </title>
    <meta name="section" content="applications"/>
    <meta name="pagename" content="view"/>
    <meta name="help.url" content="<ww:text name="help.application.view.details"/>"/>

</head>
<body>

<h2 id="application-name">
    <img class="application-icon" title="<ww:property value="getImageTitle(application.active, application.type)"/>" alt="<ww:property value="getImageTitle(application.active, application.type)"/>" src="<ww:property value="getImageLocation(application.active, application.type)" />"/>
    <ww:property value="application.name"/>
</h2>

<div class="aui-tabs horizontal-tabs aui-tabs-disabled">

    <ww:component template="application_tab_headers.jsp">
        <ww:param name="pagekey" value="'application-details'"/>
    </ww:component>

    <div class="tabs-pane active-pane" id="tab1">
        <ww:set name="formContent">
            <ww:textfield name="name" size="35" disabled="application.permanent">
                <ww:param name="required" value="!application.permanent"/>
                <ww:param name="label" value="getText('application.name.label')"/>
                <ww:param name="description">
                    <ww:property value="getText('application.name.description')"/>
                </ww:param>
                <ww:param name="escapeDescription" value="true" />
            </ww:textfield>

            <!-- disabled fields aren't set back to the server -->
            <ww:if test="application.permanent">
                <input type="hidden" name="name" value="<ww:property value="name"/>"/>
            </ww:if>

            <ww:textfield name="applicationDescription" size="35">
                <ww:param name="label" value="getText('application.description.label')"/>
                <ww:param name="description">
                    <ww:property value="getText('application.description.description')"/>
                </ww:param>
            </ww:textfield>

            <ww:component template="form_row.jsp">
                <ww:param name="label" value="getText('application.type.label')"/>
                <ww:param name="value" value="application.type.displayName"/>
            </ww:component>

            <ww:checkbox name="active" disabled="crowdApplication">
                <ww:param name="label" value="getText('application.active.label')"/>
            </ww:checkbox>

            <ww:component template="form_row.jsp">
                <ww:param name="label" value="getText('application.conception.label')"/>
                <ww:param name="value">
                    <ww:date format="dd MMM yyyy, HH:mm:ss" name="application.createdDate"/>
                </ww:param>
                <ww:param name="escapeValue" value="false" />
            </ww:component>

            <ww:component template="form_row.jsp">
                <ww:param name="label" value="getText('application.lastmodified.label')"/>
                <ww:param name="value">
                    <ww:date format="dd MMM yyyy, HH:mm:ss" name="application.updatedDate"/>
                </ww:param>
                <ww:param name="escapeValue" value="false" />
            </ww:component>

            <ww:if test="!pluginApplication">
                <ww:password name="password" size="35">
                    <ww:param name="label" value="getText('password.label')"/>
                    <ww:param name="description">
                        <ww:property value="getText('application.password.description')"/>
                    </ww:param>
                </ww:password>

                <ww:password name="passwordConfirm" size="35">
                    <ww:param name="label" value="getText('passwordconfirm.label')"/>
                </ww:password>
            </ww:if>
            <input type="hidden" name="ID" value="<ww:property value="ID" />"/>
        </ww:set>
        <ww:component template="form.jsp" id="applicationDetails">
            <ww:param name="action"><ww:url namespace="/console/secure/application" action="update" method="update" includeParams="none" /></ww:param>
            <ww:param name="cancelUri"><ww:url namespace="/console/secure/application" action="viewdetails" method="default" includeParams="none"><ww:param name="ID" value="ID"/><ww:param name="tab" value="1"/></ww:url></ww:param>
            <ww:param name="content" value="#formContent" />
            <ww:param name="tabID" value="1"/>
        </ww:component>
    </div>
</div>
</body>
</html>
