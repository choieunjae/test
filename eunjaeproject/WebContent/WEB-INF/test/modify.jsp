<%@ page info="member modify" errorPage="error.jsp" %>
<%@ page contentType="text/html; charset=euc-kr" %>
<%@ page language="java" import="java.sql.*,java.io.*,java.net.*,java.util.*,java.text.*" %>
<% request.setCharacterEncoding("euc-kr"); %>
<%
 Object mem_name  = session.getAttribute("member_name"); 
 Object mem_id = session.getAttribute("member_id"); 
 session.setAttribute("member_id",mem_id);
 if(session.getValue("member_id")==null) { 
%>
<link href="css/bag.css" media="all" rel="stylesheet" />

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


<%
 Connection conn = null;
 Statement  stmt = null;
 ResultSet  rs   = null;
 PreparedStatement pstmt = null;
 String mode		= request.getParameter("mode");
 String userid	= request.getParameter("userid");
 String username	= request.getParameter("username");
 String password	= request.getParameter("password");
 String email		= request.getParameter("email");
 String zipcode1	= request.getParameter("zipcode1");
 String zipcode2	= request.getParameter("zipcode2");
 String address1	= request.getParameter("address1");
 String address2	= request.getParameter("address2");
 String phone1 = request.getParameter("phone1");
 String phone2 = request.getParameter("phone2");
 String phone3 = request.getParameter("phone3");
 String query        = new String();
 StringTokenizer st_zipcode		= null;
 StringTokenizer st_phone	= null;

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
  stmt = conn.createStatement();
  if(mode.equals("null") || mode.equals("modify")){
   query = "select * from member where userid='"+userid+"'";
   rs = stmt.executeQuery(query);
            
   if(rs.next()){
    username	= rs.getString("username");
    password	= rs.getString("password");
    email		= rs.getString("email");
    st_zipcode = new StringTokenizer(rs.getString("zipcode"), "-");
    address1	= rs.getString("address1");
    address2	= rs.getString("address2");
    st_phone = new StringTokenizer(rs.getString("phone"), "-");
          
    if(st_zipcode.hasMoreTokens()){
     zipcode1 = st_zipcode.nextToken();
    }                
    if(st_zipcode.hasMoreTokens()){
     zipcode2 = st_zipcode.nextToken();
    } 
                  
    if(st_phone.hasMoreTokens()){
     phone1 = st_phone.nextToken();
    }                
    if(st_phone.hasMoreTokens()){
     phone2 = st_phone.nextToken();
    }                
    if(st_phone.hasMoreTokens()){
     phone3 = st_phone.nextToken();
    }
   }
   rs.close();
 
  }else if(mode.equals("update")){
   query = "update member set username=?, password=?, email=?, zipcode=?, address1=?, address2=?, phone=? where userid='"+userid+"'";
   pstmt = conn.prepareStatement(query);
   pstmt.setString(1, username);
   pstmt.setString(2, password);
   pstmt.setString(3, email);
   pstmt.setString(4, zipcode1+"-"+zipcode2);
   pstmt.setString(5, address1);
   pstmt.setString(6, address2);
   pstmt.setString(7, phone1+"-"+phone2+"-"+phone3);
   pstmt.executeUpdate();
   response.sendRedirect("main.jsp");
  }
 } catch(SQLException e) {
 } finally {
  conn.close();
 }
