<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page language="java" import="java.sql.*,java.util.*" %> 
<HTML>
<HEAD>
<link href="css/bag.css" media="all" rel="stylesheet" />
<%@ page info="left_Frame" errorPage="error.jsp" %>
<% request.setCharacterEncoding("euc-kr"); %>
<%
 Object mem_name  = session.getAttribute("member_name"); 
 Object mem_id = session.getAttribute("member_id"); 
 session.setAttribute("member_id",mem_id);
 if(session.getValue("member_id")==null) { 
%>
<link rel="StyleSheet" href="style.css" type="text/css">
<meta charset="utf-8">
<title>ENJOY BAG!</title>
<script language="JavaScript">

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
<SCRIPT language="javascript">

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
	 
function check(){
 with(document.msgrewrite){
  if(subject.value.length == 0){
   alert("������ �Է��� �ּ���!!");
   subject.focus();
   return false;
  }
  if(name.value.length == 0){
   alert("�̸��� �Է��� �ּ���!!");
   name.focus();
   return false;
  }
  if(password.value.length == 0){
   alert("��й�ȣ�� �Է��� �ּ���!!");
   password.focus();
   return false;
  }
  if(content.value.length == 0){
   alert("������ �Է����ּ���!!");
   content.focus();
   return false;
  }
  document.msgrewrite.submit();
 }
}


</SCRIPT> 
<link href="filegb.css" rel="stylesheet" type="text/css">
</head>

<body>
   <div id="wrap">
            
      <header>
	<a href="main.jsp" target="_blank">
    	<p style="text-align: center;"><img class="logo" src="images/logo.png" alt="logo"></a> </p>  
            <div id="top">
	<div class="product">
	<class="product"><a href="product_write.jsp">��ǰ ����ϱ� (������)</a>
	</div>
	</div>
         <div id="menu">
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
<P>

<%
 String sql=null;
 Connection con= null;
 Statement st =null;
 ResultSet rs =null;
 int pos=0;
 String sub=null;
 String cont=null;
 int step=0;
 int rnum=0;
 int mid=0;
 int id = Integer.parseInt(request.getParameter("id"));
 
 try {
  Class.forName("org.gjt.mm.mysql.Driver");
 } catch (ClassNotFoundException e ) {
  out.println(e);
 }
 
 try{
  con = DriverManager.getConnection("jdbc:mysql://localhost:3306/fboard?useUnicode=true&characterEncoding=euckr","root","1234");
 } catch (SQLException e) {
  out.println(e);
 }
 
 try {
  sql = "select * from freeboard where id="+id ;
  st = con.createStatement();
  rs = st.executeQuery(sql);
  if (!(rs.next()))  {
   out.println("�ش� ������ �����ϴ�");
  } else {
   cont = ">" + rs.getString("content") ;
   while ((pos=cont.indexOf("\n", pos)) != -1) {
    String left=cont.substring(0, pos+1);
    String right=cont.substring(pos+1, cont.length());
    cont = left + ">" + right;
    pos += 2;
   }
  
   step = rs.getInt("step");
   mid = rs.getInt("masterid");                                     
   rnum = rs.getInt("replynum");                             
  %>
  <FORM name='msgrewrite'  method=POST action="qna_rsave.jsp?id=<%=id%>&page=<%=request.getParameter("page")%>">
   <table  class='qna_read' width="80%" cellspacing="0" cellpadding="2">
    <tr> 
     <td colspan="2" bgcolor="#e8f0ff" height="1"></td>
    </tr>
    <tr> 
     <td colspan="2"  height="50" class="notice">&nbsp;&nbsp;<font size="4">�� �亯�ϱ�</font></td>
    </tr>
    <tr> 
     <td colspan="2" bgcolor="#e8f0ff" height="1"></td>
    </tr>
    <tr> 
     <td width="10%" height="30" align="center"  bgcolor="#e6eeff" style="border-right:1px solid #e8f0ff; border-left:1px solid #e8f0ff">�� ��</td>
     <td width="80%"  style="padding:0 0 0 10" align="left"><input type=text name=name class="input_style1"></td>
    </tr>
    <tr> 
     <td width="10%" align="center"   bgcolor="#e6eeff" style="border-right:1px solid #e8f0ff; border-left:1px solid #e8f0ff">E-mail</td>
     <td width="80%" style="padding:0 0 0 10" align="left" height="25"><input type=text name=email class="input_style1"></td>
    </tr>
    <tr> 
     <td width="10%" align="center"  bgcolor="#e6eeff" style="border-right:1px solid #e8f0ff; border-left:1px solid #e8f0ff">�� ��</td>
     <td width="80%" style="padding:0 0 0 10" align="left" height="25">
	 <input type=text name=subject size="60" class="input_style2" value="Re :<%=rs.getString("subject")%>"></td>
    </tr>
    <tr> 
     <td width="10%" height="162" align="center" valign="top" bgcolor="#e6eeff" style="padding-top:7px;border-right:1px solid #e8f0ff; border-left:1px solid #e8f0ff">�� ��</td>
     <td width="80%" valign="top"  style="padding:5 0 5 10; border-right:1px solid #e8f0ff ;" align="left"> 
      <textarea name=content cols="136" rows="30" class="textarea_style1">

----------------------------------------------------------------------------------------------------------------------------------------<%=cont%></textarea></td>
    </tr>
    <tr> 
     <td width="10%" align="center"  bgcolor="#e6eeff" style="border-right:1px solid #e8f0ff ; border-left:1px solid #e8f0ff">�� ȣ</td>
     <td width="80%" style="padding:0 0 0 10" height="25" align="left"> 
      <input type='password' name='password'  class="input_style1"><br>(��Ȯ�� ��й�ȣ�� �Է��ؾ߸� ������ �˴ϴ�.)
     </td>
    </tr>
    <tr> 
     <td colspan="2" height="1" class='button'></td>
    </tr>
    <tr> 
     <td colspan="2" height="1" bgcolor="#e8f0ff"></td>
    </tr>
    <tr> 
     <td colspan="2" height="10"></td>
    </tr>
    <tr> 
     <td colspan="2" align="right"> 
      <table width="100%" border="0" cellpadding="0" cellspacing="0">
       <tr> 
        <td width="90%">&nbsp;</td>
        <td width="1%"><a href="#" onClick="check();"><img src="images/ok.png" border="0"></a></td>
        <td width="1%"><a href="#" onClick="history.go(-1)"><img src="images/cancel.png" border="0"></a></td>
        <td width="1%"><A href="qna_list.jsp?go=<%=request.getParameter("page") %>"> <img src="images/list.png" border=0></a></td>
       </tr>
      </table>
     </td>
    </tr>
   </table>
   <INPUT type="hidden" name="step" value="<%=step%>">
   <INPUT type="hidden" name="mid" value="<%=mid%>">
   <INPUT type="hidden" name="rnum" value="<%=rnum%>">
  </FORM>
<%
  }
  st.close();
  con.close();
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