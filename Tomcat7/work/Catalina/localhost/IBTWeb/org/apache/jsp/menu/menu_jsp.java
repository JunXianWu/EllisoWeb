/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/7.0.42
 * Generated at: 2013-12-25 04:40:21 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.menu;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.HashMap;
import control.UserControl;
import java.util.ArrayList;
import vteam.frame.system.exception.*;
import vteam.csps.common.MessageConst;
import vteam.csps.common.BussConst;
import java.util.Locale;
import vteam.frame.system.sysconst.FrameConst;
import vteam.web.menu.Menu;
import vteam.frame.system.message.MessageResourceImpl;

public final class menu_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  private javax.el.ExpressionFactory _el_expressionfactory;
  private org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public void _jspInit() {
    _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
    _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
  }

  public void _jspDestroy() {
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
      response.setContentType("text/html; charset=utf-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");

	response.setHeader("Expires","Tues,01 Jan 1980 00:00:00 GMT");
        //获取当前locale
        //Locale locale = request.getLocale();
        //判断是否已登陆
	UserControl uc = new UserControl(session);
	Locale locale = uc.getLocale();
	MessageResourceImpl message = MessageResourceImpl.getInstance();
    message.setLanLocal(uc.getLocale());
      	if(uc.getUserID()==null){
          //StException se = new StException(MessageConst.MSG_USER_NOTLOGIN);
          //ArrayList list = new ArrayList();
          //list.add(se);
         // ExceptionDisplayor ex = new ExceptionDisplayor(locale,list);
         // list = ex.getDisplayList();
         // session.setAttribute(FrameConst.MESSAGE_KEY,list);
         // list = null;
         // se = null;
         // ex = null;
         // response.sendRedirect(BussConst.PATH_LOGOUT_MSG);
         
     	//out.write("<tr><td>&nbsp;&nbsp;&nbsp;&nbsp;<strong><font size=\"2\" color=\"#555555\">"+message.getMessage(MessageConst.MSG_USER_NOTLOGIN)+"</font></strong></td></tr>");
        //out.write("<script language=\"javascript\"> function show_onclick(){ if(window.parent.document.getElementById(\"indexFrame\").cols=\"0,7,*\"){ ");
       // out.write("  window.parent.document.getElementById(\"indexFrame\").cols=\"200,7,*\";}}");
        //out.write(" setTimeout(\"show_onclick()\",200); </script>"); 
        
        out.write("<script language=\"javascript\"> function outTime(){");
        out.write("  alert(\"用户未登录\"); window.parent.frames.location.href=\"../main/login.jsp\";}");
        out.write(" setTimeout(\"outTime()\",200); </script>");            
         
      return;
        }

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<meta http-equiv=\"Content-Style-Type\" content=\"text/css\">\r\n");
      out.write("<title>bop</title>\r\n");
      out.write("<!-- \r\n");
      out.write("<link href=\"../css/vteam.css\" rel=\"stylesheet\" type=\"text/css\">\r\n");
      out.write(" -->\r\n");
      out.write("<script language=\"JavaScript\" src=\"../jscript/submit.js\"></script>\r\n");
      out.write("<script language=\"JavaScript\" src=\"../jscript/menuTree.js\"></script>\r\n");
      out.write("\r\n");
      out.write("<!--add begin [1.0] Eric 设置菜单字体样式-->\r\n");
      out.write("<style>\r\n");
      out.write("A:link{\r\n");
      out.write("\tFONT-SIZE: 9pt;\r\n");
      out.write("\tCOLOR: #555555;\r\n");
      out.write("        /*COLOR: #FF0000;*/\r\n");
      out.write("\tTEXT-DECORATION: none;\r\n");
      out.write("}\r\n");
      out.write("A:visited{\r\n");
      out.write("\tFONT-SIZE: 9pt;\r\n");
      out.write("\tCOLOR: #555555;\r\n");
      out.write("\tTEXT-DECORATION: none;\r\n");
      out.write("\t/*background-color: #00FFFF;*/\r\n");
      out.write("}\r\n");
      out.write("A:hover{\r\n");
      out.write("\tFONT-SIZE: 9pt;\r\n");
      out.write("\tCOLOR: red;\r\n");
      out.write("\tTEXT-DECORATION: none;\r\n");
      out.write("\t/*background-color: #FDF5E1;#ef4118 */\r\n");
      out.write("}\r\n");
      out.write("a.hover{FONT-SIZE: 12px; COLOR: #FF0000}\r\n");
      out.write(".style2 {\r\n");
      out.write("\tFONT-SIZE: 12px; COLOR: #000000\r\n");
      out.write("}\r\n");
      out.write(".style3 {\r\n");
      out.write("\tFONT-SIZE: 12px; COLOR: #FF0000\r\n");
      out.write("}\r\n");
      out.write("body,td,th {\r\n");
      out.write("\tFONT-SIZE: 12px;\r\n");
      out.write("}\r\n");
      out.write("</style>\r\n");
      out.write("<!--[1.0] end -->\r\n");
      out.write("</head>\r\n");
      out.write("\r\n");
      out.write("<body leftMargin=\"0\" topMargin=\"0\" rightMargin=\"0\"\r\n");
      out.write(" style=\"scrollbar-base-color: #ffffff;\r\n");
      out.write("scrollbar-darkshadow-color: #ffffff;\r\n");
      out.write("SCROLLBAR-HIGHLIGHT-COLOR: #b0b0b0;\r\n");
      out.write("SCROLLBAR-SHADOW-COLOR: #b0b0b0;\r\n");
      out.write("scrollbar-Track-Color: #ffffff;\r\n");
      out.write("scrollbar-Face-Color: #ffffff;\r\n");
      out.write("scrollbar-3dLight-Color:#ffffff;\" >\r\n");
      out.write("\r\n");
      out.write("<style type=\"text/css\">\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("body {\r\n");
      out.write("\tbackground-color: #FFFFFF;\r\n");
      out.write("\tCOLOR:#555555;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("</style>\r\n");
      out.write("<form name=\"form1\" id=\"form1\" method=\"post\" >\r\n");
      out.write("\r\n");
      out.write("\r\n");

StringBuffer bf = new StringBuffer();
try{
		String modulefunid = request.getParameter("modulefunid");
		if(modulefunid!=null && !"".equals(modulefunid)){
        	HashMap map=uc.getMenuListScript();
        	HashMap leftMenuMap = (HashMap)map.get("leftMenuMap");
        	out.println(((StringBuffer)leftMenuMap.get(modulefunid)).toString());
        	bf.append("<script language=\"javascript\"> function show_onclick(){ if(window.parent.document.getElementById(\"indexFrame\").cols=\"0,7,*\"){ ");
            bf.append("  window.parent.document.getElementById(\"indexFrame\").cols=\"200,7,*\";}}");
            bf.append(" setTimeout(\"show_onclick()\",200); </script>");
           
        }
		//out.println(((StringBuffer)map.get("FullMenuBuffer")).toString());
}catch(Exception e){
        return;
}



      out.write("\r\n");
      out.write("\r\n");
      out.write("</form>\r\n");
      out.write("</body>\r\n");
      out.write("</html>\r\n");
      out.print(bf.toString() );
      out.write("\r\n");
      out.write("\r\n");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try { out.clearBuffer(); } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
