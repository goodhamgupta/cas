<%@ page pageEncoding='utf-8' %>
<%@ taglib uri="/struts-tags" prefix="ww" %>
<html>
<head>
    <title><ww:text name="database.title"/></title>
    <meta name="help.url" content="<ww:property value="getText('help.setup.database')"/>"/>
    <script>
        // javascript show/hide divs
        function clickEmbedded() {
            document.getElementById('jdbcConfigDiv').style.display = 'none';
            document.getElementById('datasourceConfigDiv').style.display = 'none';
        }
        function clickJDBC() {
            document.getElementById('jdbcConfigDiv').style.display = 'block';
            document.getElementById('datasourceConfigDiv').style.display = 'none';
        }
        function clickDatasource() {
            document.getElementById('jdbcConfigDiv').style.display = 'none';
            document.getElementById('datasourceConfigDiv').style.display = 'block';
        }
        function autoClick() {
            var $dbType = AJS.$('input[name="databaseOption"]').filter(':checked');
            switch ($dbType.val()) {
                case '<ww:property value="jdbcValue"/>':
                    clickJDBC();
                    break;
                case '<ww:property value="datasourceValue"/>':
                    clickDatasource();
                    break;
                default:
                    clickEmbedded();
                    break;
            }
        }

        AJS.$(function ($) {
            $('input[name="databaseOption"]').click(autoClick);
            autoClick();
        });

        // javascript data for prepopulation
        var drivers = [];
        var jdbcurls = [];
        var dialects = [];

        <ww:iterator value="databaseList">
            <ww:set name="dbDetails" value="getDatabaseDetails(key)"/>
            drivers['<ww:property value="key"/>'] = '<ww:property value="#dbDetails.driverClassName"/>';
            jdbcurls['<ww:property value="key"/>'] = '<ww:property value="#dbDetails.databaseUrl" escape="false"/>';
            dialects['<ww:property value="key"/>'] = '<ww:property value="#dbDetails.dialect"/>';
        </ww:iterator>

        // javascript methods to perform prepopulation
        function prepopulateJdbc() {
            var selectedDatabase = document.getElementById('jdbcDatabaseType').value;
            document.getElementById('jdbcDriverClassName').value  = drivers[selectedDatabase];
            document.getElementById('jdbcUrl').value              = jdbcurls[selectedDatabase];
            document.getElementById('jdbcHibernateDialect').value = dialects[selectedDatabase];
        }
        function prepopulateDatasource() {
            var selectedDatabase = document.getElementById('datasourceDatabaseType').value;
            document.getElementById('datasourceHibernateDialect').value = dialects[selectedDatabase];
        }
    </script>
</head>
<body>


<h2><ww:text name="database.title"/></h2>
<p>
    <ww:if test="upgradeFromExistingDatabase">
        <ww:text name="database.upgrade.text"/>
    </ww:if>
    <ww:else>
        <ww:text name="database.text"/>
    </ww:else>
</p>
<form method="post" action="<ww:url namespace="/console/setup" action="setupdatabase" method="update" />" name="database" class="aui">
    <ww:component template="setup_messages.jsp"/>

    <ww:radio name="databaseOption" list="databaseOptions" listKey="key" listValue="value">
        <ww:param name="listDescription" value="'description'"/>
    </ww:radio>

    <fieldset class="group" id="jdbcConfigDiv">
        <ww:select name="jdbcDatabaseType" list="databaseList" listKey="key" listValue="value" onchange="prepopulateJdbc();">
            <ww:param name="label">
                <ww:text name="database.select.label"/>
            </ww:param>
            <ww:param name="description">
                <ww:text name="database.select.description"/>
            </ww:param>
            <ww:param name="required" value="true"/>
        </ww:select>

        <ww:textfield name="jdbcDriverClassName">
            <ww:param name="label">
                <ww:text name="database.driver.label"/>
            </ww:param>
            <ww:param name="description">
                <ww:text name="database.driver.description"/>
            </ww:param>
            <ww:param name="required" value="true"/>
            <ww:param name="fieldWidth" value="'long'"/>
        </ww:textfield>

        <ww:textfield name="jdbcUrl">
            <ww:param name="label">
                <ww:text name="database.jdbc.url.label"/>
            </ww:param>
            <ww:param name="description">
                <ww:text name="database.jdbc.url.description"/>
            </ww:param>
            <ww:param name="required" value="true"/>
            <ww:param name="fieldWidth" value="'long'"/>
        </ww:textfield>

        <ww:textfield name="jdbcUsername">
            <ww:param name="label">
                <ww:text name="database.username.label"/>
            </ww:param>
            <ww:param name="description">
                <ww:text name="database.username.description"/>
            </ww:param>
            <ww:param name="required" value="true"/>
        </ww:textfield>

        <ww:textfield name="jdbcPassword">
            <ww:param name="label">
                <ww:text name="database.password.label"/>
            </ww:param>
            <ww:param name="description">
                <ww:text name="database.password.description"/>
            </ww:param>
        </ww:textfield>

        <ww:textfield name="jdbcHibernateDialect">
            <ww:param name="label">
                <ww:text name="database.dialect.label"/>
            </ww:param>
            <ww:param name="description">
                <ww:text name="database.dialect.description"/>
            </ww:param>
            <ww:param name="required" value="true"/>
            <ww:param name="fieldWidth" value="'long'"/>
        </ww:textfield>

        <ww:if test="!upgradeFromExistingDatabase">
            <ww:checkbox name="jdbcOverwriteData">
                <ww:param name="label">
                    <ww:text name="database.overwrite.label"/>
                </ww:param>
                <ww:param name="description">
                    <ww:text name="database.overwrite.description"/>
                </ww:param>
                <ww:param name="group" value="false" />
            </ww:checkbox>
        </ww:if>
    </fieldset>

    <fieldset class="group" id="datasourceConfigDiv">
        <ww:select name="datasourceDatabaseType" list="databaseList" listKey="key" listValue="value" onchange="prepopulateDatasource();">
            <ww:param name="label">
                <ww:text name="database.select.label"/>
            </ww:param>
            <ww:param name="description">
                <ww:text name="database.select.description"/>
            </ww:param>
            <ww:param name="required" value="true"/>
        </ww:select>
        <ww:textfield name="datasourceJndiName">
            <ww:param name="label">
                <ww:text name="database.jndi.label"/>
            </ww:param>
            <ww:param name="description">
                <ww:text name="database.jndi.description"/>
            </ww:param>
            <ww:param name="required" value="true"/>
            <ww:param name="fieldWidth" value="'long'"/>
        </ww:textfield>
        <ww:textfield name="datasourceHibernateDialect">
            <ww:param name="label">
                <ww:text name="database.dialect.label"/>
            </ww:param>
            <ww:param name="description">
                <ww:text name="database.dialect.description"/>
            </ww:param>
            <ww:param name="required" value="true"/>
            <ww:param name="fieldWidth" value="'long'"/>
        </ww:textfield>
        <ww:if test="!upgradeFromExistingDatabase">
            <ww:checkbox name="datasourceOverwriteData">
                <ww:param name="label">
                    <ww:text name="database.overwrite.label"/>
                </ww:param>
                <ww:param name="description">
                    <ww:text name="database.overwrite.description"/>
                </ww:param>
                <ww:param name="group" value="false" />
            </ww:checkbox>
        </ww:if>
    </fieldset>

    <div class="buttons-container">
        <div class="buttons">
            <input type="submit" class="aui-button aui-button-primary" value="<ww:property value="getText('continue.label')"/>"/>
        </div>
    </div>
</form>

</body>
</html>
