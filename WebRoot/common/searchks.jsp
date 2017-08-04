<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>医院网上预约系统</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<c:set value="${pageContext.request.contextPath}" var="path" scope="page"/>
<LINK rel=stylesheet type=text/css href="${path}/css/exp_book_login_files/css.css">

  </head>
  
  <body>
  <center>
<jsp:include page="index_top.jsp"></jsp:include>
<jsp:include page="navframe.jsp"></jsp:include>
</center>
  <FORM onsubmit="return ck()" method=post name=f1 action="/yyghsys/tms?ac=reg">
   <TABLE border=0 cellSpacing=0 cellPadding=0 width=720 align=center height=282>
  <TBODY>
  <TR>
    <TD class=lfont height=33 align=middle><B>科室选择</B></TD></TR>
  <TR>
    <TD height=170 align=middle>
      <TABLE border=1 cellSpacing=0 borderColor=#bdbfbd borderColorDark=#ffffff 
      cellPadding=0 width="82%" align=center height=170>
        
        <TBODY>
        <TR>
          <TD height=168 vAlign=top align=middle>
              <s:if test="#request.departments == null || #request.departments.size() == 0">
				<h3>没有任何科室信息</h3>
			</s:if>
			<s:else>
				<TABLE border=0 cellSpacing=0 cellPadding=0 width="100%" bgcolor="#ffffff">
  			<s:iterator value="#request.departments">
  					<tr>
  					<td bgcolor="#cccccc">
  					<a href="${path}/DepartmentAction-departmentDetail?id=${departmentId }">
  						${departmentName }--${departmentType }
  					</a>
  					</td>
  					</tr>
  			</s:iterator>
    			</TABLE>
			</s:else>
              </TD></TR></TBODY></TABLE></TD></TR>
 </TBODY></TABLE>
  </FORM>
  <center>
<jsp:include page="index_bottom.jsp"></jsp:include>
</center>
  </body>
</html>
