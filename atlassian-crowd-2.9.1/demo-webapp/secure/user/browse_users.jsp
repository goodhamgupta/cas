<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="/struts-tags" prefix="ww" %>
<html>
    <head>
        <title><ww:property value="getText('browser.user.title')"/></title>
        <meta name="section" content="users" />
    </head>
    <body>


    <p class="headingInfo">
        <a href="<ww:url namespace="/secure/user" action="adduser" method="default" includeParams="none"/>">
            <ww:property value="getText('menu.adduser.label')"/>
        </a>
    </p>

    <h2>
        <ww:property value="getText('browser.user.title')"/>
    </h2>

    <div class="page-content">

        <ww:if test="actionErrors">
            <ww:iterator value="actionErrors">
                <p class="error">
                    <ww:property/>
                    <br/>
                </p>
            </ww:iterator>
        </ww:if>

        <form method="post" action="<ww:url namespace="/secure/user" action="browseusers" includeParams="none"/>">

            <p class="miniform">

                <ww:property value="getText('user.name.label')"/>
                :&nbsp;<input type="text" name="name" size="15" value="<ww:property value="name" />"/>

                &nbsp;&nbsp;

                <ww:property value="getText('user.email.label')"/>
                :&nbsp;<input type="text" name="email" size="15" value="<ww:property value="email" />"/>

                &nbsp;&nbsp;

                <ww:property value="getText('user.active.label')"/>
                :&nbsp;
                <select name="active" style="width: 100px;">
                    <option value="">
                        <ww:property value="getText('all.label')"/>
                    </option>
                    <option value="true"
                            <ww:if test="active == 'true'">selected</ww:if>
                            >
                        <ww:property value="getText('active.label')"/>
                    </option>
                    <option value="false"
                            <ww:if test="active == 'false'">selected</ww:if>
                            >
                        <ww:property value="getText('inactive.label')"/>
                    </option>
                </select>

                <p/>

                <ww:property value="getText('browser.resultsperpage.label')"/>
                :
                <select name="resultsPerPage" style="width: 50px;">
                    <option value="10"
                            <ww:if test="resultsPerPage == 10">selected</ww:if>
                            >10
                    </option>
                    <option value="20"
                            <ww:if test="resultsPerPage == 20">selected</ww:if>
                            >20
                    </option>
                    <option value="50"
                            <ww:if test="resultsPerPage == 50">selected</ww:if>
                            >50
                    </option>
                    <option value="100"
                            <ww:if test="resultsPerPage == 100">selected</ww:if>
                            >100
                    </option>
                </select>
            </p>

            <p style="text-align: center;">
                <input type="submit" class="button" value="<ww:property value="getText('browser.filter.label')"/>"/>
                <input type="reset" class="button" value="<ww:property value="getText('browser.resetfilter.label')"/>" onclick="location.href='<ww:url namespace="/secure/user" action="browseusers" includeParams="none" />';">
            </p>

        </form>

        <table>
            <tr>
                <th width="35%">
                    <ww:property value="getText('user.name.label')"/>
                </th>
                <th width="55%">
                    <ww:property value="getText('user.email.label')"/>
                </th>
                <th width="10%">
                    <ww:property value="getText('browser.action.label')"/>
                </th>
            </tr>

            <ww:iterator value="results" status="rowstatus">
                <ww:if test="#rowstatus.count <= resultsPerPage">
                    <ww:if test="#rowstatus.odd == true"><tr class="odd"></ww:if>
                    <ww:else><tr class="even"></ww:else>
                    <td valign="top">
                        <ww:property value="name"/>
                    </td>
                    <td valign="top">
                        <ww:property value="emailAddress"/>
                    </td>
                    <td valign="top">
                        <a href="<ww:url namespace="/secure/user" action="viewuser" method="default" includeParams="none" ><ww:param name="name" value="name"/><ww:param name="directoryID" value="[1].directoryID" /></ww:url>"
                           title="<ww:property value="getText('browser.view.label')"/>">
                            <ww:property value="getText('browser.view.label')"/>
                        </a>
                    </td>
                    </tr>
                </ww:if>
            </ww:iterator>

        </table>

        <ww:if test="resultsStart != 0 || results.size > resultsPerPage">
            <table class="pager">
                <tr class="pager">
                    <td align="left" width="50%" class="pager">
                        <ww:if test="resultsStart != 0">
                            <a href="javascript: document.previous.submit()">&laquo;
                                <ww:property value="getText('previous.label')"/>
                            </a>
                        </ww:if>
                    </td>
                    <td align="right" width="50%" class="pager">
                        <ww:if test="results.size > resultsPerPage">
                            <a href="javascript: document.next.submit()">
                                <ww:property value="getText('next.label')"/> &raquo;</a>
                        </ww:if>
                    </td>
                </tr>
            </table>
        </ww:if>

        <form name="next" method="post" action="<ww:url namespace="/secure/user" action="browseusers" includeParams="none" />">
            <input type="hidden" name="ID" value="<ww:property value="ID" />"/>
            <input type="hidden" name="directoryID" value="<ww:property value="directoryID" />"/>
            <input type="hidden" name="name" value="<ww:property value="name" />"/>
            <input type="hidden" name="email" value="<ww:property value="email" />"/>
            <input type="hidden" name="active" value="<ww:property value="active" />"/>
            <input type="hidden" name="resultsStart" value="<ww:property value="nextResultsStart" />"/>
            <input type="hidden" name="resultsPerPage" value="<ww:property value="resultsPerPage" />"/>
        </form>

        <form name="previous" method="post" action="<ww:url namespace="/secure/user" action="browseusers" includeParams="none" />">
            <input type="hidden" name="ID" value="<ww:property value="ID" />"/>
            <input type="hidden" name="directoryID" value="<ww:property value="directoryID" />"/>
            <input type="hidden" name="name" value="<ww:property value="name" />"/>
            <input type="hidden" name="email" value="<ww:property value="email" />"/>
            <input type="hidden" name="active" value="<ww:property value="active" />"/>
            <input type="hidden" name="resultsStart" value="<ww:property value="previousResultsStart" />"/>
            <input type="hidden" name="resultsPerPage" value="<ww:property value="resultsPerPage" />"/>
        </form>
    </div>

    </body>
</html>
