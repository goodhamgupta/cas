<%@ page import="com.atlassian.plugin.webresource.UrlMode" %>
<%@ page import="com.atlassian.plugin.webresource.WebResourceManager" %>
<%@ page import="com.atlassian.spring.container.ContainerManager" %>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator" %>
<%@ taglib uri="/struts-tags" prefix="ww" %>
<!DOCTYPE html>
<html lang="en">
<ww:i18n name="com.atlassian.crowd.console.action.BaseAction">
<ww:push value="@com.atlassian.spring.container.ContainerManager@getComponent('actionHelper')">
<head>
    <decorator:usePage id="sitemeshPage"/>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=EDGE">
    <title><ww:text name="application.title"/> - <decorator:title/></title>
    <link rel="shortcut icon" href="<ww:url value='%{#attr.sitemeshPage.getProperty("meta.favicon") or "/console/favicon.ico"}' />">

    <%
        WebResourceManager manager = (WebResourceManager) ContainerManager.getComponent("webResourceManager");
        manager.requireResourcesForContext("atl.admin");
        manager.includeResources(out, UrlMode.AUTO);
    %>
    <decorator:head/>
    <script>
        // Sets the help link. Called from tabbed pages to change the help link when different tabs are selected.
        function setHelpLink(helpHref) {
            document.getElementById('helpLink').href = '<ww:text name="help.prefix"/>' + helpHref;
        }
    </script>
</head>

