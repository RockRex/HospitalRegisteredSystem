<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>医院网上预约系统</title>
    
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

  </head>
  
  <body>
  <center>
<jsp:include page="index_top.jsp"></jsp:include>
<jsp:include page="navframe.jsp"></jsp:include>
</center>
  <FORM onsubmit="return ck()" method=post name=f1 action="PatientAction-infModify">
   <TABLE border=0 cellSpacing=0 cellPadding=0 width=720 align=center  height="375">
  <TBODY>
  <TR>
    <TD class=lfont align=center><B>个人信息</B></TD></TR>
  <TR>
    <TD  valign=top>
      <TABLE border=1 cellSpacing=0 borderColor=#bdbfbd borderColorDark=#ffffff 
      cellPadding=0 width="82%" align=center >
        
        <TBODY>
        <TR>
          <TD  vAlign=top align=middle>
            <TABLE border=0 cellSpacing=0 cellPadding=0 width="89%" 
              ><TBODY>
              <TR>
                <TD height=40 width="41%" align=right>
                  <P>登陆名： </P></TD>
                <TD height=40 width="59%"><s:textfield name="patientId" id="patientId" disabled="true"></s:textfield>
                 <IMG src="${path}/images/files/user_id.gif" 
                  width=15 height=16> </TD></TR>
              <TR>
                <TD height=40 width="41%" align=right>用户密码： </TD>
                <TD height=40 width="59%">
                <s:textfield name="patientPassword" id="patientPassword" class="inputtxt" type="password" ></s:textfield>
                <IMG src="${path}/images/files/psw.gif" width=15 height=16> </TD></TR>
              <TR>
                <TD height=40 width="41%" align=right>姓名： </TD>
                <TD height=40 width="59%">
                <s:textfield name="patientName" id="patientName" class="inputtxt" ></s:textfield>
                </TD>
              </TR>
              <TR>
                <TD height=40 width="41%" align=right>性别： </TD>
                <TD height=40 width="59%" align=left>
                <s:select list="#{'女':'女','男':'男'}" id="patientSex" name="patientSex">
                </s:select>
                </TD>
              </TR>
              <TR>
                <TD height=40 width="41%" align=right>年龄： </TD>
                <TD height=40 width="59%">
                <s:textfield name="patientAge" id="patientAge" class="inputtxt" ></s:textfield>
                </TD>
              </TR>
              <TR>
                <TD height=40 width="41%" align=right>电话： </TD>
                <TD height=40 width="59%">
                <s:textfield name="patientTel" id="patientTel" class="inputtxt" ></s:textfield>
                </TD>
              </TR>
              <TR>
                <TD height=40 width="41%" align=right>身份证： </TD>
                <TD height=40 width="59%">
                <s:textfield name="patientIdcard" id="patientIdcard" class="inputtxt" ></s:textfield>
                </TD>
              </TR>
              <TR align=middle>
                <TD height=28 colSpan=2><INPUT class=Btn value="提交" type=submit name=Submit> 
                </TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></TD></TR>
 </TBODY></TABLE>
  </FORM>
  <script type="text/javascript">
  	function ck(){
  		if(document.getElementById('patientPassword').value==""){
  			alert("请输入密码！");
			return false;
			
  		}
  		if (document.getElementById('patientName').value==""){
			alert("请输入姓名！");
			return false;
		}
		if (document.getElementById('oldPwd2').value==""&&
				document.getElementById('newPwd').value!=""){
			alert("请输入旧密码！");
			return false;
		}if (document.getElementById('oldPwd2').value!=""&&
				document.getElementById('newPwd').value==""){
			alert("请输入新密码！");
			return false;
		}if (document.getElementById('patientAge').value==""){
			alert("请输入年龄！");
			return false;
		}if (document.getElementById('patientTel').value==""){
			alert("请输入电话！");
			return false;
		}if (document.getElementById('patientIdcard').value==""){
			alert("请输入身份证！");
			return false;
		}
  	}
  </script>
  <center>
<jsp:include page="index_bottom.jsp"></jsp:include>
</center>
  </body>
</html>