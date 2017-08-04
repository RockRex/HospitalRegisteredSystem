<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
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
  <form action="DepartmentAction-save" method="post" name="f1" onsubmit="return ck()">
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td>
    <table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#c9c9c9">
      <tr>
        <td height="22" bgcolor="#FFFFFF">
        	<div align="center"><span class="STYLE3">科室名称</span></div>
        </td>
        <td height="22" bgcolor="#FFFFFF">
        	<div><span class="STYLE3">
        	<s:textfield  name="departmentName" id="departmentName"></s:textfield>
        	<s:textfield  name="departmentId" id="departmentId" type="hidden"></s:textfield>
        	</span></div>
        </td>
      </tr>
      <tr>
        <td height="22" bgcolor="#FFFFFF">
        	<div align="center"><span class="STYLE3">类别</span></div>
        </td>
        <td height="22" bgcolor="#FFFFFF">
        	<div><span class="STYLE3">
        	<s:select list="#{'内科':'内科','外科':'外科',
        	'妇产科':'妇产科','儿科':'儿科','眼科':'眼科',
        	'口腔科':'口腔科','耳鼻喉科':'耳鼻喉科','中医科':'中医科'}"
        	 id="departmentType" name="departmentType">
            </s:select>
        	</span></div>
        </td>
      </tr>

      <tr>
        <td height="22" bgcolor="#FFFFFF">
        	<div align="center"><span class="STYLE3">科室简介</span></div>
        </td>
        <td height="22" bgcolor="#FFFFFF">
        	<div><span class="STYLE3">
        	<s:textarea name="departmentRemark" id="departmentRemark" cols="80" rows="5"></s:textarea>
        	
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
		if(f1.name.value==""){
			alert("科室名称不能为空");
			return false;
		}
	}
</script>
  </body>
</html>
