<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>ENJOY BAG!</title>
<link href="css/bag.css" media="all" rel="stylesheet" />
<%@ page contentType="text/html; charset=euc-kr" %> 
<%@ page language="java" import="java.sql.*,java.util.*,java.text.*" %> 
<% request.setCharacterEncoding("euc-kr"); %>
<%@ page import="java.net.URLEncoder" %>
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
      <p class="backpack_name">ĳ���� </p>
          
          <ul class="sub_nav">
			    <li><a href='product_list.jsp?cat1=5'>�ϵ� ĳ����</a>
			    <ul class="carrier_li">
			    <li><a href='product_list.jsp?cat2=9'>21��ġ �̻�</a></li><br>
			    <li><a href='product_list.jsp?cat2=10'>22��ġ ~ 25��ġ</a></li>
			    <li><a href='product_list.jsp?cat2=11'>26��ġ �̻�</a></li>
			    </ul>
			    </li>
			    <li>/</li>
  				<li><a href='product_list.jsp?cat1=6'>����Ʈ ĳ����</a>
  				<ul class="carrier_li">
  				<li><a href='product_list.jsp?cat2=12'>21��ġ �̻�</a></li><br>
			    <li><a href='product_list.jsp?cat2=13'>22��ġ ~ 25��ġ</a></li>
			    <li><a href='product_list.jsp?cat2=14'>26��ġ �̻�</a></li>
			    </ul>
  				</li>
			</ul>
      </header>
 <section>
<div id="section1">
<span class="recommended">��õ��ǰ</span>
<ul class="re_product">
<li><a href="product_read.jsp?id=590001&go=1&cat=&pname="><div class="img-box"><img src="images/carrier_21_1.jpg"></div><div class="text-box"><span class="name">[Ÿ�Ӹ���] ���Ľ� 20��ġ �⳻��ĳ���� �ϵ�</span><br/><br/><span class="price">88,000��</span></div></a></li>
<li><a href="product_read.jsp?id=590002&go=1&cat=&pname="><div class="img-box"><img src="images/carrier_21_2.jpg"></div><div class="text-box"><span class="name">[�����÷�] �Ʒ��� 20��ġ</span><br/><br/><br/><span class="price">98,000��</span></div></a></li>
<li><a href="product_read.jsp?id=5100001&go=1&cat=&pname="><div class="img-box"><img src="images/carrier_22_2.jpg"></div><div class="text-box"><span class="name">[Ÿ�Ӹ���] TPG Ʈ��Ŭ 24 �ϵ�ĳ����</span><br/><br/><br/><span class="price">55,000��</span></div></a></li>
<li><a href="product_read.jsp?id=5120001&go=1&cat=&pname="><div class="img-box"><img src="images/scarrier_21_1.jpg"></div><div class="text-box"><span class="name">[���̿���] 19��ġ �Ѹ����� �⳻��</span><br/><br/><br/><span class="price">79,900��</span></div></a></li>
<li><a href="product_read.jsp?id=5120002&go=2&cat=&pname="><div class="img-box"><img src="images/scarrier_22_2.jpg"></div><div class="text-box"><span class="name">[����] ĳ���� 24��ġ ��</span><br/><br/><br/><span class="price">148,000��</span></div></a></li>
</ul>
</div>
<div id="section2">
<span class="all_product">��ü��ǰ</span>
<hr class="section_line">
<ul class="product_list">
<%  
 String cond="";
 String ca="";
 String ca2="";
 String pn="";
 String co = "";
 

