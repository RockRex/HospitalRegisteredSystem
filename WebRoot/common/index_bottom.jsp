<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>My JSP 'index_bottom.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<c:set value="${pageContext.request.contextPath}" var="path" scope="page"/>
<LINK rel=stylesheet type=text/css href="${path}/css/index_top_files/css.css">
<STYLE type=text/css>TD {
	TEXT-ALIGN: center
}
</STYLE>
  </head>
  
  <body leftMargin=0 topMargin=0>
    <TABLE border=0 cellSpacing=0 cellPadding=0 width=750 
background=${path}/images/files/bottom_logo.gif height=50>
  <TBODY>
  <TR>
    <TD>
      <TABLE cellSpacing=0 cellPadding=0 align=center>
        <TBODY>
        <TR>
          <TD width=750>(C)2017 **医院信息中心版权所有 地址：石家庄北二环东路第**号 
            医院总机：0311-12345678<BR>挂号咨询处：0311-616161888转87654 
            电子信箱：hualezhuangne@163.com &gt;&gt;&gt;<A 
            href="${path}/admin/login.html" 
            target=_blank>管理</A> 
</TR></TBODY></TABLE></TD></TR></TBODY></TABLE>
  </body>
</html>
