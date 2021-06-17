<%@ page contentType="text/html; charset=EUC-KR" %> 
<%@ page language="java" import="java.sql.*,java.text.*" %> 
<% request.setCharacterEncoding("euc-kr"); %>

<HTML>
<title>ENJOY BAG!</title>
<link href="css/bag.css" media="all" rel="stylesheet" />
<%@ page info="left_Frame" errorPage="error.jsp" %>
<% request.setCharacterEncoding("euc-kr"); %>
<%
 Object mem_name  = session.getAttribute("member_name"); 
 Object mem_id = session.getAttribute("member_id"); 
 session.setAttribute("member_id",mem_id);
 if(session.getValue("member_id")==null) { 
%>

<script language="JavaScript">
function setvalue(f){
	f.quantity.value=0;
	f.submit();
}
function login_check() {
	  if (!document.login.userid.value) {
	   alert("ID를 입력하세요!");
	   document.login.userid.focus();	
	   return;
	  }  
	  if (!document.login.password.value) {
	   alert("패스워드를 입력하세요!");
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
     <td width="7%" align="center" class="style1" align="center">회원ID </td>
     <td width="7%"><input type="text" maxlength="16" name="userid" size='10' class="input_style1"></td>
     <td width="3%" class="style1" align="center">PASS </td>
     <td width="5%"><input type="password" maxlength="12" name="password" size='10' class="input_style1"></td>
<td width="1%">&nbsp; </td>     
<td  width="14%"class='style2' align="right"><a href="javascript:login_check()">로그인</a>&nbsp;<a href="insert_page.jsp" target="_top">회원가입&nbsp;</a><a href="sale_list.jsp" target="_top">장바구니&nbsp;</a></a><a href="admin.jsp" target="_top">관리자모드</td>
    </tr>      
   </table>

</form>
<% } 
else{ 
%>
<script language="JavaScript">
function setvalue(f){
	f.quantity.value=0;
	f.submit();
}


</script>
 <tr> 
  <td height="20" bgcolor='#FFFFFF'> 
   <table width="100%" border="0" cellspacing="0" cellpadding="0">
    <tr > 
<td width="57%">&nbsp;</td>
          <td width="13%"><font class="style2"><%=mem_name%> 님 환영합니다.</font></td>
<td width="7%"><font  class="style2"><a href="logout.jsp">로그아웃</a></font></td>
 <td width="9%"><font class="style2"><a href="select.jsp" target="mainFrame">개인 정보 조회</a></font></td>
 <td width="7%"><font class="style2"><a href="sale_list.jsp" target="mainFrame">장바구니</a></font></td>
 <td width="7%"><font class="style2"><a href="qna_list.jsp" target="mainFrame">고객센터</a></font></td>
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
	<class="product"><a href="product_write.jsp">상품 등록하기 (관리자)</a>
	</div>
	</div>
         <div id="menu">
            </div>
          <ul id="nav">
 		<li><a href="searchfilter.jsp">맞춤검색필터</a></li>
		<li><a href="backpack.jsp">백팩</a></li>
		<li><a href="crossbag.jsp">크로스백</a></li>
		<li><a href="hipeco.jsp">힙색/에코백</a></li>
		<li><a href="clutchwallet.jsp">클러치/지갑</a></li>
		<li><a href="carrier.jsp">캐리어</a></li>
		<li><a href="photo_list.jsp">포토리뷰</a></li>
		<li><a href="qna_list.jsp">QnA</a></li>
		</ul>
      </header>
<P align=center>
 <FONT color=#000000 size=+1>
  <STRONG>장바구니</STRONG>
 </FONT>
</P> 
<CENTER>
<TABLE border=0 width=80% cellpadding=4 cellspacing=4 style="font-size:12px">
  <hr width=80% color=black>
 <TR>
  <TH width=5% >
   <FONT color=black><NOBR>번호</NOBR></FONT>
  </TH>
  <TH width=10%>
  <FONT color=black><NOBR>상품이미지</NOBR></FONT>
  </TH>
  <TH width=20% >
   <FONT color=black><NOBR>상품명</NOBR></FONT>
  </TH>
  <TH width=20% >
   <FONT color=black><NOBR>제조원</NOBR></FONT>
  </TH>
  <TH width=25%>
   <FONT color=black><NOBR>주문 수량</NOBR></FONT>
  </TH>
  <TH width=10%>
   <FONT color=black><NOBR>판매가</NOBR></FONT>
  </TH>
  <TH width=10%>
   <FONT color=black><NOBR>합계</NOBR></FONT>
  </TH>
 </TR>
 <tr>
<th colspan=7 style="border-bottom:1px solid #000000"></th>
 </tr>

 

<%
 long id = 0;
 session = request.getSession();
 String[] a = session.getValueNames();
 String where="1";
 String url = "http://localhost:8080/jsp/JJSP/upload/";
 String ca="";
 String ca2="";
 String pn="";
 int qty=0;
 int count=0;
 
 
 if (request.getParameter("go") != null)
  if(!(request.getParameter("go").equals("")) )
   where = request.getParameter("go");
 
 if (request.getParameter("cat1") != null) 
  if( !(request.getParameter("cat1").equals("")) )
   ca=request.getParameter("cat1");
 
 if (request.getParameter("cat2") != null) 
  if( !(request.getParameter("cat2").equals("")) )
   ca2=request.getParameter("cat2");
 
 if (request.getParameter("pname") != null) 
  if ( !(request.getParameter("pname").equals("")) ) 
   pn=request.getParameter("pname");


 NumberFormat nf= NumberFormat.getNumberInstance();

 String pricestr="";
 String hap="";
 int price=0;
 long total=0;
 
 Connection con= null;
 Statement st =null;
 ResultSet rs =null;
 String sql=null;
 
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

  for (int i=0; i< a.length ;i++) {
 try{
   id =Long.parseLong(a[i].trim());
}catch(Exception e){
continue;
}

   qty = ((Integer)session.getValue(a[i])).intValue();
   sql = "select * from product where id="+id; 
   rs = st.executeQuery(sql);
 
   if (rs.next()) { 
    count= count+1;
    price=rs.getInt("downprice");
    pricestr=nf.format(price); 
    hap=nf.format(price*qty); 
    total=total+(price*qty);
    out.println("<FORM method=post action=\'sale_upd.jsp\'>");   
    out.println("<TR>");
    out.println("<TH width=5%  bgcolor=#eeeeee>");
    out.println(i+1+"</TH>");
    out.println("<TD width=10% bgcolor=#eeeeee>");
    out.println("<IMG width=100px height=100px src="+url+rs.getString("large")+">");
    out.println("<TD width=20% bgcolor=#eeeeee>");
    out.println(rs.getString("pname")+ "</TD>");
    out.println("<TD Width=20% bgcolor=#eeeeee>");
    out.println(rs.getString("sname")+"</TD>");
    out.println("<TD width=25% bgcolor=#eeeeee>");
    out.println("<INPUT type=text name=quantity size=2 value="+qty+">개<br/>");
    out.println("<INPUT type=hidden name=id value="+id+">");
    out.println("<INPUT type=hidden name=go value="+where+">");
    out.println("<INPUT type=hidden name=cat value="+ca+">");
    out.println("<INPUT type=hidden name=pname value="+pn+">");
    out.println("<INPUT type=submit class='modify' value='' >");
    out.println("<INPUT type=button class='delete' onclick='setvalue(this.form)' value=''>");

    out.println("</TD>");
    out.println("<TD width=10% bgcolor=#eeeeee align=right>");
    out.println(pricestr+ "</TD>");
    out.println("<TD width=10% bgcolor=#eeeeee align=right>");
    out.println(hap+ "</TD>");
    out.println("</TR></FORM>"); 
   }
  }   
 
  out.println("<TR>");
  out.println("<TD width=10% style='text-align:right;' colspan=7>");
  out.println("주문 상품 : "+count+ "품목&nbsp;&nbsp;");  
  out.println("주문 총 합계 금액 : "+nf.format(total)+ "원</TD>");     
  out.println("</TR>");   
  out.println("</TABLE>");
  st.close();
  con.close();
 
  
 if(total!=0){
  out.println("<A href=\"product_list.jsp\"><img src='images/add_shpping.jpg'></A>");
  out.println("<A href=\"order.jsp?total="+total+"&count="+count+"\"><img src='images/go_jumun.jpg'></A>");
 }else{
	 out.println("<A href=\"product_list.jsp\"><img src='images/add_baguni.jpg'></A>");
 }
 } catch (SQLException e) {
  out.println(e);
 }
%> 
<footer>
<div class="util_menu"  style="height:50px; border-top:2px solid #96b6fa; border-bottom:2px solid #96b6fa;">
<span class="ft_1">이용약관</span>
<span>|</span>
<span class="ft_1">개인정보취급방침</span>
</div>
<span class="name" style="padding-top:2%;">홈페이지 대표 : 최은재</span>
<span class="tel" style="padding-top:2%;">연락처 : 032-770-8114</span>
<span class="addr" style="padding-top:2%;">주소 : 인천광역시 남구 숙골로 113</span>
</footer>
</div>
</div>
</body>
</html>