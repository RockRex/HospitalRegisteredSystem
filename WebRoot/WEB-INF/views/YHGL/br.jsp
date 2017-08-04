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
<script type="text/javascript" src="${path}/js/jquery-1.4.js"></script>
<script type="text/javascript">
$(function(){
	 $(".Delete").click(function(){
		var name = $(this).next(":input").val();
		var flag = confirm("确定要删除"+ name +"的记录吗？");
		

		if(flag){
			var $tr = $(this).parent().parent().parent().parent();
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
  <body>
  <form action="PatientAction-adminSearch" method="post">
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="30"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td>&nbsp;</td>
        <td style="padding-right:10px;"><div align="right">
          <table border="0" align="right" cellpadding="0" cellspacing="0">
            <tr>
              
              <td width="60"><table width="90%" border="0" cellpadding="0" cellspacing="0">
                  <tr>
                    <td class="STYLE1"><div align="center"><img src="${path}/images/admin/001.gif" width="14" height="14" /></div></td>
                    <td class="STYLE1"><div align="center"><a href="PatientAction-add">新增</a></div></td>
                  </tr>
              </table></td>
            </tr>
          </table>
        </div></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td><table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#c9c9c9">
    <th colspan="3"><span class="STYLE1">
    按患者姓名或身份证号：<input type="text" id="key" name="key" />&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;<input type="submit" value="查询" /></span>
    </th>
      <tr>
        <td height="22" bgcolor="#FFFFFF"><div align="center"><strong><span class="STYLE1">姓名</span></strong></div></td>
        <td height="22" bgcolor="#FFFFFF"><div align="center"><strong><span class="STYLE1">性别</span></strong></div></td>
        <td height="22" bgcolor="#FFFFFF"><div align="center"><strong><span class="STYLE1">年龄</span></strong></div></td>
        <td height="22" bgcolor="#FFFFFF"><div align="center"><strong><span class="STYLE1">手机号</span></strong></div></td>
        <td height="22" bgcolor="#FFFFFF"><div align="center"><strong><span class="STYLE1">身份证号</span></strong></div></td>
        <td height="22" bgcolor="#FFFFFF"><div align="center"><strong><span class="STYLE1">操作</span></strong></div></td>
      </tr>
      
      	<s:if test="#request.patients == null || #request.patients.size() == 0">
				<tr><td colspan="4">没有任何患者信息</td></tr>
		</s:if>
		<s:else>
			<s:iterator value="#request.patients">
				<tr>
					<td height="22" bgcolor="#FFFFFF">
					<div align="center"><span class="STYLE3">
					<a href="PatientAction-look?id=${patientId}">${patientName}</a>
					</span></div>
					</td>
        			<td height="22" bgcolor="#FFFFFF">
        			<div align="center"><span class="STYLE3">${patientSex}</span></div>
        			</td>
        			<td height="22" bgcolor="#FFFFFF">
        			<div align="center"><span class="STYLE3">${patientAge}</span></div>
        			</td>
        			<td height="22" bgcolor="#FFFFFF">
        			<div align="center"><span class="STYLE3">${patientTel}</span></div>
        			</td>
        			<td height="22" bgcolor="#FFFFFF">
        			<div align="center"><span class="STYLE3">${patientIdcard}</span></div>
        			</td>
        			<td height="22" bgcolor="#FFFFFF">
        			<div align="center"><span class="STYLE3">
        			<a href="PatientAction-look?id=${patientId}">查看</a>
        			&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
        			<a href="PatientAction-input?id=${patientId}">修改</a>
        			&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
        			<a href="PatientAction-delete?id=${patientId}" class="Delete">删除</a>
        			<input type="hidden" value="${patientName }"/>
        			</span></div>
        			</td>
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
