<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="/struts-tags" prefix="ww" %>
<html>
<head>
    <title><ww:text name="systeminfo.title"/></title>
    <meta name="section" content="administration" />
    <meta name="pagename" content="systeminfo" />
    <meta name="help.url" content="<ww:property value="getText('help.admin.systeminfo')"/>"/>
</head>

<body>
<form class="aui">
    <h2><ww:text name="systeminfo.title"/></h2>
    <ww:component template="form_row.jsp">
        <ww:param name="label" value="getText('systeminfo.date.label')" />
        <ww:param name="value">
            <ww:date format="EEEE, dd MMM yyyy" name="systemTime"/>
        </ww:param>
        <ww:param name="escapeValue" value="false" />
    </ww:component>

    <ww:component template="form_row.jsp">
        <ww:param name="label" value="getText('systeminfo.time.label')" />
        <ww:param name="value">
            <ww:date format="HH:mm:ss" name="systemTime"/>
        </ww:param>
        <ww:param name="escapeValue" value="false" />
    </ww:component>

    <ww:component template="form_row.jsp">
        <ww:param name="label" value="getText('systeminfo.timezone.label')" />
        <ww:param name="value" value="timeZone" />
    </ww:component>

    <ww:component template="form_row.jsp">
        <ww:param name="label" value="getText('systeminfo.javaversion.label')" />
        <ww:param name="value" value="javaVersion"/>
    </ww:component>

    <ww:component template="form_row.jsp">
        <ww:param name="label" value="getText('systeminfo.javavendor.label')" />
        <ww:param name="value" value="javaVendor"/>
    </ww:component>

    <ww:component template="form_row.jsp">
        <ww:param name="label" value="getText('systeminfo.jvmversion.label')" />
        <ww:param name="value" value="javaVMVersion"/>
    </ww:component>

    <ww:component template="form_row.jsp">
        <ww:param name="label" value="getText('systeminfo.jvmvendor.label')" />
        <ww:param name="value" value="javaVMVendor"/>
    </ww:component>

    <ww:component template="form_row.jsp">
        <ww:param name="label" value="getText('systeminfo.jvm.label')" />
        <ww:param name="value" value="javaRuntime"/>
    </ww:component>

    <ww:component template="form_row.jsp">
        <ww:param name="label" value="getText('systeminfo.jvmlocale.label')" />
        <ww:param name="value" value="javaLocale"/>
    </ww:component>

    <ww:component template="form_row.jsp">
        <ww:param name="label" value="getText('systeminfo.username.label')" />
        <ww:param name="value" value="applicationUsername"/>
    </ww:component>

    <ww:component template="form_row.jsp">
        <ww:param name="label" value="getText('systeminfo.os.label')" />
        <ww:param name="value" value="operatingSystem"/>
    </ww:component>

    <ww:component template="form_row.jsp">
        <ww:param name="label" value="getText('systeminfo.architecture.label')" />
        <ww:param name="value" value="architecture"/>
    </ww:component>

    <ww:component template="form_row.jsp">
        <ww:param name="label" value="getText('systeminfo.fileencoding.label')" />
        <ww:param name="value" value="fileEncoding"/>
    </ww:component>

    <h2><ww:property value="getText('systeminfo.crowd.label')"/></h2>
    <ww:component template="form_row.jsp">
        <ww:param name="valueid" value="'home-path'"/>
        <ww:param name="label" value="getText('systeminfo.home.label')" />
        <ww:param name="value" value="crowdHome"/>
    </ww:component>

    <h2><ww:property value="getText('systeminfo.statistics.label')"/></h2>
    <ww:component template="form_row.jsp">
        <ww:param name="label" value="getText('systeminfo.totalmemory.label')" />
        <ww:param name="value" value="totalMemory"/>
    </ww:component>

    <ww:component template="form_row.jsp">
        <ww:param name="label" value="getText('systeminfo.usedmemory.label')" />
        <ww:param name="value" value="usedMemory"/>
    </ww:component>

    <ww:component template="form_row.jsp">
        <ww:param name="label" value="getText('systeminfo.freememory.label')" />
        <ww:param name="value" value="freeMemory"/>
    </ww:component>

    <h2><ww:property value="getText('systeminfo.database.label')"/></h2>
    <ww:if test="databaseDatasource">
        <ww:component template="form_row.jsp">
            <ww:param name="label" value="getText('systeminfo.datasource.jndi.label')" />
            <ww:param name="value" value="databaseDatasourceJndiName" />
        </ww:component>
    </ww:if>
    <ww:else>
        <ww:component template="form_row.jsp">
            <ww:param name="label" value="getText('systeminfo.jdbc.url.label')" />
            <ww:param name="value" value="databaseJdbcUrl" />
        </ww:component>

        <ww:component template="form_row.jsp">
            <ww:param name="label" value="getText('systeminfo.jdbc.driver.label')" />
            <ww:param name="value" value="databaseJdbcDriver" />
        </ww:component>

        <ww:component template="form_row.jsp">
            <ww:param name="label" value="getText('systeminfo.jdbc.username.label')" />
            <ww:param name="value" value="databaseJdbcUsername" />
        </ww:component>
    </ww:else>

    <ww:component template="form_row.jsp">
        <ww:param name="label" value="getText('systeminfo.hibernate.dialect.label')" />
        <ww:param name="value" value="databaseHibernateDialect" />
    </ww:component>

    <h2><ww:property value="getText('systeminfo.runtimeinfo.label')"/></h2>
    <ww:component template="form_row.jsp">
        <ww:param name="label" value="getText('systeminfo.appserver.label')" />
        <ww:param name="value" value="applicationServer" />
    </ww:component>

    <ww:component template="form_row.jsp">
        <ww:param name="label" value="getText('systeminfo.serverstartdate.label')" />
        <ww:param name="value">
            <ww:date format="EEEE, dd MMM yyyy HH:mm:ss" name="serverStartTime"/>
        </ww:param>
        <ww:param name="escapeValue" value="false" />
    </ww:component>

    <ww:component template="form_row.jsp">
        <ww:param name="label" value="getText('systeminfo.version.label')" />
        <ww:param name="value" value="@com.atlassian.crowd.util.build.BuildUtils@BUILD_VERSION"/>
    </ww:component>

    <ww:component template="form_row.jsp">
        <ww:param name="label" value="getText('systeminfo.buildversion.label')" />
        <ww:param name="value" value="@com.atlassian.crowd.util.build.BuildUtils@BUILD_NUMBER"/>
    </ww:component>

    <ww:component template="form_row.jsp">
        <ww:param name="label" value="getText('systeminfo.builddate.label')" />
        <ww:param name="value" value="@com.atlassian.crowd.util.build.BuildUtils@BUILD_DATE"/>
    </ww:component>

    <h2><ww:property value="getText('systeminfo.license.title')"/></h2>
    <ww:component template="form_row.jsp">
        <ww:param name="label" value="getText('systeminfo.serverid.label')" />
        <ww:param name="value" value="serverId" />
    </ww:component>

    <h2><ww:property value="getText('systeminfo.supportinfo.title')"/></h2>
    <ww:textarea name="supportInformation" rows="8" cols="60" readonly="true">
        <ww:param name="label" value="getText('systeminfo.supportinfo.label')"/>
        <ww:param name="fieldWidth" value="'long'"/>
    </ww:textarea>
</form>
</body>
</html>