<body class='<ww:property value='#attr.sitemeshPage.getProperty("meta.bodyCssClass")' />'>
    <div id="page">
        <header id="header" role="banner">
            <nav class="aui-header aui-dropdown2-trigger-group" role="navigation">
                <div class="aui-header-inner">
                    <div class="aui-header-primary">
                        <h1 id="logo" class="aui-header-logo aui-header-logo-crowd"><a href="<ww:url value="/" includeParams="none" />"><span class="aui-header-logo-device">Crowd</span></a></h1>
                        <ul class="aui-nav">
                            <ww:if test="sysAdmin == true ">
                                <ww:iterator value="getWebSectionsForLocation('navigation.top')">
                                    <ww:iterator value="getWebItemsForSection(key)">
                                        <li><a  id="<ww:property value="link.id"/>" href="<ww:property value="getDisplayableLink(link)"/>"  title="<ww:property value="getText(webLabel.key)"/>">
                                            <ww:property value="getText(webLabel.key)"/>
                                        </a></li>
                                    </ww:iterator>
                                </ww:iterator>
                            </ww:if>
                        </ul>
                    </div>
                </div><!-- .aui-header-inner-->
                <div class="aui-header-secondary">
                    <ul class="aui-nav">
                        <li>
                            <a id="helpLink" href="<ww:text name="help.prefix"/><ww:property value="#attr.sitemeshPage.getProperty('meta.help.url')"/>" target="_crowdhelp">
                                <span class="aui-icon aui-icon-small aui-iconfont-help"><ww:text name="menu.documentation.label"/></span>
                            </a>
                        </li>
                        <ww:if test="sysAdmin == true">
                            <li id="system-admin-menu">
                                <a href="<ww:url action="general"/>" id="admin_menu" class="aui-nav-link aui-dropdown2-trigger" aria-haspopup="true" aria-owns="system-admin-menu-content" title="<ww:property value="getText('menu.administration.title')"/>"><span class="aui-icon aui-icon-small aui-iconfont-configure"><ww:property value="getText('menu.administration.title')"/></span></a>
                                <div id="system-admin-menu-content" class="aui-dropdown2 aui-style-default">
                                    <ww:iterator value="getWebSectionsForLocationAndSection('left','administration')">
                                        <div class="aui-dropdown2-section">
                                            <%-- section title goes here. Crowd only has one section, hence no need to display it --%>
                                            <ul class="aui-list-truncate">
                                                <ww:iterator value="getWebItemsForSection(key)">
                                                    <li><a  id="<ww:property value="link.id"/>" href="<ww:property value="getDisplayableLink(link)"/>"  title="<ww:property value="getText(webLabel.key)"/>">
                                                        <ww:property value="getText(webLabel.key)"/>
                                                    </a></li>
                                                </ww:iterator>
                                            </ul>
                                        </div>
                                    </ww:iterator>
                                </div>
                            </li>
                        </ww:if>
                        <ww:if test="authenticated == true">
                            <li>
                                <a aria-owns="user-dropdown" class="aui-dropdown2-trigger">
                                    <div class="aui-avatar aui-avatar-small" id="current-user" data-displayname="<ww:property value="userName"/>">
                                        <div class="aui-avatar-inner">
                                            <ww:if test="smallAvatarUrl != null">
                                              <img src='<ww:property value="smallAvatarUrl"/>' alt='<ww:property value="userName"/>'>
                                            </ww:if>
                                            <ww:else>
                                              <span class="aui-icon aui-icon-small aui-iconfont-user"><ww:property value="userName"/></span>
                                            </ww:else>
                                        </div>
                                    </div>
                                </a>
                                <div class="aui-dropdown2 aui-style-default aui-dropdown2-in-header" id="user-dropdown" aria-hidden="true">
                                    <div class="aui-dropdown2-section">
                                        <ul>
                                            <ww:if test="sysAdmin == true">
                                                <li><a href="<ww:url namespace="/console/user" action="viewprofile" includeParams="none"/>"><ww:text name="menu.profile.label"/></a></li>
                                            </ww:if>
                                            <li><a href="<ww:url namespace="/console" action="logoff" includeParams="none"/>"><ww:text name="menu.logout.label"/></a></li>
                                        </ul>
                                    </div>
                                </div>
                            </li>
                        </ww:if>
                    </ul>
                </div>
            </nav><!-- .aui-header -->
        </header>

        <section id="content" role="main">
            <div class="aui-page-panel">
                <div class="aui-page-panel-inner">
                    <ww:if test="!getWebSectionsForLocation('left').empty">
                        <div class="aui-page-panel-nav">
                            <nav id="admin-menu" class="aui-navgroup aui-navgroup-vertical">
                                <div class="aui-navgroup-inner">
                                    <ww:iterator value="getWebSectionsForLocation('left')" status="webSectionCount">
                                        <ww:if test="!getText(webLabel.key).empty">
                                            <div class="aui-nav-heading">
                                                <strong><ww:property value="getText(webLabel.key)"/></strong>
                                            </div>
                                        </ww:if>
                                        <ul class="aui-nav">
                                            <ww:iterator value="getWebItemsForSection(key)" status="webItemCount">
                                                <li id="lhstab<ww:property value="#webSectionCount.index+1"/>-<ww:property value="#webItemCount.index+1"/>"<ww:if test='key.equals(#attr.sitemeshPage.getProperty("meta.pagename"))'> class="aui-nav-selected"</ww:if>>
                                                    <a id="<ww:property value="link.id"/>" href="<ww:property value="getDisplayableLink(link)"/>"><ww:property value="getText(webLabel.key)"/></a>
                                                </li>
                                            </ww:iterator>
                                        </ul>
                                    </ww:iterator>
                                </div>
                            </nav>
                        </div>
                    </ww:if>
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
                <ww:if test="licenseExpired == true || evaluation == true">
                    <div class="aui-message error">
                        <p class="title">
                            <!-- evaluation -->
                            <ww:if test="evaluation == true">
                                <ww:if test="licenseExpired == true"><ww:text name="license.evaluationexpired"/></ww:if>
                                <ww:else><ww:text name="license.runningevaluation"/></ww:else>
                            </ww:if>
                            <!-- subscription -->
                            <ww:elseif test="subscription == true">
                                <ww:if test="licenseExpired == true && withinGracePeriod == false"><ww:text name="license.runningsubscription.expired"/></ww:if>
                                <ww:elseif test="licenseExpired == true && withinGracePeriod == true">
                                    <ww:text name="license.runningsubscription.graceperiod">
                                        <ww:param name="value0" value="license.numberOfDaysBeforeGracePeriodExpiry" />
                                    </ww:text>
                                </ww:elseif>
                            </ww:elseif>
                            <!-- other licenses -->
                            <ww:else>
                                <ww:if test="licenseExpired == true"><ww:text name="license.expired"/></ww:if>
                            </ww:else>
                        </p>
                        <span class="aui-icon icon-error"></span>
                    </div>
                </ww:if>
                <ul>
                    <li><a href="https://jira.atlassian.com/browse/CWD"><ww:text name="support.bug"/></a></li>
                    <li><a href="https://jira.atlassian.com/browse/CWD"><ww:text name="support.feature"/></a></li>
                    <li><a href="<ww:url value="/about.jsp"/>"><ww:text name="about.link"/></a></li>
                    <li><a href="https://www.atlassian.com/about/contact.jsp"><ww:text name="support.contact"/></a></li>
                </ul>
                <div id="footer-logo"><a href="https://www.atlassian.com/">Atlassian</a></div>
            </div>
        </footer>
    </div>
</body>
</ww:push>
</ww:i18n>
</html>
