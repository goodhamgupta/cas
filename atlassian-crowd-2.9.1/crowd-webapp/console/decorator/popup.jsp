<%@ page pageEncoding='utf-8' %>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator" %>
<%@ taglib uri="/struts-tags" prefix="ww" %>
<!DOCTYPE html>
<html lang="en">

<head>

    <decorator:usePage id="sitemeshPage"/>

    <title>
        <ww:text name="application.title"/>&nbsp;-&nbsp;<decorator:title/>
    </title>

    <meta charset="UTF-8">
    <meta name="author" content="Atlassian"/>
    <meta name="robots" content="all"/>

    <meta name="description" content=""/>
    <meta name="keywords" content=""/>

    <link rel="shortcut icon" href="<ww:url value="/console/favicon.ico" includeParams="none"/>">

    <decorator:head/>

    <style type="text/css" media="all">
        @import "<ww:url value="/console/style/main.css" includeParams="none"/>";
        @import "<ww:url value="/console/style/forms.css" includeParams="none"/>";
        @import "<ww:url value="/console/style/idx-legacy.css" includeParams="none"/>";
    </style>


    <!--[if IE 7]>
     <style type="text/css" media="all">
         @import "<ww:url value="/console/style/ie7.css" includeParams="none"/>";
     </style>
     <![endif]-->

    <!--[if IE 6]>
      <style type="text/css" media="all">
          @import "<ww:url value="/console/style/ie6.css" includeParams="none"/>";
      </style>
      <![endif]-->

    <script>
        // Sets the help link. Called from tabbed pages to change the help link when different tabs are selected.
        function setHelpLink(helpHref)
        {
            document.getElementById('helpLink').href = '<ww:text name="help.prefix"/>' + helpHref;
        }
    </script>
</head>

<body onload="<decorator:getProperty property="body.onload" />" style="min-width:300px">

<ul id="top">
    <li id="skipNav">
        <a href="#menu">Skip to navigation</a>
    </li>
    <li>
        <a href="#content">Skip to content</a>
    </li>
</ul>
<div id="nonFooter">

<div id="header">
    <div id="logo">
        <a href="<ww:url value="/console" includeParams="none"/>"><img alt="<ww:text name="application.name"/>" src="<ww:url value="/console/images/logo.gif" includeParams="none"/>" height="36" width="118"/></a>
    </div>

    <ul id="userOptions">
       <!-- popup decorator does not have user profile links -->

        <li id="help">
            <a id="helpLink" href="<ww:text name="help.prefix"/><ww:property value="%{#attr.sitemeshPage.getProperty('meta.help.url')}"/>" target="_crowdhelp">
                <ww:text name="menu.documentation.label"/>
            </a>
        </li>
    </ul>
</div>
<!-- END #header -->

<!-- popup decorator does not have top menu -->

<div id="wrapper">

<!-- popup decorator does not have left hand menu -->


<div id="popup">
    <decorator:body/>
</div>
</div>
<!-- // #wrapper -->

</div>

<div id="footer">
    <p>
        <ww:text name="footer.poweredby"/> <a href="<ww:text name="application.poweredby.url"/>"><ww:text name="application.title"/></a>
        <ww:text name="common.words.version"/>:&nbsp;<ww:property value="@com.atlassian.crowd.util.build.BuildUtils@getVersion()"/>
    </p>
</div>
<!-- END #nonFooter -->

<!-- END #footer -->

</body>

</html>
