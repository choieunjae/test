<%@ page info="insert" errorPage="error.jsp" %>
<%@ page contentType="text/html; charset=euc-kr" %> 
<%@ page language="java" import="java.sql.*,java.text.*,java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>ENJOY BAG!</title>
<link href="css/bag.css" media="all" rel="stylesheet" /> 
<% request.setCharacterEncoding("euc-kr"); %>
<%@ page import="java.net.URLEncoder" %>
<%
 Object mem_name  = session.getAttribute("member_name"); 
 Object mem_id = session.getAttribute("member_id"); 
 session.setAttribute("member_id",mem_id);
 if(session.getValue("member_id")==null) { 
%>
<link rel="StyleSheet" href="bag.css" type="text/css">
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
     <td width="7%" align="center" class="style1" align="center">ȸ��ID </td>
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
    	<li><a href="searchfilter.jsp">����˻�����</a></li>
		<li><a href="backpack.jsp">����</a></li>
		<li><a href="crossbag.jsp">ũ�ν���</a></li>
		<li><a href="hipeco.jsp">����/���ڹ�</a></li>
		<li><a href="clutchwallet.jsp">Ŭ��ġ/����</a></li>
		<li><a href="carrier.jsp">ĳ����</a></li>
		<li><a href="photo_list.jsp">���丮��</a></li>
		<li><a href="qna_list.jsp">QnA</a></li>
		</ul>
      </header>
<%
 String userid	= request.getParameter("userid");
 String username	= request.getParameter("username");
 String password	= request.getParameter("password");
 String email		= request.getParameter("email");
 String zipcode1	= request.getParameter("zipcode1");
 String zipcode2	= request.getParameter("zipcode2");
 String zipcode	= zipcode1+"-"+zipcode2;
 String address1	= request.getParameter("address1");
 String address2	= request.getParameter("address2");
 String phone1 = request.getParameter("phone1");
 String phone2 = request.getParameter("phone2");
 String phone3 = request.getParameter("phone3");
 String phone	= phone1+"-"+phone2+"-"+phone3;
 String query		= new String();
 Connection conn = null;
 ResultSet  rs= null;
 PreparedStatement pstmt = null;

 java.util.Date yymmdd = new java.util.Date() ;
 SimpleDateFormat myformat = new SimpleDateFormat("yy-MM-d h:mm a");
 String regdate=myformat.format(yymmdd);

 try {
  Class.forName("org.gjt.mm.mysql.Driver");
 } catch (ClassNotFoundException e ) {
  out.println(e);
 }

 try {
  conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/member?useUnicode=true&characterEncoding=euckr","root","1234");
  query = "insert into member values ( ?, ?, ?, ?, ?, ?, ?, ?, ?)";
  pstmt = conn.prepareStatement(query);
  pstmt.setString(1, userid);
  pstmt.setString(2, username);            
  pstmt.setString(3, password);
  pstmt.setString(4, email);
  pstmt.setString(5, zipcode1+"-"+zipcode2);
  pstmt.setString(6, address1);
  pstmt.setString(7, address2);            
  pstmt.setString(8, phone1+"-"+phone2+"-"+phone3);            
  pstmt.setString(9, regdate);
  pstmt.executeUpdate();
 } catch(SQLException e){
  out.println("<script>alert('����ó���� ���� �ʾҽ��ϴ�. �ٽ� �õ��� �ּ���.'); history.back();</script>");
 } finally {
  conn.close();
 }
%>

<html>
<head>
<title>���� �Ϸ�</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link rel="StyleSheet" href="style.css" type="text/css">
<script language="JavaScript">

function doSubmit() {
 form = document.join;
 if(!form.userid.value){
  alert('���̵� �Է����� �ʾҽ��ϴ�.');
  form.userid.focus();
  return;
  }
 form.submit();
}

</script>
</head>
<body text="#000000" bgcolor="#FFFFFF">
<br>
<br>
<form name="join" method="post" action="modify.jsp">
<input type=hidden name="userid" value="<%=userid%>">
<input type=hidden name="mode" value="modify">
<table width="80%"  cellpadding="3" cellspacing="0" align="center" >
<tr align="center"> 
   <td colspan="5" height="1" bgcolor="#e8f0ff"></td>
  </tr>
 <tr align="center"> 
  <td colspan="2"  height="60px;"  >������ ���ϵ帳�ϴ�. �Է��Ͻ� ������ Ȯ���ϼ���.</td>
 </tr>
 <tr align="center"> 
   <td colspan="5" height="1" bgcolor="#e8f0ff"></td>
  </tr>
 <tr> 
  <td width="15%" align="center" bgcolor=#e8f0ff height="40px;" border-bottom="1px solid #444444;"><font size="2">���̵�</font></td>
  <td width="75%"><%=userid%></td>
 </tr>
 <tr> 
  <td width="15%"align="center" bgcolor=#e8f0ff height="40px;" border-bottom="1px solid #444444;"><font size="2">�̸�</font></td>
  <td width="75%"><%=username%></td>
 </tr>
 <tr> 
  <td width="15%" align="center" bgcolor=#e8f0ff height="40px;"  border-bottom="1px solid #444444;"><font size="2">��й�ȣ</font></td>
  <td width="75%">���Ȼ� �������� �ʽ��ϴ�.</td>
 </tr>
 <tr> 
  <td width="15%" align="center" bgcolor=#e8f0ff height="40px;"  border-bottom="1px solid #444444;"><font size="2">E-MAIL</font></td>
  <td width="75%"><%=email%></td>
 </tr>
 <tr> 
  <td width="15%" align="center" bgcolor=#e8f0ff height="40px;"  border-bottom="1px solid #444444;"><font size="2">�����ȣ</font></td>
  <td width="75%"><%=zipcode1+"-"+zipcode2%></td>
 </tr>
 <tr> 
  <td width="15%" align="center" bgcolor=#e8f0ff height="40px;"  border-bottom="1px solid #444444;"><font size="2">�ּ�</font></td>
  <td width="75%"><%=address1%></td>
 </tr>
 <tr> 
  <td width="15%" align="center" bgcolor=#e8f0ff height="40px;"  border-bottom="1px solid #444444;"><font size="2">���ּ�</font></td>
  <td width="75%"><%=address2%></td>    
 </tr>
 <tr> 
  <td width="15%" align="center" bgcolor=#e8f0ff height="40px;"  border-bottom="1px solid #444444;"><font size="2">�޴���</font></td>
  <td width="75%">
  <% 
   if(phone.equals("--")) {
    out.println("<font color='blue'>�������� �ʾҽ��ϴ�.</font>");
	 }else{
	  out.println(phone); 
	 } 
	%>
	</td>
 </tr>
 <tr >
  <td colspan="2" align="center">
   <input type="button" class=ok2 value=" " onClick="location='main.jsp'">
   <input type="button" class=edit value=" " onClick="doSubmit()"></td>
 </tr>
</table>
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