<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
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
  </head>
  
  <body>
  <form action="DoctorAction-list" method="post" name="f1" >
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td>
    <table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#c9c9c9">
      <tr>
        <td height="22" bgcolor="#FFFFFF" width="72">
        	<div align="center"><span class="STYLE3">登录账号</span></div>
        </td>
        <td height="22" bgcolor="#FFFFFF">
        	<div><span class="STYLE3">
        	<s:property value="doctorId" />
        	</span></div>
        </td>
        <td rowspan="4" height="80" width="100" bgcolor="#FFFFFF">
        <img border="0" src="${path}/images/doctors/${doctorImg}" width="150" height="150"/>
        </td>
      </tr>
      <tr>
        <td height="22" bgcolor="#FFFFFF">
        	<div align="center"><span class="STYLE3">姓名</span></div>
        </td>
        <td height="22" bgcolor="#FFFFFF">
        	<div><span class="STYLE3">
        	<s:property value="doctorName" />
        	</span></div>
        </td>
      </tr>
      <tr>
        <td height="22" bgcolor="#FFFFFF">
        	<div align="center"><span class="STYLE3">性别</span></div>
        </td>
        <td height="22" bgcolor="#FFFFFF" >
        	<div><span class="STYLE3">
        	<s:property value="doctorSex" />
        	</span></div>
        </td>
      </tr>
      <tr>
        <td height="22" bgcolor="#FFFFFF">
        	<div align="center"><span class="STYLE3">年龄</span></div>
        </td>
        <td height="22" bgcolor="#FFFFFF" >
        	<div><span class="STYLE3">
        	<s:property value="doctorAge" />
        	</span></div>
        </td>
      </tr>
      <tr>
        <td height="22" bgcolor="#FFFFFF">
        	<div align="center"><span class="STYLE3">电话</span></div>
        </td>
        <td height="22" bgcolor="#FFFFFF" colspan="2">
        	<div><span class="STYLE3">
        	<s:property value="doctorTel" />
        	</span></div>
        </td>
      </tr>
      <tr>
        <td height="22" bgcolor="#FFFFFF">
        	<div align="center"><span class="STYLE3">科室</span></div>
        </td>
        <td height="22" bgcolor="#FFFFFF" colspan="2">
        	<div><span class="STYLE3">
        	<s:property value="department.departmentName" />
        	</span></div>
        </td>
      </tr>
      <tr>
        <td height="22" bgcolor="#FFFFFF">
        	<div align="center"><span class="STYLE3">系统角色</span></div>
        </td>
        <td height="22" bgcolor="#FFFFFF" colspan="2">
        	<div><span class="STYLE3">
        	<s:property value="userRole.userTypeName" />
        	</span></div>
        </td>
      </tr>
      <tr>
        <td height="22" bgcolor="#FFFFFF">
        	<div align="center"><span class="STYLE3">职称</span></div>
        </td>
        <td height="22" bgcolor="#FFFFFF" colspan="2">
        	<div><span class="STYLE3">
        	<s:property value="doctorTitle" />
        	</span></div>
        </td>
      </tr>
      <tr>
        <td height="22" bgcolor="#FFFFFF">
        	<div align="center"><span class="STYLE3">身份证号</span></div>
        </td>
        <td height="22" bgcolor="#FFFFFF" colspan="2">
        	<div><span class="STYLE3">
        	<s:property value="doctorIdcard" />
        	</span></div>
        </td>
      </tr>
      <tr>
        <td height="22" bgcolor="#FFFFFF">
        	<div align="center"><span class="STYLE3">简介</span></div>
        </td>
        <td height="250" bgcolor="#FFFFFF" width="550px" colspan="2">
        	<div><span class="STYLE3">
        	<s:property value="doctorRemark" />
        	</span></div>
        </td>
      </tr>
      <tr>
        <td height="22" bgcolor="#FFFFFF" colspan="3" align="center">
        	<div><span class="STYLE3">
        		<input type="submit" value="返回" />
        	</span></div>
        </td>
      </tr>
    </table></td>
  </tr>
</table>
</form>
  </body>
</html>
