<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  <title>医院网上预约系统</title>
  
<c:set value="${pageContext.request.contextPath}" var="path" scope="page"/>
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
   <TABLE border=0 cellSpacing=0 cellPadding=0 width=720  >
  <TBODY>
  <TR>
    <TD class=lfont  align=middle><B>科室查询</B></TD></TR>
  <TR>
    <TD >
      <TABLE border=0 cellSpacing=0 borderColor=#bdbfbd borderColorDark=#ffffff 
      cellPadding=0 width="100%" height="375" >
        
        <TBODY>
        <TR>
          <TD vAlign=top >
            <TABLE border=1 cellSpacing=1 cellPadding=1 width="100%" bgcolor="#ffffff"><TBODY>
              <!-- 填充一个list 开始-->
            <s:if test="#request.departments == null || #request.departments.size() == 0">
				<h3>没有任何科室信息</h3>
			</s:if>
			<s:else>
				<TABLE border=0 cellSpacing=0 cellPadding=0 width="100%" bgcolor="#ffffff">
  			<s:iterator value="#request.departments">
  					<tr>
  					<td>
  					<a href="${path}/DepartmentAction-departmentDetail?id=${departmentId }">
  						${departmentName }--${departmentType }
  					</a>
  					</td>
  					</tr>
  			</s:iterator>
    			</TABLE>
			</s:else>
              <!-- 填充一个list 结束-->
              </TBODY></TABLE></TD></TR></TBODY></TABLE></TD></TR>
 </TBODY></TABLE>
 
  </center>
  <center>
<jsp:include page="index_bottom.jsp"></jsp:include>
</center>
  </body>
</html>
