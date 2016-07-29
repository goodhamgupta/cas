<%--
  -- WebWork, Web Application Framework
  --
  -- Distributable under LGPL license.
  -- See terms of license at opensource.org
  --
  --
  -- radiomap.jsp
  --
  -- Required Parameters:
  --   * label     - The description that will be used to identfy the control.
  --   * name      - The name of the attribute to put and pull the result from.
  --                 Equates to the NAME parameter of the HTML tag INPUT.
  --   * list      - Iterator that will provide the options for the control.
  --                 Equates to the HTML LABEL tags.
  --   * listKey   - Where to get the values for the INPUT tag.  Equates to
  --                 the VALUE parameter of the INPUT tag.
  --   * listValue - The value displayed next to the radio control.  Equates to the body
  --                 of the enclosing HTML LABEL tag.
  --
  -- Optional Parameters:
  --   * labelposition   - determines were the label will be place in relation
  --                       to the control.  Default is to the left of the control.
  --   * disabled        - DISABLED parameter of the HTML INPUT tag.
  --   * tabindex        - tabindex parameter of the HTML INPUT tag.
  --   * onchange        - onkeyup parameter of the HTML INPUT tag.
  --
  --%>
<%@ taglib uri="/struts-tags" prefix="webwork" %>
<%@ include file="controlheader-group.jsp" %>

<webwork:iterator value="parameters.list" status="radioStatus">
    <webwork:push value="[0]"/>

    <webwork:if test="parameters.listKey != null">
        <webwork:set name="itemKey" value="stack.findString(parameters.listKey)"/>
    </webwork:if>
    <webwork:else>
        <webwork:set name="itemKey" value="[0]"/>
    </webwork:else>

    <webwork:if test="parameters.listValue != null">
        <webwork:set name="itemValue" value="stack.findString(parameters.listValue)"/>
    </webwork:if>
    <webwork:else>
        <webwork:set name="itemValue" value="[0]"/>
    </webwork:else>

    <webwork:if test="parameters.listDescription != null">
        <webwork:set name="itemDescription" value="stack.findString(parameters.listDescription)"/>
    </webwork:if>
    <webwork:else>
        <webwork:set name="itemDescription" value=""/>
    </webwork:else>

    <div class="radio">
        <input type="radio"
                <webwork:if test="parameters['nameValue'] == #itemKey || parameters['selectedValue'] == #itemKey ">checked="checked"</webwork:if>
                name="<webwork:property value="parameters['name']"/>"
                id="<webwork:property value="parameters['name']"/>_<webwork:property value="#radioStatus.index"/>"
                value="<webwork:property value="#itemKey"/>"
                <webwork:if test="parameters['onchange'] != null">onchange="<webwork:property value="parameters['onchange']"/>"</webwork:if>
                <webwork:if test="parameters['onclick'] != null">onclick="<webwork:property value="parameters['onclick']"/>"</webwork:if>
                class="radio"
        />
        <label for="<webwork:property value="parameters['name']"/>_<webwork:property value="#radioStatus.index"/>"><webwork:property value="#itemValue"/></label>
        <webwork:if test="#itemDescription != null && #itemDescription != ''">
            <div class="description"><webwork:property value="#itemDescription" escape="false"/></div>
        </webwork:if>
    </div>

    <webwork:property value="stack.pop"/>
</webwork:iterator>

<%@ include file="controlfooter-core.jsp" %>
<%@ include file="controlfooter-group.jsp" %>
