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
<script language="javascript" type="text/javascript" src="${path}/js/datepicker/WdatePicker.js"></script>
<script type="text/javascript" src="${path}/js/jquery-1.4.js"></script>
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
  
  <body >
  <form action="NoticeAction-save" method="post" name="f1" onsubmit="return ck()">
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td>
    <table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#c9c9c9">
      <tr>
        <td height="22" bgcolor="#FFFFFF">
        	<div align="center"><span class="STYLE3">新闻标题</span></div>
        </td>
        <td height="22" bgcolor="#FFFFFF">
        	<div><span class="STYLE3">
        	<s:textfield  name="noticeTitle" id="noticeTitle"></s:textfield>
			<s:textfield  name="noticeId" id="noticeId" type="hidden"></s:textfield>
			<s:textfield  name="noticeSavetime" id="noticeSavetime" type="hidden"></s:textfield>
			<script language="javascript" type="text/javascript">
			var realtime=document.getElementById("noticeSavetime");
			var now = new Date();
			var year = now.getFullYear();
			var month = now.getMonth()+1;
			var monthStr=month.toString();
			if(month<10)
			{
				monthStr="0"+month;
			}
			var day = now.getDate();
			var dayStr=day.toString();
			if(day<10)
			{
				dayStr="0"+day;
			}
			var currentime = year + "-" + monthStr + "-" + dayStr;
			realtime.value=currentime;
			</script>
			
			
        	</span></div>
        </td>
      </tr>
      <tr>
        <td height="22" bgcolor="#FFFFFF">
        	<div align="center"><span class="STYLE3">内容</span></div>
        </td>
        <td height="22" bgcolor="#FFFFFF">
        	<div><span class="STYLE3">
        	<s:textarea name="noticeContent" id="noticeContent" cols="80" rows="5"></s:textarea>
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
		if(f1.noticeTitle.value==""){
			alert("日期不能为空");
			return false;
		}
	}
</script>
  </body>
</html>