if (request.getParameter("cat1") != null) {
	  if( !(request.getParameter("cat1").equals("")) ) {
	   ca=request.getParameter("cat1");
	   cond= " where category = '"+4+"'";
	  }
	 }
 
 Vector pname=new Vector();
 Vector sname=new Vector();
 Vector keyid=new Vector();
 Vector cat1=new Vector();
 Vector cat2= new Vector();
 Vector col = new Vector();
 Vector price = new Vector();
 Vector dprice=new Vector();
 Vector inputdate=new Vector();
 Vector stock=new Vector();
 Vector img = new Vector();
 String category=null;
 String category2=null;
 String color = null;
 String url = "http://localhost:8080/jsp/JJSP/upload/";
 
 long id=0;
 
 NumberFormat nf = NumberFormat.getInstance();
 String downprice=null; 
 
 int where=1;
 int totalgroup=0;
 int maxpages=2;
 int startpage=1;
 int endpage=startpage+maxpages-1;
 int wheregroup=1;
 if (request.getParameter("go") != null) {
  where = Integer.parseInt(request.getParameter("go"));
  wheregroup = (where-1)/maxpages + 1;
  startpage=(wheregroup-1) * maxpages+1;  
  endpage=startpage+maxpages-1; 
 } else if (request.getParameter("gogroup") != null) {
  wheregroup = Integer.parseInt(request.getParameter("gogroup"));
  startpage=(wheregroup-1) * maxpages+1;  
  where = startpage ; 
  endpage=startpage+maxpages-1; 
 }
 int nextgroup=wheregroup+1;
 int priorgroup= wheregroup-1;
 
 int startrow=0;
 int endrow=0;
 int maxrows=12;
 int totalrows=0;
 int totalpages=0;
 Connection con= null;
 Statement st =null;
 ResultSet rs =null;
 
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
  st = con.createStatement();
  String sql = "select * from product";
  sql = sql+" where category=5 order by id;";
  rs = st.executeQuery(sql);
  if (!(rs.next()))  {
   out.println("��ǰ�� �����ϴ�");
  } else {
	  
   do {
	img.addElement(rs.getString("large"));
    keyid.addElement(new Long(rs.getLong("id")));
    cat1.addElement(rs.getString("category"));
    cat2.addElement(rs.getString("category2"));
    col.addElement(rs.getString("color"));
    pname.addElement(rs.getString("pname"));
    sname.addElement(rs.getString("sname"));
    dprice.addElement(new Integer(rs.getInt("downprice")));
    price.addElement(new Integer(rs.getInt("price")));
    String idate = rs.getString("inputdate");
    idate = idate.substring(0,8);
    inputdate.addElement(idate);
    stock.addElement(new Integer(rs.getInt("stock")));
   }while(rs.next());
	

   totalrows = pname.size();
   totalpages = (totalrows-1)/maxrows +1;
   startrow = (where-1) * maxrows;
   endrow = startrow+maxrows-1  ;
   if (endrow >= totalrows)
    endrow=totalrows-1;
   totalgroup = (totalpages-1)/maxpages +1;
   if (endpage > totalpages) 
    endpage=totalpages;
   for(int j=startrow;j<=endrow;j++) {
    id= ( (Long)keyid.elementAt(j) ).longValue();
    downprice=nf.format( ((Integer)dprice.elementAt(j)).intValue() ); 
    out.println("<li>");
    out.println("<A href=\"product_read.jsp?id="+id + "&go=" + where);
    out.println("&cat="+ca+"&pname="+pn+"\">");  
    out.println("<div class='img-box'><IMG width=100% src="+url+img.elementAt(j)+"></div>");
    out.println("<div class='text-box'><span class='p_name'>"+pname.elementAt(j)+"</span><br><br>");
    out.println("<del class='del_price'>"+price.elementAt(j)+"</del>");
    out.println("<span class='price'>"+downprice+"</span></div>");
    out.println("</A>");
    out.println("</li>");
   }
   rs.close();    
  }
  out.println("</ul>");
  out.println("</div>");
  out.println("</section>");
  st.close();
  con.close();
 } catch (SQLException e) {
  out.println(e);
 } 
 out.print("<div style='text-align:center'>");
 if (wheregroup > 1) {
	
  out.print("[<A href=\"carrier.jsp?gogroup=1"); 
  out.print("&pname="+pn+"\">ó��</A>]");
  out.print("[<A href=\"carrier.jsp?gogroup="+priorgroup);
  out.print("&pname="+pn+ "\">����</A>]");
 } else {
  out.println("[ó��]") ;
  out.println("[����]") ;
 }
 
 if (totalrows !=0) {  
  for(int jj=startpage; jj<=endpage; jj++) {
   if (jj==where) 
    out.println("["+jj+"]") ;
   else {
    out.print("[<A href=\"carrier.jsp?go="+jj) ;
    out.print("&pname="+pn+"\">"+jj + "</A>]") ;
   }
  } 
 }
 if (wheregroup < totalgroup) {
  out.print("[<A href=\"carrier.jsp?gogroup="+ nextgroup);
  out.print("&pname="+pn+"\">����</A>]");
  out.print("[<A href=\"carrier.jsp?gogroup="+ totalgroup);
  out.print("&pname="+pn+"\">������</A>]");
 } else {
  out.println("[����]");
  out.println("[������]");
 }
 out.println("</div>");

