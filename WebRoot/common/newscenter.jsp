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
 <s:if test="#request.news == null || #request.news.size() == 0">
		<h3>没有任何新闻信息</h3>
</s:if>
<s:else>
	<TABLE border=0 cellSpacing=0 cellPadding=0 width=720  >
  <TR>
    <TD class=lfont  align=middle colspan="2" ><B>新闻中心</B></TD>
  </TR>
  <tr>
  	<td align="center">新闻标题</td>
  	<td align="center">时间</td>
  </tr>
  <s:iterator value="#request.news">
  <tr>
  	<td><a href="NoticeAction-noticeDetail?id=${noticeId }">${noticeTitle }</a>
  	</td>
	<td>${noticeSavetime }</td>
  </tr>
  </s:iterator>
    </TABLE>
</s:else>
   
  </center>

  <center>
<jsp:include page="index_bottom.jsp"></jsp:include>
</center>
  </body>
</html>
