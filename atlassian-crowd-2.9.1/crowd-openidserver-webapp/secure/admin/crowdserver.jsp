<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="/struts-tags" prefix="ww" %>
<html>
    <head>
        <title><ww:property value="getText('crowdserver.label')"/></title>
        <meta name="section" content="administration" />
        <meta name="subsection" content="generalconfiguration" />
    </head>

    <body>

        <div class="crowdForm">

        <h2><ww:property value="getText('crowdserver.label')"/></h2>

        <div class="formBody">

        <ww:include value="/include/generic_errors.jsp"/>

            <div class="titleSection">
                <ww:text name="crowdserver.text"/>
            </div>

            <div class="fieldArea required">
                <label class="fieldLabelArea" for="applicationName">
                    <ww:property value="getText('crowdserver.application.label')"/>
                </label>
                <div class="fieldValueArea" id="applicationName">
                    <ww:property value="application"/>
                </div>
            </div>

            <div class="fieldArea required">
                <label class="fieldLabelArea" for="crowdServerLocation">
                    <ww:property value="getText('crowdserver.address.label')"/>
                </label>
                <div class="fieldValueArea" id="crowdServerLocation">
                    <ww:property value="serverURL"/>
                </div>
            </div>
        </div>



        </div>



    </body>
</html>
