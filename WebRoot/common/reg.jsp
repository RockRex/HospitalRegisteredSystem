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
})
</script>
</head>
  
  <body>
  <center>
<jsp:include page="index_top.jsp"></jsp:include>
<jsp:include page="navframe.jsp"></jsp:include>
</center>
  <FORM onsubmit="return ck()" method=post name=f1 action="PatientAction-newPatient">
   <TABLE border=0 cellSpacing=0 cellPadding=0 width=720 align=center height=282>
  <TBODY>
  <TR>
    <TD class=lfont  align=top><B>用户注册</B></TD></TR>
  <TR>
    <TD height=170 align=middle>
      <TABLE border=1 cellSpacing=0 borderColor=#bdbfbd borderColorDark=#ffffff 
      cellPadding=0 width="100%" align=center height=170>
        
        <TBODY>
        <TR>
          <TD height=168 vAlign=top align=middle>
            <TABLE border=0 cellSpacing=0 cellPadding=0 width="89%" 
              ><TBODY>
              <TR>
                <TD height=40 width="41%" align=right>
                  <P>登陆账户： </P></TD>
                <TD height=40 width="59%"><s:textfield name="patientId" id="patientId"></s:textfield>
                 <IMG src="${path}/images/files/user_id.gif" id="idimage"
                  width=15 height=16><font id="checkid" color='green'></font></TD></TR>
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

  <center>
<jsp:include page="index_bottom.jsp"></jsp:include>
</center>
  </body>
</html>
