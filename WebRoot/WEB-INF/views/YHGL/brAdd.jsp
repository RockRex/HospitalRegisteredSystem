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
<script type="text/javascript" src="${path}/js/jquery-1.4.js"></script>
<script type="text/javascript">
$(function(){
	$(":input[name=patientId]").change(function(){
		var val = $(this).val();
		val = $.trim(val);
		var $this = $(this);
		var check=$(checkid);
		if(val != ""){
			//把当前节点后面的所有 font 兄弟节点删除
			check.html("");
			var url = "PatientAction-validateId";
			var args = {"regid":val, "time":new Date()};
			$.post(url, args, function(data){
				//表示可用
				if(data == "1"){
					$(check).attr("color", "green");
					check.html("该账户可用!");
				}
				//不可用
				else if(data == "0"){
					$(check).attr("color", "red");
					check.html("该账户不可用!");		
				}
				//服务器错误
				else{
					alert("服务器错误!");
				}
			});
		}else{
			alert("登录账户不能为空");
			$(this).val("");
			$this.focus();
		}
	});
});
</script>
  </head>
  
  <body>
  <form action="PatientAction-save" method="post" name="f1" onsubmit="return ck()">
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td>
    <table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#c9c9c9">
    <s:if test="#request.status == 1 ">
    <tr>
        <td height="22" bgcolor="#FFFFFF">
        	<div align="center"><span class="STYLE3">登录账号</span></div>
        </td>
        <td height="22" bgcolor="#FFFFFF">
        	<div><span class="STYLE3">
        	<s:textfield  name="patientId" id="patientId" onkeyup="value=value.replace(/[^\d]/g,'')"></s:textfield>
        	</span><font id="checkid" color='green'></font></div>
        </td>
      </tr>
    </s:if>
    <s:else>
    <tr>
        <td height="22" bgcolor="#FFFFFF">
        	<div align="center"><span class="STYLE3">登录账号</span></div>
        </td>
        <td height="22" bgcolor="#FFFFFF">
        	<div><span class="STYLE3">
        	<s:textfield  name="patientId" id="patientId" disabled="true"></s:textfield>
        	</span></div>
        </td>
      </tr>
    </s:else>
    <tr>
        <td height="22" bgcolor="#FFFFFF">
        	<div align="center"><span class="STYLE3">登录密码</span></div>
        </td>
        <td height="22" bgcolor="#FFFFFF">
        	<div><span class="STYLE3">
        	<s:textfield  name="patientPassword" id="patientPassword" type="password"></s:textfield>
        	</span></div>
        </td>
      </tr>
      <tr>
        <td height="22" bgcolor="#FFFFFF">
        	<div align="center"><span class="STYLE3">姓名</span></div>
        </td>
        <td height="22" bgcolor="#FFFFFF">
        	<div><span class="STYLE3">
        	<s:textfield  name="patientName" id="patientName"></s:textfield>
        	</span></div>
        </td>
      </tr>
      <tr>
        <td height="22" bgcolor="#FFFFFF">
        	<div align="center"><span class="STYLE3">性别</span></div>
        </td>
        <td height="22" bgcolor="#FFFFFF">
        	<div><span class="STYLE3">
        	<s:select list="#{'女':'女','男':'男'}" id="patientSex" name="patientSex">
            </s:select>
        	</span></div>
        </td>
      </tr>
      <tr>
        <td height="22" bgcolor="#FFFFFF">
        	<div align="center"><span class="STYLE3">年龄</span></div>
        </td>
        <td height="22" bgcolor="#FFFFFF">
        	<div><span class="STYLE3">
        	<s:textfield  name="patientAge" id="patientAge"></s:textfield>
        	</span></div>
        </td>
      </tr>
      <tr>
        <td height="22" bgcolor="#FFFFFF">
        	<div align="center"><span class="STYLE3">联系方式</span></div>
        </td>
        <td height="22" bgcolor="#FFFFFF">
        	<div><span class="STYLE3">
        	<s:textfield  name="patientTel" id="patientTel"></s:textfield>
        	</span></div>
        </td>
      </tr>
      <tr>
        <td height="22" bgcolor="#FFFFFF">
        	<div align="center"><span class="STYLE3">身份证号</span></div>
        </td>
        <td height="22" bgcolor="#FFFFFF">
        	<div><span class="STYLE3">
        	<s:textfield  name="patientIdcard" id="patientIdcard"></s:textfield>
        	</span></div>
        </td>
      </tr>
		<tr>
        <td height="22" bgcolor="#FFFFFF" colspan="2" align="center">
        	<div><span class="STYLE3">
        		<input type="submit" value="提交" />
        		<input type="reset" value="重置" />
        	</span></div>
        </td>
      </tr>
    </table></td>
  </tr>
</table>
</form>
<script type="text/javascript">
	function ck(){
		if(f1.patientId.value==""){
			alert("用户号不能为空");
			return false;
		}if(f1.patientPassword.value==""){
			alert("密码不能为空");
			return false;
		}if(f1.patientName.value==""){
			alert("姓名不能为空");
			return false;
		}if(f1.tel.patientTel==""){
			alert("电话不能为空");
			return false;
		}if(f1.patientIdcard.value==""){
			alert("身份证不能为空");
			return false;
		}
	}
</script>
  </body>
</html>
