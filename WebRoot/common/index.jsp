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
 
  </head>
  
  <body  class=frame_class leftMargin=0 topMargin=0>
  <center>
<jsp:include page="index_top.jsp"></jsp:include>
<jsp:include page="navframe.jsp"></jsp:include>
</center>
  <FORM onsubmit="return ck()" method=post name="f1" action="PatientAction-login">
  <center>
   <TABLE border=0 cellSpacing=0 cellPadding=0 width=720  height=282>
  <TBODY>
  <TR>
    <TD class=lfont  align=middle><B>预约挂号用户登陆</B></TD></TR>
  <TR>
    <TD height=170 >
      <TABLE border=0 cellSpacing=0 borderColor=#bdbfbd borderColorDark=#ffffff 
      cellPadding=0 width="100%"  height=170>
        
        <TBODY>
        <TR>
          <TD height=168 vAlign=top >
            <TABLE border=1 cellSpacing=0 cellPadding=0 width="100%"
              height=130><TBODY>
              <TR>
                <TD height=40 width="41%" align=right>
                  <P>登陆账号： </P></TD>
                <TD height=40 width="59%"><INPUT id=uname class=inputtxt 
                  name="username"> <IMG src="${path}/images/files/user_id.gif" 
                  width=15 height=16> </TD></TR>
              <TR>
                <TD height=40 width="41%" align=right>登陆密码： </TD>
                <TD height=40 width="59%"><INPUT id=upass class=inputtxt 
                  type=password name="password"> <IMG 
                  src="${path}/images/files/psw.gif" width=15 height=16> </TD></TR>
              <TR align=middle>
                <TD height=28 colSpan=2><INPUT class=Btn value=登陆 type=submit name=Submit> 
                </TD></TR>
                <s:if test="#request.status == 1 ">
                <tr>
				<td colspan="2"><font color="red">用户名或密码错误！！</font></td>
				<tr>
				</s:if>
			</TBODY></TABLE></TD></TR></TBODY></TABLE></TD></TR>
  <TR>
    <TD height=109><pre>注意：<BR>
    ◆ 使用网上预约挂号功能必须是<B>我院的诊疗卡用户</B>
    ◆ 如果您的诊疗卡没有开通网上服务功能，请携带诊疗卡及身份有效证件到医院门诊四楼门诊办公室开通网上服务功能。
    ◆ 如果您没有领取医院的诊疗卡，请携带有效证件到医院门诊四楼门诊办公室申领，并开通网上服务功能。 
    ◆ 不明之处请电话咨询<B>0311-12345670</B>(8：00-12：00；14：30-17：30)或挂号处咨询电话：0311-12345670-123。
    ◆ 诊疗卡办理和开通网上预约时间为每天上午8：00-12：00，下午14：30-17：00（周末和节假日除外）。 
    ◆ 如果您是新用户，请阅读详细的<A href="${path}/common/readme.jsp"><U><B>预约须知</B></U></A>。 </pre>
  </TD></TR></TBODY></TABLE>
  </center>
  </FORM>
    <script type="text/javascript">
  	function ck(){
  		if (f1.username.value==""){
			alert("请输入用户名！");
			return false;
		}
		if(!isNum(f1.username.value))
		{
			alert("登陆账户只能是数字！");
			return false;
		}
		if (f1.password.value==""){
			alert("请输入密码！");
			return false;
		}
  	}
  	function isNum(str)
	{
		for (ilen = 0; ilen < str.length; ilen++) 
		{
                if (str.charAt(ilen) < '0' || str.charAt(ilen) > '9')
				 {
                       return false;
                    }
         }
            return true;
	}
  	</script>
  <center>
<jsp:include page="index_bottom.jsp"></jsp:include>
</center>
  </body>
</html>
