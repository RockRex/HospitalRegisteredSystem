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
<LINK rel=stylesheet type=text/css href="${path}/css/readme_files/css.css">
<LINK rel=stylesheet type=text/css href="${path}/css/readme_files/body.css">
  </head>
  
  <body topMargin=0>
<center>
<jsp:include page="index_top.jsp"></jsp:include>
<jsp:include page="navframe.jsp"></jsp:include>
</center>
   <TABLE border=0 cellSpacing=0 cellPadding=0 width=700 align=center>
  <TBODY>
  <TR>
    <TD height=30 width=681 align=middle>　<SPAN 
  class=style2>网上挂号须知</SPAN></TD></TR>
  <TR>
    <TD height=2><IMG id=register_htm_r2_c1_r1_c3_r2_c1 border=0 
      name=register_htm_r2_c1_r1_c3_r2_c1 alt="" src="" width="100%" 
  height=1></TD></TR>
  <TR>
    <TD class=style2 height=239>
      <P>1.使用网上预约挂号功能必须是<B>我院的诊疗卡用户</B>。</P>
      <P>2.如果您的诊疗卡没有开通网上服务功能，请携带诊疗卡及身份有效证件到医院门诊四楼门诊办公室开通网上服务功能。</P>
      <P>3.如果您没有领取南方医院的诊疗卡，请携带有效证件到医院门诊四楼门诊办公室申领，并开通网上服务功能。</P>
      <P>4.诊疗卡办理和开通网上预约时间为每天上午8：00-12：00，下午14：30-17：00（周末和节假日除外）。</P>
      <P>5.<B><FONT color=red>网上预约不收取任何手续费用</FONT></B>，请到医院门诊挂号处确认并就诊。</P>
      <P>6.目前暂提供妇产科、口腔科两天后起动态一周内的门诊预约挂号服务，且只能预约同一科室或同一专家号一次。</P>
      <P>7.请您根据病情进行预约，建议普通常见疾病预约专科号，疑难疾病预约专家号。</P>
      <P>8.预约成功后，<B><FONT 
      color=#ff0000>请务必记住网上预约成功后的预约流水号或把它打印出来，以便就诊时核对。</FONT></B></P>
      <P>9.请在预约就诊当天凭诊疗卡和预约流水号到医院门诊大厅1号预约挂号窗口挂号，然后到专家门诊处就诊。请您务必至少<FONT 
      color=#ff0000>提前30分钟挂号，逾期作废</FONT>。</P>
      <P>10.由于门诊诊疗时间的不确定性，您的就诊次序可能会延迟或提前，护士将根据具体情况合理安排您就诊。</P>
      <P>11.如您确定不来就诊，请一定在预约就诊日前一天的16：00之前在网上取消预约挂号，紧急取消预约的请拨电话取消（电话号码61642320 
      ，62787146），否则记违约一次。对于二次以上（包括二次）违约者，将封锁其半年内的预约挂号资格。</P>
      <P>12.若医生因特殊原因临时停诊,挂号台工作人员将给您安排其他医生就诊,不便之处,敬请原谅!</P>
      <P>13.医院保留预约挂号的最终解释权，不明之处请电话咨询 61642320 ( 8：00-12：00；14：30-17：30 
  )</P></TD></TR>
  <TR>
    <TD height=18>　挂号处咨询电话：020-61641888-87104 </TD></TR>
  <TR>
    <TD height=19 align=middle><a class=Btn href="${path}/PatientAction-menuJump?menuName=searchks">进入预约</a></TD></TR></TBODY></TABLE>
  
<center>
<jsp:include page="index_bottom.jsp"></jsp:include>
</center>
  </body>
</html>
