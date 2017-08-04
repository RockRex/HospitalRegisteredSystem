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

<script type="text/javascript" src="${path}/js/jquery-1.4.js"></script>
<script type="text/javascript">
$(function(){
	 $(".Order").click(function(){
	 		var url = this.href;
			var args = {"time":new Date()};			
			$.post(url, args, function(data){
				//返回码含义
				//已有相同预约500
				//达到了人数限制501
				//成功502
				//错误404
				if(data == "500"){
					alert("已有相同预约!");
				}
				else if(data == "501"){
					alert("预约已达到上限!");
				}
				else if(data == "404"){
					alert("预约失败!");
				}
				else if(data == "502"){
					alert("预约成功!");
					window.location.reload();
				}
			});	
		return false; 
	});
})

</script>
  </head>
  
  <body>
  <center>
<jsp:include page="index_top.jsp"></jsp:include>
<jsp:include page="navframe.jsp"></jsp:include>
</center>
    <input type="hidden" id="id" name="id" value=""/>
   <TABLE border=0 cellSpacing=0 cellPadding=0 width=720 align=center >
  <TBODY>
  <TR>
    <TD class=lfont  align=top><B>医生信息</B></TD></TR>
  <TR>
    <TD  align=top>
      <TABLE border=0 cellSpacing=0 borderColor=#bdbfbd borderColorDark=#ffffff 
      cellPadding=0 width="100%" >
       
         
        <TBODY>
        <tr>
        	<td>
        	 <TABLE border=1 cellSpacing=0 cellPadding=0 width="100%" >
            <TBODY>
            <tr>
	            <td width="140px">医生姓名</td>
	            <td><s:property value="doctorName" /></td>
            </tr>
            <tr>
	            <td>性别</td>
	            <td><s:property value="doctorSex" /></td>
            </tr>
            <tr>
	            <td>年龄</td>
	            <td><s:property value="doctorAge" /></td>
            </tr>
            <tr>
	            <td>电话</td>
	            <td><s:property value="doctorTel" /></td>
            </tr>
            <tr>
	            <td>职称</td>
	            <td><s:property value="doctorTitle" /></td>
            </tr>
            <tr>
	            <td>简介</td>
	            <td><s:property value="doctorRemark" /></td>
            </tr>
            
              		
              </TBODY>
              </TABLE>
              <TR>
        	</td>
        </tr>
        <TR>
          <TD  vAlign=center align=middle>
            <TABLE border=1 cellSpacing=0 cellPadding=0 width="100%" height=130>
            <TBODY>
              
              <TR>
                <TD height=40  align=right>排班信息： </TD>
                <TD height=40 >
                	<table width="100%" border="0">
                		<tr>
							<Td>日期</Td> 
							<Td>预约上限</Td>
							<Td>已预约人数</Td>
							<Td>操作</Td>               		
                		</tr>
          <s:if test="#request.workforces == null || #request.workforces.size() == 0">
				<tr><td colspan="3">没有任何排班信息</td></tr>
		  </s:if>
		   <s:else>
			    <s:iterator value="#request.workforces">
				  <tr>
				    <td height="22" bgcolor="#FFFFFF">
        			<div align="center"><span class="STYLE3">
        			${workforceDate}</span></div>
        			</td>
        			<td height="22" bgcolor="#FFFFFF">
        			<div align="center"><span class="STYLE3">
        			${workforcePatNum}</span></div>
        			</td>
        			<td height="22" bgcolor="#FFFFFF">
        			<div align="center"><span class="STYLE3">
        			${workforceAppNum}</span></div>
        			</td>
        			<td height="22" bgcolor="#FFFFFF">
        			
        			<div align="center"><span class="STYLE3">
        			<s:if test="#request.status == 2 ">
        			<a href="${path}/PatientAction-makeAppointment?id=${workforceId}" class="Order">预约</a>
        			</s:if>
        			<s:else>
        			<a href="${path}/PatientAction-menuJump?menuName=index">登录</a>
        			</s:else>
        			</span></div>
        			
        			</td>
				</tr>
			</s:iterator>
		</s:else>
                	</table>
                </TD>
                </TR>
                
             </TBODY></TABLE></TD></TR></TBODY></TABLE></TD></TR>
 </TBODY></TABLE>
  <center>
<jsp:include page="index_bottom.jsp"></jsp:include>
</center>
  </body>
</html>
