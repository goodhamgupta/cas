<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="/struts-tags" prefix="ww" %>
<html>
<head>
    <title><ww:text name="menu.user.console.editprofile.label"/></title>
    <meta name="section" content="user.console"/>
    <meta name="pagename" content="editprofile"/>
    <meta name="help.url" content="<ww:text name="help.user.console.editprofile"/>"/>
</head>
<body>
<h2><ww:text name="menu.user.console.editprofile.label"/></h2>

<div class="aui-group account-settings">

<div class="aui-item">

<%-- action scoped variable to indicate whether the current user has permission to update profile or not --%>
<ww:set var="canUpdateProfile" value="hasUpdateProfilePermission()" />

<ww:set name="formContent">
    <ww:component template="form_row.jsp">
        <ww:param name="label" value="getText('principal.name.label')" />
        <ww:param name="value" value="username"/>
    </ww:component>
    <ww:textfield name="firstname" disabled="!#canUpdateProfile">
        <ww:param name="label" value="getText('principal.firstname.label')"/>
    </ww:textfield>
    <ww:textfield name="lastname" disabled="!#canUpdateProfile">
        <ww:param name="label" value="getText('principal.lastname.label')"/>
    </ww:textfield>
    <ww:textfield name="email" size="50" disabled="!#canUpdateProfile">
        <ww:param name="type" value="'email'"/>
        <ww:param name="label" value="getText('principal.email.label')"/>
    </ww:textfield>
</ww:set>
<ww:component template="form.jsp" id="updateprofile">
    <ww:param name="action"><ww:url namespace="/console/user" action="updateprofile" includeParams="none"/></ww:param>
    <ww:param name="cancelUri">
        <ww:if test="#canUpdateProfile">
            <ww:url namespace="/console/user" action="viewprofile" includeParams="none" />
        </ww:if>
    </ww:param>
    <ww:param name="cancelId" value="'cancel'" />
    <ww:param name="content" value="#formContent" />
    <ww:param name="includeSubmitButton" value="#canUpdateProfile" />
</ww:component>

</div>

<ww:if test="avatarUrl != null">
  <div class="aui-item avatar-panel">

    <div>
      <span class="aui-avatar aui-avatar-xxxlarge">
        <span class="aui-avatar-inner">
          <img src="<ww:property value="avatarUrl"/>" width="128" alt="">
        </span>
      </span>
    </div>

  </div>
</ww:if>

</div>

</body>
</html>
