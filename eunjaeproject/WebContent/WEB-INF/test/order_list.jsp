<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>ENJOY BAG!</title>
<link href="css/bag.css" media="all" rel="stylesheet" />
<%@ page info="left_Frame" errorPage="error.jsp" %>
<%@ page language="java" import="java.sql.*,java.util.*,java.text.*" %> 

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
 String sql=null;
 Connection con= null;
 Statement st1 =null;
 Statement st2 =null;
 ResultSet rs1 =null;
 ResultSet rs2 =null;

 int count=0;
 int price=0;
 int qty=0;
 String cond="";
 long id=0;
 
 if (request.getParameter("id")!=null) {
  id = Long.parseLong(request.getParameter("id"));
  cond = " where id="+id;
 } else 
  cond = " order by id desc";  
  
 NumberFormat nf= NumberFormat.getNumberInstance();
 String totalstr="";
 
 try {
  Class.forName("org.gjt.mm.mysql.Driver");
 } catch (ClassNotFoundException e ) {
  out.println(e);
 }
 
 try{
  con = DriverManager.getConnection("jdbc:mysql://localhost:3306/shop?useUnicode=true&characterEncoding=euckr","root","1234");
 } catch (SQLException e) {
  out.println(e);
 }

 try {
  st1 = con.createStatement();
  st2 = con.createStatement();
 
  sql = "select * from saleorder"+ cond;
  rs1 = st1.executeQuery(sql);

  if (!(rs1.next())) 
   out.println("�ش� ������ �����ϴ�");
  else {
   do {
    totalstr =nf.format(rs1.getLong("total"));
    count =rs1.getInt("prodcount");
    id=rs1.getLong("id");
    out.println("<TABLE width=80% border=0 align=center cellspacing=0 cellpadding=2>");
%>
 <tr align="center"> 
   <td colspan="2" height="1" bgcolor="#e8f0ff" ></td>
  </tr>
 <TR>
  <TH colspan=2 height=40px;>
   <FONT size=+1  color=black>�ֹ�������</FONT>
  </TH>
 </TR>
   <tr align="center"> 
   <td colspan="2" bgcolor="#e8f0ff" height="1"></td>
  </tr>
<%
    out.println("<TR><TD width=20% height=40px; bgcolor=#e8f0ff align=center style='border-right:1px solid #e8f0ff; border-left:1px solid #e8f0ff;'>");
    out.println("�ֹ� ��ȣ</TD>");
    out.println("<TD>"+id+"</TD></TR>");
    out.println("<TR><TD width=20%  height=40px; bgcolor=#e8f0ff align=center style='border-right:1px solid #e8f0ff; border-left:1px solid #e8f0ff;'>");
    out.println("�ֹ� ��¥</TD>");
    out.println("<TD>"+rs1.getString("orderdate")+"</TD></TR>");
    out.println("<TR><TD  width=20% height=40px; bgcolor=#e8f0ff align=center style='border-right:1px solid #e8f0ff; border-left:1px solid #e8f0ff;'>�� �̸�</TD>");
    out.println("<TD>"+rs1.getString("name")+"</TD></TR>");
    out.println("<TR><TD width=20% height=40px; bgcolor=#e8f0ff align=center style='border-right:1px solid #e8f0ff; border-left:1px solid #e8f0ff;'>���� ����</TD>");
    out.println("<TD>");
    out.println(rs1.getString("pay")+"("+rs1.getString("cardno")+")");
    out.println("</TD></TR>"); 
    out.println("<TR><TD  width=20% height=40px; bgcolor=#e8f0ff align=center style='border-right:1px solid #e8f0ff; border-left:1px solid #e8f0ff;'>��� �ּ�</TD>");
    out.println("<TD>"+rs1.getString("addr")+"</TD></TR>");
    out.println("<TR><TD  width=20% height=40px; bgcolor=#e8f0ff align=center style='border-right:1px solid #e8f0ff; border-left:1px solid #e8f0ff;'>��ȭ ��ȣ</TD>");
    out.println("<TD >"+rs1.getString("tel"));
    out.println("</TD></TR></TABLE>"); 

    sql = "select * from item where orderid="+id+" order by mynum";
    rs2 = st2.executeQuery(sql);

    if (rs2.next()) {
     out.println("<TABLE width=80%  border=0 align=center  cellspacing=0 cellpadding=2>");
%>
<hr width=80% color=#e8f0ff>
 <TR>
  <TH width=5% colspan=2 >
   <FONT color=black><NOBR>��ǰ�ڵ�</NOBR></FONT>
  </TH>
  <TH width=20% >
   <FONT color=black><NOBR>��ǰ��</NOBR></FONT>
  </TH>
  <TH width=25%>
   <FONT color=black><NOBR>�ֹ� ����</NOBR></FONT>
  </TH>
  <TH width=10%>
   <FONT color=black><NOBR>�ǸŰ�</NOBR></FONT>
  </TH>
  <TH width=10%>
   <FONT color=black><NOBR>�հ�</NOBR></FONT>
  </TH>
 </TR>
 <tr>
<th colspan=6 style="border-bottom:3px solid #e8f0ff"></th>
 </tr>
   <% 
     do {
      qty=rs2.getInt("quantity");
      price=rs2.getInt("price");

      out.println("<TR><TH width=5% height=30px; bgcolor=#e8f0ff>");
      out.println("<FONT color=black>"+rs2.getInt("mynum"));
      out.println("</FONT></TH>");
      out.println("<TD width=20% height=30px;><font size='2'>");
      out.println(rs2.getLong("prodid")+"</font></TD>");
      out.println("<TD width=10% height=30px;><font size='2'>");
      out.println(rs2.getString("pname")+"</font></TD>");
      out.println("<TD align=center height=30px;><font size='2'>"+qty+"</font></TD>");
      out.println("<TD align=center height=30px;><font size='2'>");
      out.println(nf.format(price)+"</font></TD>");
      out.println("<TD align=right height=30px;><font size='2'>");
      out.println(nf.format(price*qty)+"</font></TD></TR>");
     } while(rs2.next());
     out.println("<TR><TD align=right colspan=6 style='padding-top:2%;'><font size='2'>");
     out.println("�ֹ� ��ǰ :"+count+"ǰ��<br>�հ�ݾ� :"+totalstr+"��");
     out.println("</font></TD></TR></TABLE><BR>");
    }
   }while(rs1.next());   
  }

  st1.close();
  st2.close();
  con.close();
 } catch (SQLException e) {
  out.println(e);
 } 
%>
<center>
<A href="product_list.jsp"><img src='images/go_list.jpg'></A>
</center>
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