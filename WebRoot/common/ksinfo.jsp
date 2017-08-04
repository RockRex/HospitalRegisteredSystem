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
  <FORM onsubmit="return ck()" method=post name=f1 action="/yyghsys/tms?ac=ghadd">
    <input type="hidden" id="id" name="id" value=""/>
   <TABLE border=0 cellSpacing=0 cellPadding=0 width=720 align=center >
  <TBODY>
  <TR>
    <TD height=25 align=middle>&nbsp; </TD></TR>
  <TR>
    <TD class=lfont height=33 align=middle><B>科室信息</B></TD></TR>
  <TR>
    <TD  align=middle>
      <TABLE border=0 cellSpacing=0 borderColor=#bdbfbd borderColorDark=#ffffff 
      cellPadding=0 width="100%" >
       
         
        <TBODY>
        <TR>
          <TD  vAlign=center align=middle>
            <TABLE border=1 cellSpacing=0 cellPadding=0 width="100%" height=130>
            <TBODY>
            <TR>
                <TD height=40 width="15%" align=right>
                  <P>科室名称： </P></TD>
                <TD height=40 align="left">
                <s:property value="departmentName" /></TD></TR>
            <TR>
                <TD height=40 width="15%" align=right>
                  <P>科室类别： </P></TD>
                <TD height=40 align="left">
                <s:property value="departmentType" /></TD></TR>
              <TR>
                <TD height=40 width="15%" align=right>
                  <P>科室简介： </P></TD>
                <TD height=40 align="left"><s:property value="departmentRemark" /></TD></TR>
              <TR>
              
                <TD height=40  align=right>科室医生： </TD>
                <TD height=40 >
                	
            <s:if test="#request.doctors == null || #request.doctors.size() == 0">
				<h3>没有任何医生信息</h3>
			</s:if>
			<s:else>
				<TABLE border=0 cellSpacing=0 cellPadding=0 width="100%" bgcolor="#ffffff"><tr>
  			<s:iterator value="#request.doctors">
  					
  					<td>
  					<a href="${path}/DoctorAction-doctorDetail?id=${doctorId }"><img border="0" src="${path}/images/doctors/${doctorImg}" width="80" height="80"/></a>
  					<br>
  					<a href="${path}/DoctorAction-doctorDetail?id=${doctorId }">${doctorName }</a>
  					</td>
  			</s:iterator>
    			</tr></TABLE>
			</s:else>
                	
                </TD>
                </TR>
                
             </TBODY></TABLE></TD></TR></TBODY></TABLE></TD></TR>
 </TBODY></TABLE>
  </FORM>
  <center>
<jsp:include page="index_bottom.jsp"></jsp:include>
</center>
  </body>
</html>
