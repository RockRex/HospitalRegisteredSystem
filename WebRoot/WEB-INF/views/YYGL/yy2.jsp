<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>My JSP 'right.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<c:set value="${pageContext.request.contextPath}" var="path" scope="page"/>
<style type="text/css">
<!--
.STYLE1 {font-size: 12px}
.STYLE3 {color: #707070; font-size: 12px; }
.STYLE5 {color: #0a6e0c; font-size: 12px; }
body {
	margin-top: 0px;
	margin-bottom: 0px;
}
.STYLE7 {font-size: 12}
-->
</style>
<script language="javascript" type="text/javascript" src="${path}/js/datepicker/WdatePicker.js"></script>
<script type="text/javascript" src="${path}/js/jquery-1.4.js"></script>
<script type="text/javascript">
$(function(){
	 $(".Done").click(function(){
		var name = $(this).next(":input").val();
		var flag = confirm("已经完成了"+ name +"的这条预约吗？");
		

		if(flag){
			var $tr = $(this).parent().parent().parent().parent();
			//删除, 使用 ajax 的方式
			var url = this.href;
			var args = {"time":new Date()};			
			$.post(url, args, function(data){
				//若 data 的返回值为 1, 则提示 删除成功, 且把当前行删除
				if(data == "1"){
					alert("操作成功!");
					$tr.remove();
				}else{
					//若 data 的返回值不是 1, 提示删除失败. 
					alert("操作失败!");
				}
			});	
		}
		return false; 
	});
	
	$(".Delete").click(function(){
		var name = $(this).next(":input").val();
		var flag = confirm("确定要删除"+ name +"的这条预约吗？");
		

		if(flag){
			var $tr = $(this).parent().parent().parent().parent();
			//删除, 使用 ajax 的方式
			var url = this.href;
			var args = {"time":new Date()};			
			$.post(url, args, function(data){
				//若 data 的返回值为 1, 则提示 删除成功, 且把当前行删除
				if(data == "1"){
					alert("操作成功!");
					$tr.remove();
				}else{
					//若 data 的返回值不是 1, 提示删除失败. 
					alert("操作失败!");
				}
			});	
		}
		return false; 
	});
})

</script>
  </head>
  <body>
  <form action="AppointmentAction-search" method="post">
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="30"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td>&nbsp;</td>
        <td style="padding-right:10px;"><div align="right">

        </div></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td><table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#c9c9c9">
    <th colspan="9"><span class="STYLE1">
    <input type="hidden" id="key4" name="key4" value="完成"/>
    按照医生<input type="text" id="key1" name="key1"/>&nbsp;&nbsp;&nbsp;
    按照患者<input type="text" id="key2" name="key2"/>&nbsp;&nbsp;&nbsp;
    按照日期<input type="text" id="key3" name="key3" class="Wdate" onClick="WdatePicker({hightLineWeekDay:true,readOnly:true})"/>&nbsp;&nbsp;&nbsp;
    &nbsp;&nbsp;&nbsp;<input type="submit" value="查询" /></span>
    </th>
      <tr>
        <td height="22" bgcolor="#FFFFFF"><div align="center"><strong><span class="STYLE1">病人姓名</span></strong></div></td>
        <td height="22" bgcolor="#FFFFFF"><div align="center"><strong><span class="STYLE1">性别</span></strong></div></td>
        <td height="22" bgcolor="#FFFFFF"><div align="center"><strong><span class="STYLE1">年龄</span></strong></div></td>
        <td height="22" bgcolor="#FFFFFF"><div align="center"><strong><span class="STYLE1">电话</span></strong></div></td>
        <td height="22" bgcolor="#FFFFFF"><div align="center"><strong><span class="STYLE1">预约日期</span></strong></div></td>
        <td height="22" bgcolor="#FFFFFF"><div align="center"><strong><span class="STYLE1">预约科室</span></strong></div></td>
        <td height="22" bgcolor="#FFFFFF"><div align="center"><strong><span class="STYLE1">预约医生</span></strong></div></td>
        <td height="22" bgcolor="#FFFFFF"><div align="center"><strong><span class="STYLE1">状态</span></strong></div></td>
        
        <td height="22" bgcolor="#FFFFFF"><div align="center"><strong><span class="STYLE1">操作</span></strong></div></td>
      </tr>
      <s:if test="#request.appointments == null || #request.appointments.size() == 0">
				<tr><td colspan="4">没有任何预约信息</td></tr>
		</s:if>
		<s:else>
			<s:iterator value="#request.appointments">
				<tr>
					<td height="22" bgcolor="#FFFFFF"><div align="center">
					<span class="STYLE3">${patient.patientName}</span></div></td>
        			<td height="22" bgcolor="#FFFFFF"><div align="center">
        			<span class="STYLE3">${patient.patientSex}</span></div></td>
        			<td height="22" bgcolor="#FFFFFF"><div align="center">
        			<span class="STYLE3">${patient.patientAge}</span></div></td>
        			<td height="22" bgcolor="#FFFFFF"><div align="center">
        			<span class="STYLE3">${patient.patientTel}</span></div></td>
        			<td height="22" bgcolor="#FFFFFF"><div align="center">
        			<span class="STYLE3">${appointmentDate}</span></div></td>
        			<td height="22" bgcolor="#FFFFFF"><div align="center">
        			<span class="STYLE3">${doctor.department.departmentName}</span></div></td>
        			<td height="22" bgcolor="#FFFFFF"><div align="center">
        			<span class="STYLE3">${doctor.doctorName}</span></div></td>
        			<td height="22" bgcolor="#FFFFFF"><div align="center">
        			<span class="STYLE3">${appointmentStatus}</span></div></td>
        			<td height="22" bgcolor="#FFFFFF"><div align="center">
        			<span class="STYLE3">
        			<a href="AppointmentAction-cancel?id=${appointmentId}" class="Delete">删除</a>
        			<input type="hidden" value="${patient.patientName}"/>
        			</span></div></td>
				</tr>
			</s:iterator>
		</s:else>
     
        
     
    </table></td>
  </tr>
  <tr>
    <td height="35">
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="25%" height="29" nowrap="nowrap">
        
        </td>
      </tr>
    </table></td>
  </tr>
</table>
</form>
  </body>
</html>
