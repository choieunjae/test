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
	<class="product"><a href="admin_product.jsp">상품 등록하기 (관리자)</a>
	</div>
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
  out.println("<script>alert('가입처리가 되지 않았습니다. 다시 시도해 주세요.'); history.back();</script>");
 } finally {
  conn.close();
 }
%>

<html>
<head>
<title>가입 완료</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link rel="StyleSheet" href="style.css" type="text/css">
<script language="JavaScript">

function doSubmit() {
 form = document.join;
 if(!form.userid.value){
  alert('아이디를 입력하지 않았습니다.');
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
  <td colspan="2"  height="60px;"  >가입을 축하드립니다. 입력하신 내용을 확인하세요.</td>
 </tr>
 <tr align="center"> 
   <td colspan="5" height="1" bgcolor="#e8f0ff"></td>
  </tr>
 <tr> 
  <td width="15%" align="center" bgcolor=#e8f0ff height="40px;" border-bottom="1px solid #444444;"><font size="2">아이디</font></td>
  <td width="75%"><%=userid%></td>
 </tr>
 <tr> 
  <td width="15%"align="center" bgcolor=#e8f0ff height="40px;" border-bottom="1px solid #444444;"><font size="2">이름</font></td>
  <td width="75%"><%=username%></td>
 </tr>
 <tr> 
  <td width="15%" align="center" bgcolor=#e8f0ff height="40px;"  border-bottom="1px solid #444444;"><font size="2">비밀번호</font></td>
  <td width="75%">보안상 기재하지 않습니다.</td>
 </tr>
 <tr> 
  <td width="15%" align="center" bgcolor=#e8f0ff height="40px;"  border-bottom="1px solid #444444;"><font size="2">E-MAIL</font></td>
  <td width="75%"><%=email%></td>
 </tr>
 <tr> 
  <td width="15%" align="center" bgcolor=#e8f0ff height="40px;"  border-bottom="1px solid #444444;"><font size="2">우편번호</font></td>
  <td width="75%"><%=zipcode1+"-"+zipcode2%></td>
 </tr>
 <tr> 
  <td width="15%" align="center" bgcolor=#e8f0ff height="40px;"  border-bottom="1px solid #444444;"><font size="2">주소</font></td>
  <td width="75%"><%=address1%></td>
 </tr>
 <tr> 
  <td width="15%" align="center" bgcolor=#e8f0ff height="40px;"  border-bottom="1px solid #444444;"><font size="2">상세주소</font></td>
  <td width="75%"><%=address2%></td>    
 </tr>
 <tr> 
  <td width="15%" align="center" bgcolor=#e8f0ff height="40px;"  border-bottom="1px solid #444444;"><font size="2">휴대폰</font></td>
  <td width="75%">
  <% 
   if(phone.equals("--")) {
    out.println("<font color='blue'>선택하지 않았습니다.</font>");
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