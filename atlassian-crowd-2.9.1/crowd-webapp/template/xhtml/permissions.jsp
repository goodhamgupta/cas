<%@ taglib uri="/struts-tags" prefix="ww" %>
<%@ include file="controlheader-group.jsp" %>

<ww:checkbox name="permissionGroupAdd" fieldValue="true">
    <ww:param name="label" value="getText('permission.addgroup.label')"/>
    <ww:param name="description">
        <ww:text name="permission.addgroup.description"/>
    </ww:param>
    <ww:param name="group" value="false"/>
</ww:checkbox>

<ww:checkbox name="permissionPrincipalAdd" fieldValue="true">
    <ww:param name="label" value="getText('permission.addprincipal.label')"/>
    <ww:param name="description">
        <ww:text name="permission.addprincipal.description"/>
    </ww:param>
    <ww:param name="group" value="false"/>
</ww:checkbox>

<ww:checkbox name="permissionGroupModify" fieldValue="true">
    <ww:param name="label" value="getText('permission.modifygroup.label')"/>
    <ww:param name="description">
        <ww:text name="permission.modifygroup.description"/>
    </ww:param>
    <ww:param name="group" value="false"/>
</ww:checkbox>

<ww:checkbox name="permissionPrincipalModify" fieldValue="true">
    <ww:param name="label" value="getText('permission.modifyprincipal.label')"/>
    <ww:param name="description">
        <ww:text name="permission.modifyprincipal.description"/>
    </ww:param>
    <ww:param name="group" value="false"/>
</ww:checkbox>

<ww:checkbox name="permissionGroupAttributeModify" fieldValue="true">
    <ww:param name="label" value="getText('permission.modifygroupattribute.label')"/>
    <ww:param name="description">
        <ww:text name="permission.modifygroupattribute.description"/>
    </ww:param>
    <ww:param name="group" value="false"/>
</ww:checkbox>

<ww:checkbox name="permissionPrincipalAttributeModify" fieldValue="true">
    <ww:param name="label" value="getText('permission.modifyprincipalattribute.label')"/>
    <ww:param name="description">
        <ww:text name="permission.modifyprincipalattribute.description"/>
    </ww:param>
    <ww:param name="group" value="false"/>
</ww:checkbox>

<ww:checkbox name="permissionGroupRemove" fieldValue="true">
    <ww:param name="label" value="getText('permission.removegroup.label')"/>
    <ww:param name="description">
        <ww:text name="permission.removegroup.description"/>
    </ww:param>
    <ww:param name="group" value="false"/>
</ww:checkbox>

<ww:checkbox name="permissionPrincipalRemove" fieldValue="true">
    <ww:param name="label" value="getText('permission.removeprincipal.label')"/>
    <ww:param name="description">
        <ww:text name="permission.removeprincipal.description"/>
    </ww:param>
    <ww:param name="group" value="false"/>
</ww:checkbox>

<%@ include file="controlfooter-group.jsp" %>
