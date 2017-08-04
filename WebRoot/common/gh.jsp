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
  <FORM onsubmit="return ck()" method=post name=f1 action="/yyghsys/tms?ac=ghadd">
  <input type="hidden" id="uname" name="uname" value=""/>
    <input type="hidden" id="id" name="id" value=""/>
   <TABLE border=0 cellSpacing=0 cellPadding=0 width=720 align=center height=282>
  <TBODY>
  <TR>
    <TD height=25 align=middle>&nbsp; </TD></TR>
  <TR>
    <TD class=lfont height=33 align=middle><B>预约挂号</B></TD></TR>
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
                  <P>科室： </P></TD>
                <TD height=40 width="59%"><INPUT id=ks class=inputtxt 
                  name=ks value="" readonly==true>  </TD></TR>
              <TR>
                <TD height=40 width="41%" align=right>预约日期： </TD>
                <TD height=40 width="59%"><INPUT id=yytime class=inputtxt 
                  type=text name=yytime  onclick="WdatePicker({dateFmt:'yyyy-MM-dd'});" readonly==true></TD></TR>
                  <script type="text/javascript" src="/yyghsys/js/calendar/WdatePicker.js"></script>
              <TR>
                <TD height=40 width="41%" align=right>病人姓名： </TD>
                <TD height=40 width="59%"><INPUT id=tname class=inputtxt 
                  type=text name=tname></TD></TR>
              <TR>
                <TD height=40 width="41%" align=right>病人性别： </TD>
                <TD height=40 width="59%" align=left>
                	<select id="sex" name="sex">
        			<option value="男">男</option>
        			<option value="女">女</option>
        		</select>
                </TD>
              </TR>
               <TR>
                <TD height=40 width="41%" align=right>病人年龄： </TD>
                <TD height=40 width="59%"><INPUT id=age class=inputtxt 
                  type=text name=age></TD>
              </TR>
              <TR>
                <TD height=40 width="41%" align=right>病人电话： </TD>
                <TD height=40 width="59%"><INPUT id=tel class=inputtxt 
                  type=text name=tel></TD>
              </TR>
              <TR align=middle>
                <TD height=28 colSpan=2><INPUT class=Btn value=提交预约 type=submit name=Submit> 
                </TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></TD></TR>
 </TBODY></TABLE>
  </FORM>
  <script type="text/javascript">
  	function ck(){
  		if (f1.tname.value==""){
			alert("请输入姓名！");
			return false;
		}
		if (f1.age.value==""){
			alert("请输入年龄！");
			return false;
		}if (f1.tel.value==""){
			alert("请输入电话！");
			return false;
		}
  	}
  </script>
  <center>
<jsp:include page="index_bottom.jsp"></jsp:include>
</center>
  </body>
</html>
