<%--
  -- WebWork, Web Application Framework
  --
  -- Distributable under LGPL license.
  -- See terms of license at opensource.org
  --
  --
  -- password.jsp
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
<webwork:param name="type" value="'password'"/>
<%@ include file="text.jsp" %>
