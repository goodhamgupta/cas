<%--
  -- WebWork, Web Application Framework
  --
  -- Distributable under LGPL license.
  -- See terms of license at opensource.org
  --
  --
  -- checkbox.jsp
  --
  -- Required Parameters:
  --   * label  - The description that will be used to identfy the control.
  --   * name   - The name of the attribute to put and pull the result from.
  --              Equates to the NAME parameter of the HTML INPUT tag.
  --
  -- Optional Parameters:
  --   * labelposition   - determines were the label will be place in relation
  --                       to the control.  Default is to the left of the control.
  --   * size            - SIZE parameter of the HTML INPUT tag.
  --   * maxlength       - MAXLENGTH parameter of the HTML INPUT tag.
  --   * disabled        - DISABLED parameter of the HTML INPUT tag.
  --   * readonly        - READONLY parameter of the HTML INPUT tag.
  --   * onkeyup         - onkeyup parameter of the HTML INPUT tag.
  --   * tabindex        - tabindex parameter of the HTML INPUT tag.
  --   * onchange        - onkeyup parameter of the HTML INPUT tag.
  --   * show            - determines whether the password is shown or not. Default is false.
  --
  --%>
<%@ taglib uri="/struts-tags" prefix="webwork" %>
<%@ include file="controlheader.jsp" %>

<input type="password"
       name="<webwork:property value="parameters['name']"/>"
         <webwork:if test="parameters['id'] != null">id="<webwork:property value="parameters['id']"/>"</webwork:if>
         <webwork:if test="parameters['nameValue'] != null && parameters['show']==true">value="<webwork:property value="parameters['nameValue']"/>"</webwork:if>
         <webwork:if test="parameters['size'] != null">size="<webwork:property value="parameters['size']"/>"</webwork:if>
         <webwork:if test="parameters['maxlength'] != null">maxlength="<webwork:property value="parameters['maxlength']"/>"</webwork:if>
         <webwork:if test="parameters['disabled'] == true">disabled="disabled"</webwork:if>
         <webwork:if test="parameters['readonly'] == true">readonly="readonly"</webwork:if>
         <webwork:if test="parameters['onkeyup'] != null">onkeyup="<webwork:property value="parameters['onkeyup']"/>"</webwork:if>
         <webwork:if test="parameters['tabindex'] != null">tabindex="<webwork:property value="parameters['tabindex']"/>"</webwork:if>
         <webwork:if test="parameters['onchange'] != null">onchange="<webwork:property value="parameters['onchange']"/>"</webwork:if>
/>
<%@ include file="controlfooter.jsp" %>
