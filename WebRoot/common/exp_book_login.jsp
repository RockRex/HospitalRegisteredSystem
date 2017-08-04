<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>My JSP 'exp_book_login.jsp' starting page</title>
    
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
<SCRIPT language=JavaScript>
function  check() {
if (thisform.card_psw.value==""){
alert("请输入密码！");
return false;
}
if (thisform.card_id.value==""){
alert("请输入诊疗卡号码！");
return false;
}
}
</SCRIPT>
  </head>
  
  <body>
  <FORM onsubmit="return ck()" method=post name="f1" action="/yyghsys/tms?ac=blogin">
   <TABLE border=0 cellSpacing=0 cellPadding=0 width=720 align=center height=282>
  <TBODY>
  <TR>
    <TD height=25 align=middle>&nbsp; </TD></TR>
  <TR>
    <TD class=lfont height=33 align=middle><B>预约挂号用户登陆</B></TD></TR>
  <TR>
    <TD height=170 align=middle>
      <TABLE border=1 cellSpacing=0 borderColor=#bdbfbd borderColorDark=#ffffff 
      cellPadding=0 width="82%" align=center height=170>
        
        <TBODY>
        <TR>
          <TD height=168 vAlign=center align=middle>
            <TABLE border=0 cellSpacing=0 cellPadding=0 width="89%" 
              height=130><TBODY>
              <TR>
                <TD height=40 width="41%" align=right>
                  <P>登陆名： </P></TD>
                <TD height=40 width="59%"><INPUT id=uname class=inputtxt 
                  name=uname> <IMG src="files/exp_book_login_files/user_id.gif" 
                  width=15 height=16> </TD></TR>
              <TR>
                <TD height=40 width="41%" align=right>密码： </TD>
                <TD height=40 width="59%"><INPUT id=upass class=inputtxt 
                  type=password name=upass> <IMG 
                  src="files/exp_book_login_files/psw.gif" width=15 height=16> </TD></TR>
              <TR align=middle>
                <TD height=28 colSpan=2><INPUT class=Btn value=登陆 type=submit name=Submit> 
                </TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></TD></TR>
  <TR>
    <TD height=109>注意：<BR>◆ 使用网上预约挂号功能必须是<B>我院的诊疗卡用户</B><BR>◆ 
      如果您的诊疗卡没有开通网上服务功能，请携带诊疗卡及身份有效证件到医院门诊四楼门诊办公室开通网上服务功能。<BR>◆ 
      如果您没有领取南方医院的诊疗卡，请携带有效证件到医院门诊四楼门诊办公室申领，并开通网上服务功能。 <BR>◆ 
      不明之处请电话咨询<B>020-61642320</B>(8：00-12：00；14：30-17：30)或挂号处咨询电话：020-61641888-87104。<BR>◆ 
      诊疗卡办理和开通网上预约时间为每天上午8：00-12：00，下午14：30-17：00（周末和节假日除外）。<BR>◆ 
      如果您是新用户，请阅读详细的<A 
      href="readme.jsp"><U><B>预约须知</B></U></A>。 
  </TD></TR></TBODY></TABLE>
  </FORM>
    <script type="text/javascript">
  	function ck(){
  		if (f1.uname.value==""){
			alert("请输入用户名！");
			return false;
		}
		if (f1.upass.value==""){
			alert("请输入密码！");
			return false;
		}
  	}
  	<%
String no = (String)request.getAttribute("no");
if(no!=null)
{
 %>
 alert("用户名或密码错误");
 <%}%>
  </script>
  </body>
</html>