%>
<script language="JavaScript">

 function MM_openBrWindow(theURL,winName,features) {
  window.open(theURL,winName,features);
 }
 function doSubmit() {
  form = document.join;
  if(!form.username.value){
   alert('�̸��� �Է����� �ʾҽ��ϴ�.');
   form.username.focus();
   return;
  }
  if(!form.email.value){
   alert('Email�� �Է����� �ʾҽ��ϴ�.');
   form.email.focus();
   return;
  }
  if(form.email.value.indexOf("@") < 0){
   alert('Email�ּ� ������ Ʋ���ϴ�.');
   form.email.focus();
   return;
  }
  if(form.email.value.indexOf(".") < 0){
   alert('Email �ּ� ������ Ʋ���ϴ�.');
   form.email.focus();
   return;
  }
  if(!form.zipcode1.value || !form.zipcode2.value){
   alert('�����ȣ�� �Է����� �ʾҽ��ϴ�.');
   MM_openBrWindow('zipcode_search.jsp','zipcode_search','scrollbars=yes,width=500,height=250');
   return;
  }
  if(!form.address1.value){
   alert('�ּ�1�� �Է����� �ʾҽ��ϴ�.');
   MM_openBrWindow('zipcode_search.jsp','zipcode_search','scrollbars=yes,width=500,height=250');
   return;
  }
  if(!form.address2.value){
   alert('�ּ�2�� �Է����� �ʾҽ��ϴ�.');
   form.address2.focus();
   return;
  }
  form.submit();
}
</script>
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
<body bgcolor="#FFFFFF" text="#000000">
<div align="center">
 <form name="join" method="post" action="modify.jsp">
  <table width="50%" height="536" align=center;>
  <tr align="center"> 
   <td colspan="5" height="1" bgcolor="#e8f0ff"></td>
  </tr>
   <tr> 
    <td width="15%"  align="center" bgcolor=#e8f0ff height="40px;" border-bottom="1px solid #444444;"><font class="style2">���̵� <font color="#FF0000" size=1>*</font></font></td>
    <td width="75%">&nbsp;
     <input type="text" name="userid" size="10" maxlength="10" class="box" value="<%=userid%>" readonly></font></font></td>
   </tr>
   <tr> 
    <td width="15%"  align="center" bgcolor=#e8f0ff height="40px;" border-bottom="1px solid #444444;" ><font class="style2">��й�ȣ<font color="#FF0000" size=1>*</font></font></td>
    <td width="75%">&nbsp; 
     <input type="text" name="password" size="12" maxlength="12" class="box" value="<%=password%>">
     <font class="style2">�ٽ��ѹ�&nbsp;&nbsp; </font>
     <input type="password" name="password2" size="12" maxlength="12" class="box" value="<%=password%>">
     <font class="style2">(����+���� 4~12�ڸ�)</font></td>
   </tr>          
   <tr > 
    <td width="15%"  align="center" bgcolor=#e8f0ff height="40px;" border-bottom="1px solid #444444;"><font class="style2" >�̸� <font color="#FF0000" size=1>*</font></font></td>
    <td width="75%">&nbsp; 
     <input type="text" name="username" size="10" maxlength="10" class="box" value="<%=username%>"></td>
   </tr>
   <tr > 
    <td width="15%"  align="center" bgcolor=#e8f0ff height="40px;" border-bottom="1px solid #444444;"><font class="style2">E-MAIL<font color="#FF0000" size=1>*</font></font></td>
    <td width="75%">&nbsp;
     <input type="text" name="email" size="20" maxlength="50" class="box" value="<%=email%>"></td>
   </tr>
   <tr > 
    <td width="15%"  align="center" bgcolor=#e8f0ff height="40px;" border-bottom="1px solid #444444;"><font class="style2">�����ȣ <font color="#FF0000" size=1>*</font></font></td>
    <td width="75%">&nbsp; 
     <input type="text" name="zipcode1" size="3" maxlength="3" class="box" readonly value="<%=zipcode1%>"> - 
     <input type="text" name="zipcode2" size="3" maxlength="3" class="box"      readonly value="<%=zipcode2%>">
     <input name="button" type="button" onClick="MM_openBrWindow('zipcode_search.jsp','zipcodesearch','scrollbars=yes,width=500,height=250')" value="�����ȣ �˻�">
     <font color="#0099FF" size='2'>�����ȣ �˻� ��ư�� ��������.</font></td>
   </tr>
   <tr > 
    <td width="15%"  align="center" bgcolor=#e8f0ff height="40px;" border-bottom="1px solid #444444;"><font class="style2">�ּ� <font color="#FF0000" size=1>*</font></font></td>
    <td width="75%">&nbsp; 
     <input type="text" name="address1" size="50" maxlength="100" class="box" readonly value="<%=address1%>"></td>
   </tr>
   <tr > 
    <td width="15%"  align="center" bgcolor=#e8f0ff height="40px;" border-bottom="1px solid #444444;"><font class="style2" >�� �ּ� <font color="#FF0000" size=1>*</font></font></td>
    <td width="75%">&nbsp; 
     <input type="text" name="address2" size="50" maxlength="100" class="box" value="<%=address2%>"></td>
   </tr>
   <tr > 
    <td width="15%"  align="center" bgcolor=#e8f0ff height="40px;" border-bottom="1px solid #444444;"><font class="style2">�޴���</font></td>
    <td width="75%">&nbsp; 
     <input type="text" name="phone1" size="4" maxlength="4" class="box" value="<%=phone1%>"> -
     <input type="text" name="phone2" size="4" maxlength="4" class="box" value="<%=phone2%>"> - 
     <input type="text" name="phone3" size="4" maxlength="4" class="box" value="<%=phone3%>"></td>
   </tr>
    <tr align="center"> 
   <td colspan="5" height="2" bgcolor="#e8f0ff"></td>
  </tr>
  </table>
 <br/>
  <table width="614" border="0" cellspacing="0" cellpadding="0" align="center" >
   <tr>
    <td width=100% align="center"> 
     <input type="hidden" name="mode" value="update">
     <input type="button" class="upload" value=" "  onClick="doSubmit()">&nbsp;
     <input type="button" class="cancel" value=" "  onClick="javascript:history.go(-1);">
    </td>
   </tr>
  
 <tr>
  </table>
 </form>
</TD></TR></TABLE>
</div>
<div align="center">
 <table width="638" border="0" cellpadding="0" cellspacing="0">
  <tr> 
   <td bgcolor="#FFFFFF" width="638" nowrap><p align="center"><br>
   Copyright by EUNJAE</p></td>
  </tr>
 </table>
</div>
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