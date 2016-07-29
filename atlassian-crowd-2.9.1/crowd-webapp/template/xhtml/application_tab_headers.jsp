<%@ taglib uri="/struts-tags" prefix="ww" %>
<ul class="tabs-menu">
    <ww:iterator value="getWebItemsForApplication()">
        <li class="menu-item<ww:if test="key == parameters.pagekey"> active-tab</ww:if>">
            <a id="<ww:property value="link.id"/>" href="<ww:property value="getLink(link)"/>"><strong><ww:property value="getText(webLabel.key)"/></strong></a>
        </li>
    </ww:iterator>
</ul>
