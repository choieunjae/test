<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>ENJOY BAG!</title>
<link href="css/bag.css" media="all" rel="stylesheet" />
<%@ page info="left_Frame" errorPage="error.jsp" %>
<%@ page contentType="text/html; charset=euc-kr" %> 
<% request.setCharacterEncoding("euc-kr"); %>
<%
 Object mem_name  = session.getAttribute("member_name"); 
 Object mem_id = session.getAttribute("member_id"); 
 session.setAttribute("member_id",mem_id);
 if(session.getValue("member_id")==null) { 
%>
<link rel="StyleSheet" href="style.css" type="text/css">
<script language="JavaScript">
 function login_check() {
  if (!document.login.userid.value) {
   alert("ID�� �Է��ϼ���!");
   document.login.userid.focus();	
   return;
  }  
  if (!document.login.password.value) {
   alert("�н����带 �Է��ϼ���!");
   document.login.password.focus();	
   return;
  }
  document.login.submit();
 }

</script>
<style type="text/css">
<!--
 .style3 {color: #FF0000}
-->
</style>
<form name ="login" method="post" action="login_process.jsp"> 

   <table width="100%" height="20"border="0" cellspacing="0" cellpadding="0">
    <tr bgcolor="#FFFFFF"> 
     <td width="45%">&nbsp;</td>
     <td width="3%" align="center" class="style1" align="center">ȸ��ID </td>
     <td width="7%"><input type="text" maxlength="16" name="userid" size='10' class="input_style1"></td>
     <td width="3%" class="style1" align="center">PASS </td>
     <td width="5%"><input type="password" maxlength="12" name="password" size='10' class="input_style1"></td>
<td width="1%">&nbsp; </td>     
<td  width="14%"class='style2' align="right"><a href="javascript:login_check()">�α���</a>&nbsp;<a href="insert_page.jsp" target="_top">ȸ������&nbsp;</a><a href="sale_list.jsp" target="_top">��ٱ���&nbsp;</a></a><a href="admin.jsp" target="_top">�����ڸ��</td>
    </tr>      
   </table>

</form>
<% } 
else{ 
%>
<link rel="stylesheet" href="style.css" type="text/css">
 <tr> 
  <td height="20" bgcolor='#FFFFFF'> 
   <table width="100%" border="0" cellspacing="0" cellpadding="0">
    <tr > 
<td width="57%">&nbsp;</td>
     <td width="13%"><font class="style2"><%=mem_name%> �� ȯ���մϴ�.</font></td>
<td width="7%"><font  class="style2"><a href="logout.jsp">�α׾ƿ�</a></font></td>
 <td width="9%"><font class="style2"><a href="select.jsp" target="mainFrame">���� ���� ��ȸ</a></font></td>
 <td width="7%"><font class="style2"><a href="sale_list.jsp" target="mainFrame">��ٱ���</a></font></td>
 <td width="7%"><font class="style2"><a href="qna_list.jsp" target="mainFrame">������</a></font></td>
    </tr>
   </table>

<%
 }
%>
</head>

<body>
   <div id="wrap">
            
      <header>
	<a href="main.jsp" target="_blank">
    	<p style="text-align: center;"><img class="logo" src="images/logo.png" alt="logo"></a> </p>  
            <div id="top">
	<div class="product">
	<class="product"><a href="admin_product.jsp">��ǰ ����ϱ� (������)</a>
	</div>
 
	</div>

         <ul id="nav">
<!--     	<li><a href="searchfilter.jsp">����˻�����</a></li> -->
<!-- 		<li><a href="backpack.jsp">����</a></li> -->
<!-- 		<li><a href="crossbag.jsp">ũ�ν���</a></li> -->
<!-- 		<li><a href="hipeco.jsp">����/���ڹ�</a></li> -->
<!-- 		<li><a href="clutchwallet.jsp">Ŭ��ġ/����</a></li> -->
<!-- 		<li><a href="carrier.jsp">ĳ����</a></li> -->
<!-- 		<li><a href="photo_list.jsp">���丮��</a></li> -->
<!-- 		<li><a href="qna_list.jsp">QnA</a></li> -->
		</ul>
      </header>
<img  class="main" src="images/main_banner.jpg">
<ul id="best">
<p class="text" style="font-weight:bold; font-size:1.5em"> BEST RANKING </p>
<li>
<div class="best_item">
<img class="best" src="images/bestbag_1.jpg">
<div class="desc">
<p class="name">�������� ��뷮 �޽����� ũ�ν���</p>
<p class="price">
<span class="sale_price">68,780��</span>
<del>74,000��</del>
</p>
</div>
</div>
</li> 
<li>
<div class="best_item">
<img class="best" src="images/bestbag_2.jpg">
<div class="desc">
<p class="name">�ܽ����� ��Ʃ��Ʈ</p>
<p class="price">
<span class="sale_price">56,610��</span>
<del>62,900��</del>
</p>
</div>
</div>
</li>
<li><div class="best_item">
<img class="best" src="images/bestbag_3.jpg">
<div class="desc">
<p class="name">[������] Double Youth Backpack (black) ����</p>
<p class="price">
<span class="sale_price">52,000��</span>
<!-- <del>50000��</del> -->
</p>
</div>
</div>
</li>
<li><div class="best_item">
<img class="best" src="images/bestbag_4.jpg">
<div class="desc">
<p class="name">ű�ø� ���� ��_I006288.89.00</p>
<p class="price">
<span class="sale_price">119,000��</span>
<del>128,000��</del>
</p>
</div>
</div>
</li>
<li><div class="best_item">
<img class="best" src="images/bestbag_5.jpg">
<div class="desc">
<p class="name">MARK RYDEN ��ũ���̵� ��Ʈ�� �л� ������ ���� MR0018B</p>
<p class="price">
<span class="sale_price">85,000��</span>
<!-- <del>50000��</del> -->
</p>
</div>
</div>
</li>
</ul>
<footer>
<div class="util_menu"  style="height:50px; border-top:2px solid #96b6fa; border-bottom:2px solid #96b6fa;">
<span class="ft_1">�̿���</span>
<span>|</span>
<span class="ft_1">����������޹�ħ</span>
</div>
<span class="name" style="padding-top:2%;">Ȩ������ ��ǥ : ������</span>
<span class="tel" style="padding-top:2%;">����ó : 032-770-8114</span>
<span class="addr" style="padding-top:2%;">�ּ� : ��õ������ ���� ����� 113</span>
</footer>
</div>
</div>
</body>
</html>