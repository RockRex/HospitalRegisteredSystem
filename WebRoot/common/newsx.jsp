<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  <title>医院网上预约系统</title>
<STYLE>BODY {
	BACKGROUND-IMAGE: url(image/bgp.gif)
}
</STYLE>
 
  </head>
  
  <body  class=frame_class leftMargin=0 topMargin=0>
  <center>
<jsp:include page="index_top.jsp"></jsp:include>
<jsp:include page="navframe.jsp"></jsp:include>

</center>
  <center>
   <table border=0 cellSpacing=0 cellPadding=0 width=720>
   <tr>
   <td class=lfont  align=middle colspan="2"><B>新闻中心</B></td>
   </tr>
   <tr>
   		<td align="center" style="font-size: 19px;"><s:property value="noticeTitle" /></td>
   </tr>
   <tr>
   		<td align="center" style="font-size: 17px"><s:property value="noticeContent" /></td>
   </tr>
   <tr>
   		<td align="right" style="font-size: 12px"><s:property value="noticeSavetime" /></td>
   </tr>
   </table>
  </center>
  <center>
<jsp:include page="index_bottom.jsp"></jsp:include>
</center>
  </body>
</html>
