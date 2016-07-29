<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="/struts-tags" prefix="ww" %>
<html>
    <head>
        <title><ww:property value="getText('profiles.title')"/></title>
        <meta name="section" content="home" />
        <meta name="subsection" content="myprofiles" />
                                                  
<script>

    /***************************************************************
     *
     *  Javascript
     *
     ***************************************************************/

    // take the user to the selected profile
    function profileChange()
    {
        var select_menu = document.getElementById('profileID');
        var profile_id = select_menu.options[select_menu.selectedIndex].value;
        location.href = '<ww:url namespace="/secure/profile" action="editprofiles" includeParams="none"/>?profileID='+profile_id;
    }

</script>

    </head>

    <body>

        <form method="post" action="<ww:url namespace="/secure/profile" action="editprofiles" method="update" includeParams="none"/>" name="editprofiles">

                <ww:hidden name="%{xsrfTokenName}" value="%{xsrfToken}"/>

                <div class="crowdForm">

                <h2><ww:property value="getText('profiles.title')"/></h2>

                <ww:include value="/include/generic_errors.jsp"/>

                <!-- PROFILE SELECTION -->

                <div class="titleSection">
                    <ww:property value="getText('profiles.select.title')"/>
                </div>

                <ww:select id="profileID" name="profileID" list="profiles" value="currentProfile.id" onchange="profileChange();" cssClass="profile">
                    <ww:param name="label" value="getText('profiles.select.label')"/>
                </ww:select>

                <ww:if test="!defaultProfile && currentProfile.id != -1">
                    <div style="float: right; position: relative; right: 290px; top: -32px;">
                        <a href="<ww:url namespace="/secure/profile" action="editprofiles" method="makeDefault" includeParams="none"><ww:param name="profileID" value="profileID"/><ww:param name="%{xsrfTokenName}" value="%{xsrfToken}"/></ww:url>"><ww:text name="profiles.makedefault.label"/></a>
                    </div>
                </ww:if>

                <!-- PROFILE FIELDS -->

                <div class="titleSection">
                    <ww:property value="getText('profiles.update.title')"/>
                </div>

                <div class="formBodyNoTop">

                    <!-- display profile name textfield if 'New Profile' is selected -->
                    <ww:if test="profileID == -1">
                        <ww:textfield name="profileName">
                            <ww:param name="label" value="getText('profiles.name.label')"/>
                            <ww:param name="required" value="true"/>
                            <ww:param name="description" value="getText('profiles.name.description')"/>
                        </ww:textfield>
                    </ww:if>
                    <ww:else>
                        <div class="fieldArea required">
                            <label class="fieldLabelArea" for="profileName">
                                <ww:property value="getText('profiles.name.label')"/>
                            </label>
                            <div class="fieldValueArea" id="profileName">
                                <ww:property value="currentProfile.name"/>
                            </div>
                        </div>
                    </ww:else>

                    <ww:textfield name="nickname">
                        <ww:param name="label" value="getText('sreg.nickname.label')"/>
                        <ww:param name="description" value="getText('profiles.nickname.description')"/>
                    </ww:textfield>

                    <ww:textfield name="fullName" cssClass="profile">
                        <ww:param name="label" value="getText('sreg.fullname.label')"/>
                    </ww:textfield>
                    
                    <ww:textfield name="email" cssClass="profile">
                        <ww:param name="label" value="getText('sreg.email.label')"/>
                    </ww:textfield>

                    <!-- custom DOB field -->
                    <div class="fieldArea required">
                        <label class="fieldLabelArea">
                            <ww:text name="sreg.dob.label"/>:
                        </label>
                        <div class="fieldValueArea">
                            <select name="dobDay" id="dobDay">
                                <ww:iterator value="profileAttributesHelper.days">
                                    <option value="<ww:property value="key"/>" <ww:if test="dobDay == key">selected="selected"</ww:if>>
                                        <ww:property value="value"/>
                                    </option>
                                </ww:iterator>
                            </select>
                            <select name="dobMonth" id="dobMonth">
                                <ww:iterator value="profileAttributesHelper.months">
                                    <option value="<ww:property value="key"/>" <ww:if test="dobMonth == key">selected="selected"</ww:if>>
                                        <ww:property value="value"/>
                                    </option>
                                </ww:iterator>
                            </select>
                            <select name="dobYear" id="dobYear">
                                <ww:iterator value="profileAttributesHelper.years">
                                    <option value="<ww:property value="key"/>" <ww:if test="dobYear == key">selected="selected"</ww:if>>
                                        <ww:property value="value"/>
                                    </option>
                                </ww:iterator>
                            </select>
                        </div>
                        <div class="fieldDescription">
                            <ww:text name="sreg.dob.description"/>             
                        </div>
                    </div>

                    <ww:select list="profileAttributesHelper.genders" name="gender">
                        <ww:param name="label" value="getText('sreg.gender.label')"/>
                    </ww:select>

                    <ww:textfield name="postcode">
                        <ww:param name="label" value="getText('sreg.postcode.label')"/>
                    </ww:textfield>

                    <ww:select list="profileAttributesHelper.countries" name="country">
                        <ww:param name="label" value="getText('sreg.country.label')"/>
                    </ww:select>

                    <ww:select list="profileAttributesHelper.timezones" name="timezone">
                        <ww:param name="label" value="getText('sreg.timezone.label')"/>
                    </ww:select>

                    <ww:select list="profileAttributesHelper.languages" name="language">
                        <ww:param name="label" value="getText('sreg.language.label')"/>
                    </ww:select>

                </div>

                <div class="formFooter wizardFooter">
                    <div class="buttons">
                        <input type="submit" class="button" value="<ww:property value="getText('profiles.save.label')"/>"/>
                        &nbsp;
                        <ww:if test="currentProfile.id != -1">
                            <input type="button" class="button" value="<ww:property value="getText('profiles.delete.label')"/>" onclick="location.href ='<ww:url namespace="/secure/profile" action="editprofiles" method="doDelete" includeParams="none"><ww:param name="profileID" value="currentProfile.id"/><ww:param name="%{xsrfTokenName}" value="%{xsrfToken}" /></ww:url>'"/>
                            &nbsp;
                        </ww:if>
                        <input type="button" class="button" value="<ww:property value="getText('profiles.cancel.label')"/>" onclick="location.href ='<ww:url namespace="/secure/profile" action="editprofiles" includeParams="get"/>'"/>
                    </div>
                </div>

            </div>

        </form>

    </body>
</html>
