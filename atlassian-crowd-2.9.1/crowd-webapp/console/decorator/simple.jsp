<%@ page pageEncoding='utf-8' %>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator" %>
<%@ taglib uri="/struts-tags" prefix="ww" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <decorator:usePage id="sitemeshPage"/>
    <ww:url id="pathToAui" value="/console/setup/aui/aui" includeParams="none" />
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=EDGE" />
    <title><ww:property value="getText('application.title')"/> - <decorator:title/></title>
    <link rel="shortcut icon" href="<ww:url value="/console/favicon.ico" includeParams="none"/>" />

    <link rel="stylesheet" href="<ww:property value="#pathToAui"/>/css/aui-all.css" />
    <!--[if IE 9]><link rel="stylesheet" href="<ww:property value="#pathToAui"/>/css/aui-ie9.css" /><![endif]-->
    <script src="<ww:property value="#pathToAui"/>/js/aui-all.js"></script>

    <decorator:head/>
</head>
<body class="aui-page-focused aui-page-focused-xlarge">
<div id="page">
    <header id="header" role="banner">
        <nav class="aui-header aui-dropdown2-trigger-group" role="navigation">
            <div class="aui-header-inner">
                <div class="aui-header-primary">
                    <h1 id="logo" class="aui-header-logo aui-header-logo-crowd"><a href="<ww:url value="/" includeParams="none" />"><span class="aui-header-logo-device">Crowd</span></a></h1>
                </div>
            </div><!-- .aui-header-inner-->
            <div class="aui-header-secondary">
                <ul class="aui-nav">
                    <li>
                        <a href="<ww:text name="application.documentation.url"/>" target="_crowdhelp">
                            <span class="aui-icon aui-icon-small aui-iconfont-help"><ww:text name="menu.documentation.label"/></span>
                        </a>
                    </li>
                </ul>
            </div>
        </nav><!-- .aui-header -->
    </header>

    <section id="content" role="main">
        <div class="aui-page-panel">
            <div class="aui-page-panel-inner">
                <section class="aui-page-panel-content">
                    <decorator:body/>
                </section>
            </div>
        </div>
    </section>

    <footer id="footer" role="contentinfo">
        <div class="footer-body">
            <p>
                <ww:text name="footer.poweredby"/> <a href="<ww:text name="application.poweredby.url"/>"><ww:text name="application.title"/></a>
                <ww:text name="common.words.version"/>:&nbsp;<ww:property value="@com.atlassian.crowd.util.build.BuildUtils@getVersion()"/>
            </p>
            <ul>
                <li><a href="http://jira.atlassian.com/browse/CWD"><ww:text name="support.bug"/></a></li>
                <li><a href="http://jira.atlassian.com/browse/CWD"><ww:text name="support.feature"/></a></li>
                <li><a href="<ww:url value="/about.jsp"/>"><ww:text name="about.link"/></a></li>
                <li><a href="http://www.atlassian.com/about/contact.jsp"><ww:text name="support.contact"/></a></li>
            </ul>
            <div id="footer-logo"><a href="http://www.atlassian.com/">Atlassian</a></div>
        </div>
    </footer>
</div>
</body>
</html>
