<%--
  -- WebWork, Web Application Framework
  --
  -- Distributable under LGPL license.
  -- See terms of license at opensource.org
  --
  --
  -- text.jsp
  --
  -- Required Parameters:
  --   * label      - The description that will be used to identfy the control.
  --   * name       - The name of the attribute to put and pull the result from.
  --                  Equates to the NAME parameter of the HTML INPUT tag.
  --
  -- Optional Parameters:
  --   * labelposition   - determines were the label will be place in relation
  --                       to the control.  Default is to the left of the control.
  --   * size       - SIZE parameter of the HTML INPUT tag.
  --   * maxlength  - MAXLENGTH parameter of the HTML INPUT tag.
  --   * disabled   - DISABLED parameter of the HTML INPUT tag.
  --   * readonly   - READONLY parameter of the HTML INPUT tag.
  --   * onkeyup    - onkeyup parameter of the HTML INPUT tag.
  --   * tabindex  - tabindex parameter of the HTML INPUT tag.
  --   * onchange  - onkeyup parameter of the HTML INPUT tag.
  --
  --%>
<%@ taglib uri="/struts-tags" prefix="webwork" %>
<webwork:if test="parameters['inline'] != true">
    <%@ include file="controlheader.jsp" %>
</webwork:if>
<input type="<webwork:if test="parameters['type'] != null"><webwork:property value="parameters['type']"/></webwork:if><webwork:else>text</webwork:else>"
        name="<webwork:property value="parameters['name']"/>"
        <webwork:if test="parameters['size'] != null">size="<webwork:property value="parameters['size']"/>"</webwork:if>
        <webwork:if test="parameters['maxlength'] != null">maxlength="<webwork:property value="parameters['maxlength']"/>"</webwork:if>
        <webwork:if test="parameters['nameValue'] != null && (parameters['type'] != 'password' || parameters['show'] == true)">value="<webwork:property value="parameters['nameValue']"/>"</webwork:if>
        <webwork:if test="parameters['disabled'] == true">disabled="disabled"</webwork:if>
        <webwork:if test="parameters['readonly'] == true">readonly="readonly"</webwork:if>
        <webwork:if test="parameters['onkeyup'] != null">onkeyup="<webwork:property value="parameters['onkeyup']"/>"</webwork:if>
        <webwork:if test="parameters['tabindex'] != null">tabindex="<webwork:property value="parameters['tabindex']"/>"</webwork:if>
        <webwork:if test="parameters['onchange'] != null">onchange="<webwork:property value="parameters['onchange']"/>"</webwork:if>
        <webwork:if test="parameters['id'] != null">id="<webwork:property value="parameters['id']"/>"</webwork:if>
        <webwork:if test="parameters['cssStyle'] != null">style="<webwork:property value="parameters['cssStyle']"/>"</webwork:if>
        class="<webwork:if test="parameters['type'] == 'password'">password</webwork:if><webwork:else>text</webwork:else><webwork:if test="parameters['cssClass'] != null"> <webwork:property value="parameters['cssClass']"/></webwork:if><webwork:if test="parameters['fieldWidth'] != null"> <webwork:property value="parameters['fieldWidth']"/>-field</webwork:if>"
        <webwork:if test="parameters['autofocus'] == true">autofocus</webwork:if>
        <webwork:if test="parameters['placeholder'] != null">placeholder="<webwork:property value="parameters['placeholder']"/>"</webwork:if>
        <%@ include file="data-attributes.jsp" %>
/>
<webwork:if test="parameters['inline'] != true">
    <%@ include file="controlfooter.jsp" %>
</webwork:if>
