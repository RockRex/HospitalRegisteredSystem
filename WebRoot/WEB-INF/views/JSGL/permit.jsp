<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>角色管理</title>
<style type="text/css">
<!--
.STYLE1 {font-size: 12px}
.STYLE3 {color: #707070; font-size: 12px; text-align: center; }
.STYLE5 {color: #0a6e0c; font-size: 12px; }
body {
	margin-top: 0px;
	margin-bottom: 0px;
}
.STYLE7 {font-size: 12}
-->
</style>
<c:set value="${pageContext.request.contextPath}" var="path" scope="page"/>
<script type="text/javascript" src="${path}/js/jquery-1.4.js"></script>
<script type="text/javascript">
$(function()
{//alert("4444");
	$("#role").change(
	function()
	{
		document.getElementById('yyjj').checked=false;
		document.getElementById('xwzx').checked=false;
		document.getElementById('ysxx').checked=false;
		document.getElementById('brxx').checked=false;
		document.getElementById('jsgl').checked=false;
		document.getElementById('jsqx').checked=false;
		document.getElementById('ksgl').checked=false;
		document.getElementById('yspb').checked=false;
		document.getElementById('bryy').checked=false;
		document.getElementById('lsyy').checked=false;
		document.getElementById('grxx').checked=false;
		document.getElementById('wdbr').checked=false;
		document.getElementById('yywc').checked=false;
		document.getElementById('wdpb').checked=false;
		$.ajax({
			url : "PermissionAction-permitList",
            type : "post",
            dataType : "json",
            data:{
				roleID:$.trim($("select[id=role]").val())
			},
			success : function(data)
					{
						//alert(data);
						$.each(
							data,
							function(i, item)
							{
									/**/
								if(item.permission.permissionName=="医院简介")
									document.getElementById('yyjj').checked=true;
								if(item.permission.permissionName=="新闻中心")
									document.getElementById('xwzx').checked=true;
								if(item.permission.permissionName=="医生信息")
									document.getElementById('ysxx').checked=true;
								if(item.permission.permissionName=="病人信息")
									document.getElementById('brxx').checked=true;
								if(item.permission.permissionName=="角色管理")
									document.getElementById('jsgl').checked=true;
								if(item.permission.permissionName=="角色权限")
									document.getElementById('jsqx').checked=true;
								if(item.permission.permissionName=="科室管理")
									document.getElementById('ksgl').checked=true;
								if(item.permission.permissionName=="医生排班")
									document.getElementById('yspb').checked=true;
								if(item.permission.permissionName=="病人预约")
									document.getElementById('bryy').checked=true;
								if(item.permission.permissionName=="历史预约")
									document.getElementById('lsyy').checked=true;
								if(item.permission.permissionName=="个人信息")
									document.getElementById('grxx').checked=true;
								if(item.permission.permissionName=="我的病人")
									document.getElementById('wdbr').checked=true;
								if(item.permission.permissionName=="预约完成")
									document.getElementById('yywc').checked=true;
								if(item.permission.permissionName=="我的排班")
									document.getElementById('wdpb').checked=true;
							}
						);
            		},
            		error : function(XMLHttpRequest, textStatus, errorThrown){
					alert("XMLHttpRequest.status:"+XMLHttpRequest.status);
					alert("XMLHttpRequest.readyState:"+XMLHttpRequest.readyState);
					alert("textStatus:"+textStatus);
					alert("请检查网络连接！");
					}
		});
	});
});
</script>
</head>

<body>
<center>
<s:form name="homeForm"  method="post" action ="PermissionAction-permitSet"  >
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td>
    <table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#c9c9c9">
    <th colspan="3">
    <span class="STYLE1">
    请选择角色:&nbsp;&nbsp;&nbsp;
   <s:select list="#request.userRoles" id="role"
		listKey="userRoleId" listValue="userTypeName" name="userRole.userRoleId" >
	</s:select>
	</span>
    </th>
    <tr>
        <td height="22" bgcolor="#FFFFFF"><div align="center"><strong><span class="STYLE1">权限类别</span></strong></div></td>
        <td height="22" bgcolor="#FFFFFF"><div align="center"><strong><span class="STYLE1">权限名称</span></strong></div></td>
        <td height="22" bgcolor="#FFFFFF"><div align="center"><strong><span class="STYLE1">是否授予</span></strong></div></td>
    </tr>
	<tr>
		<td height="22" bgcolor="#FFFFFF" class="STYLE3">前台管理</td>
		<td height="22" bgcolor="#FFFFFF" class="STYLE3">医院简介</td>
		<td height="22" bgcolor="#FFFFFF" align="center">
		<input type="checkbox" id="yyjj" name="yyjj" value="医院简介">
		</td>
	</tr>
	<tr>
		<td height="22" bgcolor="#FFFFFF" class="STYLE3"></td>
		<td height="22" bgcolor="#FFFFFF" class="STYLE3">新闻中心</td>
		<td height="22" bgcolor="#FFFFFF" align="center">
		<input type="checkbox" id="xwzx" name="xwzx" value="新闻中心">
		</td>
	</tr>
	<tr>
		<td height="22" bgcolor="#FFFFFF" class="STYLE3">用户管理</td>
		<td height="22" bgcolor="#FFFFFF" class="STYLE3">医生信息</td>
		<td height="22" bgcolor="#FFFFFF" align="center">
		<input type="checkbox" id="ysxx" name="ysxx" value="医生信息"></input>
		</td>
	</tr>
	<tr>
		<td height="22" bgcolor="#FFFFFF" class="STYLE3"></td>
		<td height="22" bgcolor="#FFFFFF" class="STYLE3">病人信息</td>
		<td height="22" bgcolor="#FFFFFF" align="center">
		<input type="checkbox" id="brxx" name="brxx" value="病人信息"></input>
		</td>
	</tr>
	<tr>
		<td height="22" bgcolor="#FFFFFF" class="STYLE3">权限管理</td>
		<td height="22" bgcolor="#FFFFFF" class="STYLE3">角色管理</td>
		<td height="22" bgcolor="#FFFFFF" align="center">
		<input type="checkbox" id="jsgl" name="jsgl" value="角色管理"></input>
		</td>
	</tr>
	<tr>
		<td height="22" bgcolor="#FFFFFF" class="STYLE3"></td>
		<td height="22" bgcolor="#FFFFFF" class="STYLE3">角色权限</td>
		<td height="22" bgcolor="#FFFFFF" align="center">
		<input type="checkbox" id="jsqx" name="jsqx" value="角色权限"></input>
		</td>
	</tr>
	<tr>
		<td height="22" bgcolor="#FFFFFF" class="STYLE3">行政管理</td>
		<td height="22" bgcolor="#FFFFFF" class="STYLE3">科室管理</td>
		<td height="22" bgcolor="#FFFFFF" align="center">
		<input type="checkbox" id="ksgl" name="ksgl" value="科室管理"></input>
		</td>
	</tr>
	<tr>
		<td height="22" bgcolor="#FFFFFF" class="STYLE3"></td>
		<td height="22" bgcolor="#FFFFFF" class="STYLE3">医生排班</td>
		<td height="22" bgcolor="#FFFFFF" align="center">
		<input type="checkbox" id="yspb" name="yspb" value="医生排班"></input>
		</td>
	</tr>
	<tr>
		<td height="22" bgcolor="#FFFFFF" class="STYLE3">预约管理</td>
		<td height="22" bgcolor="#FFFFFF" class="STYLE3">病人预约</td>
		<td height="22" bgcolor="#FFFFFF" align="center">
		<input type="checkbox" id="bryy" name="bryy" value="病人预约"></input>
		</td>
	</tr>
	<tr>
		<td height="22" bgcolor="#FFFFFF" class="STYLE3"></td>
		<td height="22" bgcolor="#FFFFFF" class="STYLE3">历史预约</td>
		<td height="22" bgcolor="#FFFFFF" align="center">
		<input type="checkbox" id="lsyy" name="lsyy" value="历史预约"></input>
		</td>
	</tr>
	<tr>
		<td height="22" bgcolor="#FFFFFF" class="STYLE3">个人管理</td>
		<td height="22" bgcolor="#FFFFFF" class="STYLE3">个人信息</td>
		<td height="22" bgcolor="#FFFFFF" align="center">
		<input type="checkbox" id="grxx" name="grxx" value="个人信息"></input>
		</td>
	</tr>
	<tr>
		<td height="22" bgcolor="#FFFFFF" class="STYLE3"></td>
		<td height="22" bgcolor="#FFFFFF" class="STYLE3">我的病人</td>
		<td height="22" bgcolor="#FFFFFF" align="center">
		<input type="checkbox" id="wdbr" name="wdbr" value="我的病人"></input>
		</td>
	</tr>
	<tr>
		<td height="22" bgcolor="#FFFFFF" class="STYLE3"></td>
		<td height="22" bgcolor="#FFFFFF" class="STYLE3">预约完成</td>
		<td height="22" bgcolor="#FFFFFF" align="center">
		<input type="checkbox" id="yywc" name="yywc" value="预约完成"></input>
		</td>
	</tr>
	<tr>
		<td height="22" bgcolor="#FFFFFF" class="STYLE3"></td>
		<td height="22" bgcolor="#FFFFFF" class="STYLE3">我的排班</td>
		<td height="22" bgcolor="#FFFFFF" align="center">
		<input type="checkbox" id="wdpb" name="wdpb" value="我的排班"></input>
		</td>
	</tr>
    </table></td>
  </tr>
  <tr>
    <td height="35">
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="25%" height="29" nowrap="nowrap" align="center">
        <input type="hidden" id="typeName" name="typeName">
		<input type ="button" name="Btsubmit"  onclick="changeSub()" 
		value ="提交" style="width:100px;height:30px;color:#BC8F8F" >
        </td>
      </tr>
    </table></td>
  </tr>
</table>
 </s:form>	           
</center>		    
</body>
<script type="text/javascript" src="${path}/js/jquery-1.4.js"></script>
<script type="text/javascript">
function changeSub()
{
	var typeName=document.getElementById('typeName');
	typeName.value=document.getElementById('role').value;
	homeForm.submit();
}
$.ajax({
            		url : "PermissionAction-permitList",
            		type : "post",
            		dataType : "json",
            		data:{
						roleID:$.trim($("select[id=role]").val())
						},
            		success : function(data)
					{
						//alert(data);
						$.each(
							data,
							function(i, item)
							{
									/**/
								if(item.permission.permissionName=="医院简介")
									document.getElementById('yyjj').checked=true;
								if(item.permission.permissionName=="新闻中心")
									document.getElementById('xwzx').checked=true;
								if(item.permission.permissionName=="医生信息")
									document.getElementById('ysxx').checked=true;
								if(item.permission.permissionName=="病人信息")
									document.getElementById('brxx').checked=true;
								if(item.permission.permissionName=="角色管理")
									document.getElementById('jsgl').checked=true;
								if(item.permission.permissionName=="角色权限")
									document.getElementById('jsqx').checked=true;
								if(item.permission.permissionName=="科室管理")
									document.getElementById('ksgl').checked=true;
								if(item.permission.permissionName=="医生排班")
									document.getElementById('yspb').checked=true;
								if(item.permission.permissionName=="病人预约")
									document.getElementById('bryy').checked=true;
								if(item.permission.permissionName=="历史预约")
									document.getElementById('lsyy').checked=true;
								if(item.permission.permissionName=="个人信息")
									document.getElementById('grxx').checked=true;
								if(item.permission.permissionName=="我的病人")
									document.getElementById('wdbr').checked=true;
								if(item.permission.permissionName=="预约完成")
									document.getElementById('yywc').checked=true;
								if(item.permission.permissionName=="我的排班")
									document.getElementById('wdpb').checked=true;
							}
						);
            		},
            		error : function(XMLHttpRequest, textStatus, errorThrown){
					alert("XMLHttpRequest.status:"+XMLHttpRequest.status);
					alert("XMLHttpRequest.readyState:"+XMLHttpRequest.readyState);
					alert("textStatus:"+textStatus);
					alert("请检查网络连接！");
					}
            	});



</script>
</html>