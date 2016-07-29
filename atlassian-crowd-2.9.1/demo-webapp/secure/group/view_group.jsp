<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="/struts-tags" prefix="ww" %>
<html>
<head>
    <title>
        <ww:text name="menu.viewgroup.label"><ww:param name="0" value="name"/></ww:text>
    </title>
    <meta name="section" content="groups"/>
</head>
<body>
<p class="headingInfo">
    <a id="add-group" href="<ww:url namespace="/secure/group" action="addgroup" method="default" includeParams="none" />">
        <ww:property value="getText('menu.addgroup.label')"/>
    </a>
    &nbsp; | &nbsp;
    <a id="remove-group" href="<ww:url namespace="/secure/group" action="removegroup" includeParams="none" ><ww:param name="directoryID" value="directoryID" /><ww:param name="name" value="name" /></ww:url>">
        <ww:text name="menu.removegroup.label"/>
    </a>
</p>

<h2>
    <ww:text name="menu.viewgroup.label">
        <ww:param name="0" value="name"/>
    </ww:text>
</h2>

<div class="page-content">

    <ul class="tabs">
        <li class="on">
            <span class="tab"><ww:text name="menu.details.label"/></span>
        </li>
    </ul>

    <div class="tabContent static">

        <div class="crowdForm">
            <form name="updategroup" method="post"
                  action="<ww:url namespace="/secure/group" action="updategroup" method="update" includeParams="none"/>">

                <div class="formBody">

                    <ww:include value="/include/generic_errors.jsp"/>

                    <div class="fieldArea required">
                        <label class="fieldLabelArea" for="groupName">
                            <ww:property value="getText('group.name.label')"/>
                        </label>
                        <div class="fieldValueArea" id="groupName">
                            <ww:property value="name"/>
                        </div>
                    </div>

                    <input name="name" type="hidden" value="<ww:property value="name"/>"/>

                    <ww:textfield name="groupDescription" >
                        <ww:param name="label" value="getText('group.description.label')"/>
                    </ww:textfield>

                    <ww:checkbox name="active" >
                        <ww:param name="label" value="getText('group.active.label')"/>
                    </ww:checkbox>

                </div>
                <div class="formFooter">

                    <div class="buttons">
                        <input type="submit" class="button"
                               value="<ww:text name="submit.label"/> &raquo;"/>
                    </div>
                </div>

            </form>
        </div>
    </div>

</div>
</body>
</html>
