<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>My JSP 'index_top.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<c:set value="${pageContext.request.contextPath}" var="path" scope="page"/>
<LINK rel=stylesheet type=text/css href="${path}/css/index_top_files/css.css">
</head>

<body leftMargin=0 topMargin=0>
	<TABLE border=0 cellSpacing=0 cellPadding=0 width=750
		background="${path}/images/files/top_logo.gif" height=80>
		<TBODY>
			<TH scope=row>
				<form action="${path}/PatientAction-search" method="post">
					<TABLE border=0 align=right>
						<TBODY>
							<tr height="50px"><td></td></tr>
							<TR>
								<TD vAlign=center><select id="key1" name="key1" style="height:22px">
										<option value="1">科室</option>
										<option value="2">医生</option>
								</select>
								<input type="text" id="key2" name="key2" size="5"> <input
									type="submit" value="搜索">
								</TD>
								<TD vAlign=center width=51px>|&gt;<A href="${path}/PatientAction-menuJump?menuName=welcome">首页</A>
								</TD>
								<TD vAlign=center width=70px>|&gt;<A href="${path}/PatientAction-menuJump?menuName=news">新闻中心</A>
								</TD>
								<TD vAlign=center width=70px>|&gt;<A href="${path}/PatientAction-menuJump?menuName=hospital">医院简介</A>
								</TD>

								
								<s:if test="#request.status == 2 ">
									<TD vAlign=center width=70px>|&gt;<A href="${path}/PatientAction-menuJump?menuName=searchks">预约挂号</A>
									</TD>
									<TD vAlign=center width=70px>|&gt;<A href="${path}/PatientAction-myAppoint">我的预约</A>
									</TD>
									<TD vAlign=center width=70px>|&gt;<A href="${path}/PatientAction-infShow">个人信息</A>
									</TD>
									<TD vAlign=center width=51px>|&gt;<A
									href="${path}/PatientAction-quitSystem">注销</A></TD>
								</s:if>
								<s:else>
									<TD vAlign=center width=70px>|&gt;<A href="${path}/PatientAction-menuJump?menuName=index">用户登陆</A>
									</TD>
									<TD vAlign=center width=70px>|&gt;<A href="${path}/PatientAction-menuJump?menuName=reg">用户注册</A>
									</TD>
								</s:else>
							</TR>
						</TBODY>
					</TABLE>
				</form>
			</TH>
			<tr>
				<table>
					<tr>
						<td><img src="${path}/images/files/process.gif" width="720"
							height="100">
						</td>
					</tr>
				</table>
			</tr>

		</TBODY>
	</TABLE>
</body>
</html>
