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
  <s:if test="#request.hospital == null">
		<h3>医院简介为空</h3>
</s:if>
<s:else>
	<TABLE border=0 cellSpacing=0 cellPadding=0 width=720  >
  <TBODY>
  <TR>
    <TD class=lfont  align=middle><B>医院简介</B></TD></TR>
  <TR>
    <TD>
    <s:property value="#request.hospital.hospitalRemark" />
    </TD>
   </TR>
 </TBODY>
 </TABLE>
</s:else>
  
  </center>
  <center>
<jsp:include page="index_bottom.jsp"></jsp:include>
</center>
  </body>
</html>
