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
    <TD >
      <TABLE border=1 cellSpacing=0 borderColor=#bdbfbd borderColorDark=#ffffff 
      cellPadding=0 width="100%"  >
        
        <TBODY>
        <th colspan="2" align="left" height="3"><font size="2">名医风采</font></th>
        <TR>
          <TD vAlign=top >
          
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
            </TD></TR>
              </TBODY></TABLE></TD></TR>
 </TBODY></TABLE>
  </center>


  <center>
<jsp:include page="index_bottom.jsp"></jsp:include>
</center>
  </body>
</html>
