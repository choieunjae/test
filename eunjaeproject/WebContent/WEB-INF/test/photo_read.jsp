<%@ page contentType="text/html; charset=EUC-KR" %> 
<%@ page language="java" import="java.sql.*,java.util.*" %> 

<HTML>
<HEAD><TITLE>상품(이미지)보기</TITLE>
<link href="filegb.css" rel="stylesheet" type="text/css">
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
<script language="JavaScript">
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
function view(temp){
	filename="/jsp/JJSP/photorv/"+temp;
	i=window.open(filename,"win","height:400,width=400,toolbar=0, menubar=0, scrollbars=1, resizeble=1, status=0");

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

function view(temp){
	filename="/jsp/JJSP/photorv/"+temp;
	i=window.open(filename,"win","height:400,width=400,toolbar=0, menubar=0, scrollbars=1, resizeble=1, status=0");

}
</script>
<link rel="stylesheet" href="style.css" type="text/css">
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
<%
 
 String ca="";
 String ca2="";
 String pn="";

 if (request.getParameter("cat1") != null) 
  if( !(request.getParameter("cat1").equals("")) )
   ca=request.getParameter("cat1");

 if (request.getParameter("cat2") != null) 
  if( !(request.getParameter("cat2").equals("")) )
   ca=request.getParameter("cat2");

 if (request.getParameter("pname") != null)
  if ( !(request.getParameter("pname").equals("")) )
   pn=request.getParameter("pname");
  
 //pn = new String(pn.getBytes("ISO-8859-1"),"euc-kr");
 out.println(pn);

 String sql=null;
 Connection con= null;
 Statement st =null;
 ResultSet rs =null;
 
 long id = Long.parseLong(request.getParameter("id"));
 
 String url = "http://localhost:8080/jsp/JJSP/photorv/";
 String small=null;
 
 try {
  Class.forName("org.gjt.mm.mysql.Driver");
 } catch (ClassNotFoundException e ) {
  out.println(e);
 }
 
 try{
  con = DriverManager.getConnection("jdbc:mysql://localhost:3306/photoboard?useUnicode=true&characterEncoding=euckr","root","1234");
 } catch (SQLException e) {
  out.println(e);
 }

 try {
  st = con.createStatement();
  sql = "select * from photorv where id="+id;
  rs = st.executeQuery(sql);
  if (!(rs.next()))  {
   out.println("해당 내용이 없습니다");
  } else {
   String finame=url+rs.getString("filename");
   out.println("<div id=product_table>");
   out.println("<div class=product_img>");
   out.println("<A href=JavaScript:view(\""+rs.getString("filename")+"\")>");
   out.println("<IMG width=400px height=400px src="+finame+">");
   out.println("<BR></A><a href='javascript:frameclose()'></div>");
   out.println("<div class=product_com>");
   out.println("<hr width = '100%' color = '#737373' size = '3'>");
   out.println("<p class='product_sub'>"+rs.getString("subject")+"</p>");
   out.println("<p>작성자:"+rs.getString("name")+"</p>");
   out.println("<p>상품:"+rs.getString("product_name")+"</p>");
   out.println("</FONT></TH></TR>");  
   out.println("<TR>");
   out.println("<TD >");
   out.println("<U>내용 :</U><BR>");
   out.println(rs.getString("content") );
   out.println("<hr width = '100%' color = '#737373' size = '3'>");
   out.println("</div>"); 
   out.println("</div>");
  }
 out.print("<div style='float:right;margin:2%;'>");
 out.print("<a href='photo_del.jsp?id="+id+"&page=1'><img src='images/delete_2.png'></a>&nbsp;&nbsp;");
 out.print("<A href=\'photo_list.jsp'><img src='images/review_list.png' style='width:'></A>");
 out.print("</div>");
  rs.close();
  st.close();
  con.close();
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