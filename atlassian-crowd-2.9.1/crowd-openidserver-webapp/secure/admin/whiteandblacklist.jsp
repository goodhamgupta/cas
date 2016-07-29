<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="/struts-tags" prefix="ww" %>
<html>
    <head>
        <title><ww:text name="trusts.label"/></title>

        <meta name="section" content="administration"/>
        <meta name="subsection" content="trustrelationships"/>

        <script>

            function submitListChange()
            {
                document.updatetrustrelationships.submit();
            }

        </script>

    </head>

    <body>

        <div class="crowdForm">

            <h2><ww:text name="trusts.label"/></h2>
            
            <div class="formBodyNoTop">
                <ww:include value="/include/generic_errors.jsp"/>
            </div>

            <form method="post" action="<ww:url namespace="/secure/admin" action="updatetrustrelationships" includeParams="none" />" name="updatetrustrelationships">

            <ww:hidden name="%{xsrfTokenName}" value="%{xsrfToken}"/>

            <div class="titleSection">
                <ww:text name="trusts.trustsoptions.label"/>
            </div>

            <div class="formBodyNoTop">

                <div id="trustTypeSelector">
                <ww:fielderror><ww:param>trustRelationshipType</ww:param></ww:fielderror>
                <ww:radio list="trustTypes" name="trustType" listKey="key" listValue="value" onclick="submitListChange(); return true;">
                    <ww:param name="label" value="getText('trusts.restriction.type.label')"/>

                    <ww:param name="description">
                        <ww:property value="getText('trusts.restriction.type.description')"/>
                    </ww:param>
                </ww:radio>

                </div>

            </div>

            </form>

            <ww:if test="trustType != 0">

            <div id="addressrestrictions">


                <div class="titleSection">
                    
                <ww:if test="trustType == 1">
                    <ww:property value="getText('whitelisthost.label')"/>
                </ww:if>
                <ww:else>
                    <ww:property value="getText('blacklisthost.label')"/>
                </ww:else>
                </div>


                <table id="addressesTable" class="formTable">
                    <tr>
                        <th width="64%">
                            <ww:property value="getText('address.label')"/>
                        </th>
                        <th width="18%">
                            <ww:property value="getText('action.label')"/>
                        </th>
                    </tr>




                    <ww:iterator value="addresses" status="rowstatus">

                        <ww:if test="#rowstatus.odd == true">
                            <tr class="odd">
                        </ww:if>
                        <ww:else>
                            <tr class="even">
                        </ww:else>

                        <td>
                            <ww:property value="address"/>
                        </td>

                        <td>
                            <a href="<ww:url namespace="/secure/admin" action="removetrustrelationshiphost" method="removeAddress" includeParams="none" ><ww:param name="address" value="address" /><ww:param name="%{xsrfTokenName}" value="%{xsrfToken}" /></ww:url>"
                               title="<ww:property value="getText('remove.label')"/>" id="remove-<ww:property value="#rowstatus.index"/>">
                                <ww:property value="getText('remove.label')"/>
                            </a>
                        </td>

                        </tr>

                    </ww:iterator>

                </table>

                <form method="post" action="<ww:url namespace="/secure/admin" action="addtrustrelationshiphost" method="addAddress" includeParams="none" />" name="addtrustrelationshiphost">

                <ww:hidden name="%{xsrfTokenName}" value="%{xsrfToken}"/>

                <div class="formFooter wizardFooter">
                    <div class="buttons">
                        <ww:fielderror><ww:param>address</ww:param></ww:fielderror>
                        Address:&nbsp;<input id="address" type="text" name="address" size="20" style="width: 200px;" value=""/>&nbsp;
                        <input type="submit" class="button" value="<ww:property value="getText('add.label')"/> &raquo;" />
                    </div>
                </div>

                </form>

            </div>

            </ww:if>

        </div>

    </body>
</html>
