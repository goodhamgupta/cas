<ol class="tabs">
    <#foreach webItem in webItemsForApplication>
    <li <#if webItem.key == ${parameters.get('pagekey')>class="on"</#if> >
        <a id="${webItem.link.id}" href="${action.getLink(webItem.link)}"/>
        ${action.getText(webItem.webLabel.key)}
        </a>
    </li>
    </#foreach>
</ol>