<%@ page contentType="text/html; charset=euc-kr" %> 
<%@ page language="java" import="java.sql.*" %> 
<%
 Object mem_id = session.getAttribute("member_id"); 
 session.putValue(session.getId(), mem_id);
 String userid = (String)session.getValue(session.getId());
 if(userid == null)
  session.putValue(session.getId(), mem_id);
 String sql="select * from member where userid=?" ;
 Connection con=null;
 PreparedStatement pst=null;    
 ResultSet rs=null;
 
 try {
  Class.forName("org.gjt.mm.mysql.Driver");
 } catch (ClassNotFoundException e){
  out.println(e.getMessage());
 }
 
 try {
  con = DriverManager.getConnection("jdbc:mysql://localhost:3306/member?useUnicode=true&characterEncoding=euckr","root","1234");
 } catch (SQLException e) {
  out.println(e);
 }
 try {
  pst = con.prepareStatement(sql);
  pst.setString(1,userid);
  rs = pst.executeQuery();  
  if (!(rs.next())) {
    
    %>
    <html>
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
	  out.println("<div class='baguni_content'style='width:30%; height:250px; margin:auto; text-align:center;'><img src='images/member.png' width=300 height=300><p style='margin:auto'></div><div class='baguni_footer'style='width:80%; margin:auto;text-align:center;'></div>");

  } else {
   String username = rs.getString("username");
   String phone = rs.getString("phone");
%>
<html>
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
<form name="join" method="post" >
<input type=hidden name="userid" value="<%=userid%>">
<input type=hidden name="mode" value="modify">
<table width="80%"  cellpadding="3" cellspacing="0" align="center">
<tr align="center"> 
   <td colspan="5" bgcolor="#e8f0ff" height="1"></td>
  </tr>
 <tr align="center"> 
  <td colspan="2" background="image/sky_bar.gif"> <%=username%> ȸ������ ���������� ������ �����ϴ�.</td>
 </tr>
 <tr align="center"> 
   <td colspan="5" bgcolor="#e8f0ff" height="1"></td>
  </tr>
 <tr> 
  <td width="30%" height="40" align="center" bgcolor="#e6eeff" style="border-right:1px solid #e8f0ff; border-left:1px solid #e8f0ff">���̵�</td>
  <td width="70%"><%= userid %></td>
 </tr>
 <tr> 
  <td width="30%"height="40" align="center" bgcolor="#e6eeff" style="border-right:1px solid #e8f0ff; border-left:1px solid #e8f0ff">�̸�</td>
  <td width="70%"><%=username%></td>
 </tr>
 <tr> 
  <td width="30%" height="40" align="center" bgcolor="#e6eeff" style="border-right:1px solid #e8f0ff; border-left:1px solid #e8f0ff">��й�ȣ</td>
  <td width="70%">���Ȼ� �������� �ʽ��ϴ�.</td>
 </tr>
 
 <tr> 
  <td width="30%" height="40" align="center" bgcolor="#e6eeff" style="border-right:1px solid #e8f0ff; border-left:1px solid #e8f0ff">EMAIL</td>
  <td width="70%"><%=rs.getString("email")%></td>
 </tr>
 <tr> 
  <td width="30%" height="40" align="center" bgcolor="#e6eeff" style="border-right:1px solid #e8f0ff; border-left:1px solid #e8f0ff">�����ȣ</td>
  <td width="70%"><%=rs.getString("zipcode")%></td>
 </tr>
 <tr> 
  <td width="30%" height="40" align="center" bgcolor="#e6eeff" style="border-right:1px solid #e8f0ff; border-left:1px solid #e8f0ff">�ּ�1</td>
  <td width="70%"><%=rs.getString("address1")%></td>
 </tr>
 <tr> 
  <td width="30%" height="40" align="center" bgcolor="#e6eeff" style="border-right:1px solid #e8f0ff; border-left:1px solid #e8f0ff">�ּ�2</td>
  <td width="70%"><%=rs.getString("address2")%></td>    
 </tr>
 <tr> 
  <td width="30%" height="40" align="center" bgcolor="#e6eeff" style="border-right:1px solid #e8f0ff; border-left:1px solid #e8f0ff">�޴���</td>
  <td width="70%">
  <% 
   if(phone.equals("--")) {
    out.println("<font color='blue'>�������� �ʾҽ��ϴ�.</font>");
   }else{
    out.println(phone); 
   } 
  %>
  </td>
 </tr>
 <tr align="center"> 
   <td colspan="5" bgcolor="#e8f0ff" height="1"></td>
  </tr>
 <tr >
  <td colspan="2" align="center">
   <input type="button" value=" " class="ok2" onClick="location='main.jsp'">
   <input type="button" value=" " class='edit' onClick="location='modify_session.jsp?mode=modify'">
   <input type="button" value=" " class='taltoi' onClick="location='delete.jsp'">
 </td>
 </tr>
</table>
</form>
</body>
</html> 
<%         
  }
  rs.close();
  con.close();
  pst.close();
 } catch (SQLException e) {
  out.println(e);
 }
%>
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