%>
<!-- <section> -->
<!-- <div id="section1"> -->
<!-- <span class="recommended">��õ��ǰ</span> -->
<!-- <ul class="re_product"> -->
<!-- <li><a href="#"><div class="img-box"><img src="images/backpack_1.jpg"></div><div class="text-box"><span class="name">[�Ƶ�ٽ�] CLASSIC BP BOS ���� / FS8332</span><br/><br/><span class="price">85,000��</span></div></a></li> -->
<!-- <li><a href="#"><div class="img-box"><img src="images/backpack_2.jpg"></div><div class="text-box"><span class="name">[�Ƶ�ٽ�] CLASSIC BP BOS ���� / FS8332</span><br/><br/><span class="price">85,000��</span></div></a></li> -->
<!-- <li><a href="#"><div class="img-box"><img src="images/backpack_3.jpg"></div><div class="text-box"><span class="name">[�Ƶ�ٽ�] CLASSIC BP BOS ���� / FS8332</span><br/><br/><span class="price">85,000��</span></div></a></li> -->
<!-- <li><a href="#"><div class="img-box"><img src="images/backpack_4.jpg"></div><div class="text-box"><span class="name">[�Ƶ�ٽ�] CLASSIC BP BOS ���� / FS8332</span><br/><br/><span class="price">85,000��</span></div></a></li> -->
<!-- <li><a href="#"><div class="img-box"><img src="images/backpack_5.jpg"></div><div class="text-box"><span class="name">[�Ƶ�ٽ�] CLASSIC BP BOS ���� / FS8332</span><br/><br/><span class="price">85,000��</span></div></a></li> -->
<!-- </ul> -->
<!-- </div> -->
<!-- <div id="section2"> -->
<!-- <span class="all_product">��ü��ǰ</span> -->
<!-- <hr class="section_line">  -->
<!-- <ul class="back_product"> -->
<!-- <li><a href="#"><img src="images/back_product_1.jpg"><div class="text-box"><span class="p_name">[�Ƶ�ٽ�] CLASSIC BP BOS ���� / FS8332</span><br/><br/><span class="price">85,000��</span></div></a></li> -->
<!-- <li><a href="#"><img src="images/back_product_2.jpg"><div class="text-box"><span class="p_name">[�Ƶ�ٽ�] CLASSIC BP BOS ���� / FS8332</span><br/><br/><span class="price">85,000��</span></div></a></li> -->
<!-- <li><a href="#"><img src="images/back_product_3.jpg"><div class="text-box"><span class="p_name">[�Ƶ�ٽ�] CLASSIC BP BOS ���� / FS8332</span><br/><br/><span class="price">85,000��</span></div></a></li> -->
<!-- <li><a href="#"><img src="images/back_product_4.jpg"><div class="text-box"><span class="p_name">[�Ƶ�ٽ�] CLASSIC BP BOS ���� / FS8332</span><br/><br/><span class="price">85,000��</span></div></a></li> -->
<!-- </ul> -->
<!-- <ul class="back_product"> -->
<!-- <li><a href="#"><img src="images/back_product_5.jpg"><div class="text-box"><span class="p_name">[�Ƶ�ٽ�] CLASSIC BP BOS ���� / FS8332</span><br/><br/><span class="price">85,000��</span></div></a></li> -->
<!-- <li><a href="#"><img src="images/back_product_6.jpg"><div class="text-box"><span class="p_name">[�Ƶ�ٽ�] CLASSIC BP BOS ���� / FS8332</span><br/><br/><span class="price">85,000��</span></div></a></li> -->
<!-- <li><a href="#"><img src="images/back_product_7.jpg"><div class="text-box"><span class="p_name">[�Ƶ�ٽ�] CLASSIC BP BOS ���� / FS8332</span><br/><br/><span class="price">85,000��</span></div></a></li> -->
<!-- <li><a href="#"><img src="images/back_product_8.jpg"><div class="text-box"><span class="p_name">[�Ƶ�ٽ�] CLASSIC BP BOS ���� / FS8332</span><br/><br/><span class="price">85,000��</span></div></a></li> -->
<!-- </ul> -->
<!-- <ul class="back_product"> -->
<!-- <li><a href="#"><img src="images/back_product_9.jpg"><div class="text-box"><span class="p_name">[�Ƶ�ٽ�] CLASSIC BP BOS ���� / FS8332</span><br/><br/><span class="price">85,000��</span></div></a></li> -->
<!-- <li><a href="#"><img src="images/back_product_10.jpg"><div class="text-box"><span class="p_name">[�Ƶ�ٽ�] CLASSIC BP BOS ���� / FS8332</span><br/><br/><span class="price">85,000��</span></div></a></li> -->
<!-- <li><a href="#"><img src="images/back_product_11.jpg"><div class="text-box"><span class="p_name">[�Ƶ�ٽ�] CLASSIC BP BOS ���� / FS8332</span><br/><br/><span class="price">85,000��</span></div></a></li> -->
<!-- <li><a href="#"><img src="images/back_product_12.jpg"><div class="text-box"><span class="p_name">[�Ƶ�ٽ�] CLASSIC BP BOS ���� / FS8332</span><br/><br/><span class="price">85,000��</span></div></a></li> -->
<!-- </ul> -->
<!-- </section> -->


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
