/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/7.0.69
 * Generated at: 2016-06-22 07:50:45 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.template.xhtml;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class header_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.HashMap<java.lang.String,java.lang.Long>(1);
    _jspx_dependants.put("/WEB-INF/crowd.tld", Long.valueOf(1462807486000L));
  }

  private org.apache.jasper.runtime.TagHandlerPool _005fjspx_005ftagPool_005fcwd_005fsoy_0026_005ftemplate_005fmoduleKey;
  private org.apache.jasper.runtime.TagHandlerPool _005fjspx_005ftagPool_005fww_005fparam_0026_005fname;
  private org.apache.jasper.runtime.TagHandlerPool _005fjspx_005ftagPool_005fww_005fproperty_0026_005fvalue_005fescape_005fnobody;
  private org.apache.jasper.runtime.TagHandlerPool _005fjspx_005ftagPool_005fww_005fif_0026_005ftest;

  private volatile javax.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public javax.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
    _005fjspx_005ftagPool_005fcwd_005fsoy_0026_005ftemplate_005fmoduleKey = org.apache.jasper.runtime.TagHandlerPool.getTagHandlerPool(getServletConfig());
    _005fjspx_005ftagPool_005fww_005fparam_0026_005fname = org.apache.jasper.runtime.TagHandlerPool.getTagHandlerPool(getServletConfig());
    _005fjspx_005ftagPool_005fww_005fproperty_0026_005fvalue_005fescape_005fnobody = org.apache.jasper.runtime.TagHandlerPool.getTagHandlerPool(getServletConfig());
    _005fjspx_005ftagPool_005fww_005fif_0026_005ftest = org.apache.jasper.runtime.TagHandlerPool.getTagHandlerPool(getServletConfig());
  }

  public void _jspDestroy() {
    _005fjspx_005ftagPool_005fcwd_005fsoy_0026_005ftemplate_005fmoduleKey.release();
    _005fjspx_005ftagPool_005fww_005fparam_0026_005fname.release();
    _005fjspx_005ftagPool_005fww_005fproperty_0026_005fvalue_005fescape_005fnobody.release();
    _005fjspx_005ftagPool_005fww_005fif_0026_005ftest.release();
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
        throws java.io.IOException, javax.servlet.ServletException {

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write('\n');
      out.write('\n');
      out.write('\n');
      if (_jspx_meth_cwd_005fsoy_005f0(_jspx_page_context))
        return;
      out.write('\n');
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }

  private boolean _jspx_meth_cwd_005fsoy_005f0(javax.servlet.jsp.PageContext _jspx_page_context)
          throws java.lang.Throwable {
    javax.servlet.jsp.PageContext pageContext = _jspx_page_context;
    javax.servlet.jsp.JspWriter out = _jspx_page_context.getOut();
    //  cwd:soy
    com.atlassian.crowd.console.tags.SoyTemplateTag _jspx_th_cwd_005fsoy_005f0 = (com.atlassian.crowd.console.tags.SoyTemplateTag) _005fjspx_005ftagPool_005fcwd_005fsoy_0026_005ftemplate_005fmoduleKey.get(com.atlassian.crowd.console.tags.SoyTemplateTag.class);
    _jspx_th_cwd_005fsoy_005f0.setPageContext(_jspx_page_context);
    _jspx_th_cwd_005fsoy_005f0.setParent(null);
    // /template/xhtml/header.jsp(4,0) name = moduleKey type = java.lang.String reqTime = false required = true fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
    _jspx_th_cwd_005fsoy_005f0.setModuleKey("com.atlassian.auiplugin:aui-experimental-soy-templates");
    // /template/xhtml/header.jsp(4,0) name = template type = java.lang.String reqTime = false required = true fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
    _jspx_th_cwd_005fsoy_005f0.setTemplate("aui.page.pageHeader");
    int _jspx_eval_cwd_005fsoy_005f0 = _jspx_th_cwd_005fsoy_005f0.doStartTag();
    if (_jspx_eval_cwd_005fsoy_005f0 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
      if (_jspx_eval_cwd_005fsoy_005f0 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE) {
        out = _jspx_page_context.pushBody();
        _jspx_th_cwd_005fsoy_005f0.setBodyContent((javax.servlet.jsp.tagext.BodyContent) out);
        _jspx_th_cwd_005fsoy_005f0.doInitBody();
      }
      do {
        out.write("\n");
        out.write("    ");
        if (_jspx_meth_ww_005fparam_005f0(_jspx_th_cwd_005fsoy_005f0, _jspx_page_context))
          return true;
        out.write('\n');
        int evalDoAfterBody = _jspx_th_cwd_005fsoy_005f0.doAfterBody();
        if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
          break;
      } while (true);
      if (_jspx_eval_cwd_005fsoy_005f0 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE) {
        out = _jspx_page_context.popBody();
      }
    }
    if (_jspx_th_cwd_005fsoy_005f0.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _005fjspx_005ftagPool_005fcwd_005fsoy_0026_005ftemplate_005fmoduleKey.reuse(_jspx_th_cwd_005fsoy_005f0);
      return true;
    }
    _005fjspx_005ftagPool_005fcwd_005fsoy_0026_005ftemplate_005fmoduleKey.reuse(_jspx_th_cwd_005fsoy_005f0);
    return false;
  }

  private boolean _jspx_meth_ww_005fparam_005f0(javax.servlet.jsp.tagext.JspTag _jspx_th_cwd_005fsoy_005f0, javax.servlet.jsp.PageContext _jspx_page_context)
          throws java.lang.Throwable {
    javax.servlet.jsp.PageContext pageContext = _jspx_page_context;
    javax.servlet.jsp.JspWriter out = _jspx_page_context.getOut();
    //  ww:param
    org.apache.struts2.views.jsp.ParamTag _jspx_th_ww_005fparam_005f0 = (org.apache.struts2.views.jsp.ParamTag) _005fjspx_005ftagPool_005fww_005fparam_0026_005fname.get(org.apache.struts2.views.jsp.ParamTag.class);
    _jspx_th_ww_005fparam_005f0.setPageContext(_jspx_page_context);
    _jspx_th_ww_005fparam_005f0.setParent((javax.servlet.jsp.tagext.Tag) _jspx_th_cwd_005fsoy_005f0);
    // /template/xhtml/header.jsp(5,4) name = name type = java.lang.String reqTime = false required = false fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
    _jspx_th_ww_005fparam_005f0.setName("content");
    int _jspx_eval_ww_005fparam_005f0 = _jspx_th_ww_005fparam_005f0.doStartTag();
    if (_jspx_eval_ww_005fparam_005f0 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
      if (_jspx_eval_ww_005fparam_005f0 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE) {
        out = _jspx_page_context.pushBody();
        _jspx_th_ww_005fparam_005f0.setBodyContent((javax.servlet.jsp.tagext.BodyContent) out);
        _jspx_th_ww_005fparam_005f0.doInitBody();
      }
      do {
        out.write("\n");
        out.write("        ");
        if (_jspx_meth_cwd_005fsoy_005f1(_jspx_th_ww_005fparam_005f0, _jspx_page_context))
          return true;
        out.write("\n");
        out.write("        ");
        if (_jspx_meth_ww_005fif_005f0(_jspx_th_ww_005fparam_005f0, _jspx_page_context))
          return true;
        out.write("\n");
        out.write("    ");
        int evalDoAfterBody = _jspx_th_ww_005fparam_005f0.doAfterBody();
        if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
          break;
      } while (true);
      if (_jspx_eval_ww_005fparam_005f0 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE) {
        out = _jspx_page_context.popBody();
      }
    }
    if (_jspx_th_ww_005fparam_005f0.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _005fjspx_005ftagPool_005fww_005fparam_0026_005fname.reuse(_jspx_th_ww_005fparam_005f0);
      return true;
    }
    _005fjspx_005ftagPool_005fww_005fparam_0026_005fname.reuse(_jspx_th_ww_005fparam_005f0);
    return false;
  }

  private boolean _jspx_meth_cwd_005fsoy_005f1(javax.servlet.jsp.tagext.JspTag _jspx_th_ww_005fparam_005f0, javax.servlet.jsp.PageContext _jspx_page_context)
          throws java.lang.Throwable {
    javax.servlet.jsp.PageContext pageContext = _jspx_page_context;
    javax.servlet.jsp.JspWriter out = _jspx_page_context.getOut();
    //  cwd:soy
    com.atlassian.crowd.console.tags.SoyTemplateTag _jspx_th_cwd_005fsoy_005f1 = (com.atlassian.crowd.console.tags.SoyTemplateTag) _005fjspx_005ftagPool_005fcwd_005fsoy_0026_005ftemplate_005fmoduleKey.get(com.atlassian.crowd.console.tags.SoyTemplateTag.class);
    _jspx_th_cwd_005fsoy_005f1.setPageContext(_jspx_page_context);
    _jspx_th_cwd_005fsoy_005f1.setParent((javax.servlet.jsp.tagext.Tag) _jspx_th_ww_005fparam_005f0);
    // /template/xhtml/header.jsp(6,8) name = moduleKey type = java.lang.String reqTime = false required = true fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
    _jspx_th_cwd_005fsoy_005f1.setModuleKey("com.atlassian.auiplugin:aui-experimental-soy-templates");
    // /template/xhtml/header.jsp(6,8) name = template type = java.lang.String reqTime = false required = true fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
    _jspx_th_cwd_005fsoy_005f1.setTemplate("aui.page.pageHeaderMain");
    int _jspx_eval_cwd_005fsoy_005f1 = _jspx_th_cwd_005fsoy_005f1.doStartTag();
    if (_jspx_eval_cwd_005fsoy_005f1 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
      if (_jspx_eval_cwd_005fsoy_005f1 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE) {
        out = _jspx_page_context.pushBody();
        _jspx_th_cwd_005fsoy_005f1.setBodyContent((javax.servlet.jsp.tagext.BodyContent) out);
        _jspx_th_cwd_005fsoy_005f1.doInitBody();
      }
      do {
        out.write("\n");
        out.write("            ");
        if (_jspx_meth_ww_005fparam_005f1(_jspx_th_cwd_005fsoy_005f1, _jspx_page_context))
          return true;
        out.write("\n");
        out.write("        ");
        int evalDoAfterBody = _jspx_th_cwd_005fsoy_005f1.doAfterBody();
        if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
          break;
      } while (true);
      if (_jspx_eval_cwd_005fsoy_005f1 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE) {
        out = _jspx_page_context.popBody();
      }
    }
    if (_jspx_th_cwd_005fsoy_005f1.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _005fjspx_005ftagPool_005fcwd_005fsoy_0026_005ftemplate_005fmoduleKey.reuse(_jspx_th_cwd_005fsoy_005f1);
      return true;
    }
    _005fjspx_005ftagPool_005fcwd_005fsoy_0026_005ftemplate_005fmoduleKey.reuse(_jspx_th_cwd_005fsoy_005f1);
    return false;
  }

  private boolean _jspx_meth_ww_005fparam_005f1(javax.servlet.jsp.tagext.JspTag _jspx_th_cwd_005fsoy_005f1, javax.servlet.jsp.PageContext _jspx_page_context)
          throws java.lang.Throwable {
    javax.servlet.jsp.PageContext pageContext = _jspx_page_context;
    javax.servlet.jsp.JspWriter out = _jspx_page_context.getOut();
    //  ww:param
    org.apache.struts2.views.jsp.ParamTag _jspx_th_ww_005fparam_005f1 = (org.apache.struts2.views.jsp.ParamTag) _005fjspx_005ftagPool_005fww_005fparam_0026_005fname.get(org.apache.struts2.views.jsp.ParamTag.class);
    _jspx_th_ww_005fparam_005f1.setPageContext(_jspx_page_context);
    _jspx_th_ww_005fparam_005f1.setParent((javax.servlet.jsp.tagext.Tag) _jspx_th_cwd_005fsoy_005f1);
    // /template/xhtml/header.jsp(7,12) name = name type = java.lang.String reqTime = false required = false fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
    _jspx_th_ww_005fparam_005f1.setName("content");
    int _jspx_eval_ww_005fparam_005f1 = _jspx_th_ww_005fparam_005f1.doStartTag();
    if (_jspx_eval_ww_005fparam_005f1 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
      if (_jspx_eval_ww_005fparam_005f1 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE) {
        out = _jspx_page_context.pushBody();
        _jspx_th_ww_005fparam_005f1.setBodyContent((javax.servlet.jsp.tagext.BodyContent) out);
        _jspx_th_ww_005fparam_005f1.doInitBody();
      }
      do {
        out.write("\n");
        out.write("                ");
        if (_jspx_meth_ww_005fproperty_005f0(_jspx_th_ww_005fparam_005f1, _jspx_page_context))
          return true;
        out.write("\n");
        out.write("            ");
        int evalDoAfterBody = _jspx_th_ww_005fparam_005f1.doAfterBody();
        if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
          break;
      } while (true);
      if (_jspx_eval_ww_005fparam_005f1 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE) {
        out = _jspx_page_context.popBody();
      }
    }
    if (_jspx_th_ww_005fparam_005f1.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _005fjspx_005ftagPool_005fww_005fparam_0026_005fname.reuse(_jspx_th_ww_005fparam_005f1);
      return true;
    }
    _005fjspx_005ftagPool_005fww_005fparam_0026_005fname.reuse(_jspx_th_ww_005fparam_005f1);
    return false;
  }

  private boolean _jspx_meth_ww_005fproperty_005f0(javax.servlet.jsp.tagext.JspTag _jspx_th_ww_005fparam_005f1, javax.servlet.jsp.PageContext _jspx_page_context)
          throws java.lang.Throwable {
    javax.servlet.jsp.PageContext pageContext = _jspx_page_context;
    javax.servlet.jsp.JspWriter out = _jspx_page_context.getOut();
    //  ww:property
    org.apache.struts2.views.jsp.PropertyTag _jspx_th_ww_005fproperty_005f0 = (org.apache.struts2.views.jsp.PropertyTag) _005fjspx_005ftagPool_005fww_005fproperty_0026_005fvalue_005fescape_005fnobody.get(org.apache.struts2.views.jsp.PropertyTag.class);
    _jspx_th_ww_005fproperty_005f0.setPageContext(_jspx_page_context);
    _jspx_th_ww_005fproperty_005f0.setParent((javax.servlet.jsp.tagext.Tag) _jspx_th_ww_005fparam_005f1);
    // /template/xhtml/header.jsp(8,16) name = value type = java.lang.String reqTime = false required = false fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
    _jspx_th_ww_005fproperty_005f0.setValue("parameters['mainContent']");
    // /template/xhtml/header.jsp(8,16) name = escape type = java.lang.String reqTime = false required = false fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
    _jspx_th_ww_005fproperty_005f0.setEscape(false);
    int _jspx_eval_ww_005fproperty_005f0 = _jspx_th_ww_005fproperty_005f0.doStartTag();
    if (_jspx_th_ww_005fproperty_005f0.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _005fjspx_005ftagPool_005fww_005fproperty_0026_005fvalue_005fescape_005fnobody.reuse(_jspx_th_ww_005fproperty_005f0);
      return true;
    }
    _005fjspx_005ftagPool_005fww_005fproperty_0026_005fvalue_005fescape_005fnobody.reuse(_jspx_th_ww_005fproperty_005f0);
    return false;
  }

  private boolean _jspx_meth_ww_005fif_005f0(javax.servlet.jsp.tagext.JspTag _jspx_th_ww_005fparam_005f0, javax.servlet.jsp.PageContext _jspx_page_context)
          throws java.lang.Throwable {
    javax.servlet.jsp.PageContext pageContext = _jspx_page_context;
    javax.servlet.jsp.JspWriter out = _jspx_page_context.getOut();
    //  ww:if
    org.apache.struts2.views.jsp.IfTag _jspx_th_ww_005fif_005f0 = (org.apache.struts2.views.jsp.IfTag) _005fjspx_005ftagPool_005fww_005fif_0026_005ftest.get(org.apache.struts2.views.jsp.IfTag.class);
    _jspx_th_ww_005fif_005f0.setPageContext(_jspx_page_context);
    _jspx_th_ww_005fif_005f0.setParent((javax.servlet.jsp.tagext.Tag) _jspx_th_ww_005fparam_005f0);
    // /template/xhtml/header.jsp(11,8) name = test type = java.lang.String reqTime = false required = true fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
    _jspx_th_ww_005fif_005f0.setTest("parameters['actionsContent'] != null");
    int _jspx_eval_ww_005fif_005f0 = _jspx_th_ww_005fif_005f0.doStartTag();
    if (_jspx_eval_ww_005fif_005f0 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
      if (_jspx_eval_ww_005fif_005f0 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE) {
        out = _jspx_page_context.pushBody();
        _jspx_th_ww_005fif_005f0.setBodyContent((javax.servlet.jsp.tagext.BodyContent) out);
        _jspx_th_ww_005fif_005f0.doInitBody();
      }
      do {
        out.write("\n");
        out.write("            ");
        if (_jspx_meth_cwd_005fsoy_005f2(_jspx_th_ww_005fif_005f0, _jspx_page_context))
          return true;
        out.write("\n");
        out.write("        ");
        int evalDoAfterBody = _jspx_th_ww_005fif_005f0.doAfterBody();
        if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
          break;
      } while (true);
      if (_jspx_eval_ww_005fif_005f0 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE) {
        out = _jspx_page_context.popBody();
      }
    }
    if (_jspx_th_ww_005fif_005f0.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _005fjspx_005ftagPool_005fww_005fif_0026_005ftest.reuse(_jspx_th_ww_005fif_005f0);
      return true;
    }
    _005fjspx_005ftagPool_005fww_005fif_0026_005ftest.reuse(_jspx_th_ww_005fif_005f0);
    return false;
  }

  private boolean _jspx_meth_cwd_005fsoy_005f2(javax.servlet.jsp.tagext.JspTag _jspx_th_ww_005fif_005f0, javax.servlet.jsp.PageContext _jspx_page_context)
          throws java.lang.Throwable {
    javax.servlet.jsp.PageContext pageContext = _jspx_page_context;
    javax.servlet.jsp.JspWriter out = _jspx_page_context.getOut();
    //  cwd:soy
    com.atlassian.crowd.console.tags.SoyTemplateTag _jspx_th_cwd_005fsoy_005f2 = (com.atlassian.crowd.console.tags.SoyTemplateTag) _005fjspx_005ftagPool_005fcwd_005fsoy_0026_005ftemplate_005fmoduleKey.get(com.atlassian.crowd.console.tags.SoyTemplateTag.class);
    _jspx_th_cwd_005fsoy_005f2.setPageContext(_jspx_page_context);
    _jspx_th_cwd_005fsoy_005f2.setParent((javax.servlet.jsp.tagext.Tag) _jspx_th_ww_005fif_005f0);
    // /template/xhtml/header.jsp(12,12) name = moduleKey type = java.lang.String reqTime = false required = true fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
    _jspx_th_cwd_005fsoy_005f2.setModuleKey("com.atlassian.auiplugin:aui-experimental-soy-templates");
    // /template/xhtml/header.jsp(12,12) name = template type = java.lang.String reqTime = false required = true fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
    _jspx_th_cwd_005fsoy_005f2.setTemplate("aui.page.pageHeaderActions");
    int _jspx_eval_cwd_005fsoy_005f2 = _jspx_th_cwd_005fsoy_005f2.doStartTag();
    if (_jspx_eval_cwd_005fsoy_005f2 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
      if (_jspx_eval_cwd_005fsoy_005f2 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE) {
        out = _jspx_page_context.pushBody();
        _jspx_th_cwd_005fsoy_005f2.setBodyContent((javax.servlet.jsp.tagext.BodyContent) out);
        _jspx_th_cwd_005fsoy_005f2.doInitBody();
      }
      do {
        out.write("\n");
        out.write("                ");
        if (_jspx_meth_ww_005fparam_005f2(_jspx_th_cwd_005fsoy_005f2, _jspx_page_context))
          return true;
        out.write("\n");
        out.write("            ");
        int evalDoAfterBody = _jspx_th_cwd_005fsoy_005f2.doAfterBody();
        if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
          break;
      } while (true);
      if (_jspx_eval_cwd_005fsoy_005f2 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE) {
        out = _jspx_page_context.popBody();
      }
    }
    if (_jspx_th_cwd_005fsoy_005f2.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _005fjspx_005ftagPool_005fcwd_005fsoy_0026_005ftemplate_005fmoduleKey.reuse(_jspx_th_cwd_005fsoy_005f2);
      return true;
    }
    _005fjspx_005ftagPool_005fcwd_005fsoy_0026_005ftemplate_005fmoduleKey.reuse(_jspx_th_cwd_005fsoy_005f2);
    return false;
  }

  private boolean _jspx_meth_ww_005fparam_005f2(javax.servlet.jsp.tagext.JspTag _jspx_th_cwd_005fsoy_005f2, javax.servlet.jsp.PageContext _jspx_page_context)
          throws java.lang.Throwable {
    javax.servlet.jsp.PageContext pageContext = _jspx_page_context;
    javax.servlet.jsp.JspWriter out = _jspx_page_context.getOut();
    //  ww:param
    org.apache.struts2.views.jsp.ParamTag _jspx_th_ww_005fparam_005f2 = (org.apache.struts2.views.jsp.ParamTag) _005fjspx_005ftagPool_005fww_005fparam_0026_005fname.get(org.apache.struts2.views.jsp.ParamTag.class);
    _jspx_th_ww_005fparam_005f2.setPageContext(_jspx_page_context);
    _jspx_th_ww_005fparam_005f2.setParent((javax.servlet.jsp.tagext.Tag) _jspx_th_cwd_005fsoy_005f2);
    // /template/xhtml/header.jsp(13,16) name = name type = java.lang.String reqTime = false required = false fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
    _jspx_th_ww_005fparam_005f2.setName("content");
    int _jspx_eval_ww_005fparam_005f2 = _jspx_th_ww_005fparam_005f2.doStartTag();
    if (_jspx_eval_ww_005fparam_005f2 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
      if (_jspx_eval_ww_005fparam_005f2 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE) {
        out = _jspx_page_context.pushBody();
        _jspx_th_ww_005fparam_005f2.setBodyContent((javax.servlet.jsp.tagext.BodyContent) out);
        _jspx_th_ww_005fparam_005f2.doInitBody();
      }
      do {
        out.write("\n");
        out.write("                    ");
        if (_jspx_meth_ww_005fproperty_005f1(_jspx_th_ww_005fparam_005f2, _jspx_page_context))
          return true;
        out.write("\n");
        out.write("                ");
        int evalDoAfterBody = _jspx_th_ww_005fparam_005f2.doAfterBody();
        if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
          break;
      } while (true);
      if (_jspx_eval_ww_005fparam_005f2 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE) {
        out = _jspx_page_context.popBody();
      }
    }
    if (_jspx_th_ww_005fparam_005f2.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _005fjspx_005ftagPool_005fww_005fparam_0026_005fname.reuse(_jspx_th_ww_005fparam_005f2);
      return true;
    }
    _005fjspx_005ftagPool_005fww_005fparam_0026_005fname.reuse(_jspx_th_ww_005fparam_005f2);
    return false;
  }

  private boolean _jspx_meth_ww_005fproperty_005f1(javax.servlet.jsp.tagext.JspTag _jspx_th_ww_005fparam_005f2, javax.servlet.jsp.PageContext _jspx_page_context)
          throws java.lang.Throwable {
    javax.servlet.jsp.PageContext pageContext = _jspx_page_context;
    javax.servlet.jsp.JspWriter out = _jspx_page_context.getOut();
    //  ww:property
    org.apache.struts2.views.jsp.PropertyTag _jspx_th_ww_005fproperty_005f1 = (org.apache.struts2.views.jsp.PropertyTag) _005fjspx_005ftagPool_005fww_005fproperty_0026_005fvalue_005fescape_005fnobody.get(org.apache.struts2.views.jsp.PropertyTag.class);
    _jspx_th_ww_005fproperty_005f1.setPageContext(_jspx_page_context);
    _jspx_th_ww_005fproperty_005f1.setParent((javax.servlet.jsp.tagext.Tag) _jspx_th_ww_005fparam_005f2);
    // /template/xhtml/header.jsp(14,20) name = value type = java.lang.String reqTime = false required = false fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
    _jspx_th_ww_005fproperty_005f1.setValue("parameters['actionsContent']");
    // /template/xhtml/header.jsp(14,20) name = escape type = java.lang.String reqTime = false required = false fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
    _jspx_th_ww_005fproperty_005f1.setEscape(false);
    int _jspx_eval_ww_005fproperty_005f1 = _jspx_th_ww_005fproperty_005f1.doStartTag();
    if (_jspx_th_ww_005fproperty_005f1.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _005fjspx_005ftagPool_005fww_005fproperty_0026_005fvalue_005fescape_005fnobody.reuse(_jspx_th_ww_005fproperty_005f1);
      return true;
    }
    _005fjspx_005ftagPool_005fww_005fproperty_0026_005fvalue_005fescape_005fnobody.reuse(_jspx_th_ww_005fproperty_005f1);
    return false;
  }
}
