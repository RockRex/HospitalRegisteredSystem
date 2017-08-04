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
 <script type="text/javascript" src="${path}/js/jquery-1.4.js"></script>
 <script type="text/javascript">
$(function(){
	 $(".Order").click(function(){
		var name = $(this).next(":input").val();
		var flag = confirm("确定要删除"+ name +"的这条预约吗？");
		

		if(flag){
			var $tr = $(this).parent().parent();
			//删除, 使用 ajax 的方式
			var url = this.href;
			var args = {"time":new Date()};			
			$.post(url, args, function(data){
				//若 data 的返回值为 1, 则提示 删除成功, 且把当前行删除
				if(data == "1"){
					alert("删除成功!");
					$tr.remove();
				}else{
					//若 data 的返回值不是 1, 提示删除失败. 
					alert("删除失败!");
				}
			});	
		}
		return false; 
	});
})
 </script>
  </head>
  
  <body  class=frame_class leftMargin=0 topMargin=0>
  <center>
<jsp:include page="index_top.jsp"></jsp:include>
<jsp:include page="navframe.jsp"></jsp:include>
</center>
  <FORM onsubmit="return ck()" method=post name="f1" action="/yyghsys/tms?ac=blogin">
  <center>
   <TABLE border=1 cellSpacing=0 cellPadding=0 width=720 height="375">
  <TBODY>
    <TD class=lfont  align=center><B>我的预约挂号</B></TD></TR>
  <TR>
    <TD valign="top">
      <TABLE border=0 cellSpacing=0 borderColor=#bdbfbd borderColorDark=#ffffff 
      cellPadding=0 width="100%"   >
        
        <TBODY>
        <TR>
          <TD height=168 vAlign=top >
            <TABLE border=0 cellSpacing=0 cellPadding=0 width="100%" 
              height=130><TBODY>
              <TR bgcolor="#cccccc">
                <TD height=40>科室</TD>
                <TD height=40>医生</TD>
                <TD height=40>职称</TD>
                <TD height=40>就诊日期</TD>
                <TD height=40>就诊号</TD>
                <TD height=40>建议就诊时间</TD>
                <TD height=40>状态</TD>
                <TD height=40>操作</TD>
              </TR>
            <s:if test="#request.appointments == null || #request.appointments.size() == 0">
				<tr><td>没有任何预约信息</td></tr>
			</s:if>
			<s:else>
  			<s:iterator value="#request.appointments">
  				<tr>
  					<td>${doctor.department.departmentName }</td>
  					<td>${doctor.doctorName }</td>
  					<td>${doctor.doctorTitle }</td>
  					<td>${appointmentDate }</td>
  					<td>${appointmentNum }</td>
  					<td>${appointmentRemark }</td>
  					<td>${appointmentStatus }</td>
  					<td>
  					<a href="${path}/AppointmentAction-cancel?id=${appointmentId }" class="Order">取消预约
  					</a>
  					<input type="hidden" value="${appointmentDate}"/>
  					</td>
  				</tr>
  			</s:iterator>
			</s:else>
              
           
           </TBODY></TABLE></TD></TR></TBODY></TABLE></TD></TR>
  </TBODY></TABLE>
  </center>
  </FORM>

  <center>
<jsp:include page="index_bottom.jsp"></jsp:include>
</center>
  </body>
</html>
