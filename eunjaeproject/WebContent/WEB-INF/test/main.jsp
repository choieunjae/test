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
     <td width="3%" align="center" class="style1" align="center">회원ID </td>
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
<!--     	<li><a href="searchfilter.jsp">맞춤검색필터</a></li> -->
<!-- 		<li><a href="backpack.jsp">백팩</a></li> -->
<!-- 		<li><a href="crossbag.jsp">크로스백</a></li> -->
<!-- 		<li><a href="hipeco.jsp">힙색/에코백</a></li> -->
<!-- 		<li><a href="clutchwallet.jsp">클러치/지갑</a></li> -->
<!-- 		<li><a href="carrier.jsp">캐리어</a></li> -->
<!-- 		<li><a href="photo_list.jsp">포토리뷰</a></li> -->
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
<p class="name">망베르스 대용량 메신저백 크로스백</p>
<p class="price">
<span class="sale_price">68,780원</span>
<del>74,000원</del>
</p>
</div>
</div>
</li> 
<li>
<div class="best_item">
<img class="best" src="images/bestbag_2.jpg">
<div class="desc">
<p class="name">잔스포츠 빅스튜던트</p>
<p class="price">
<span class="sale_price">56,610원</span>
<del>62,900원</del>
</p>
</div>
</div>
</li>
<li><div class="best_item">
<img class="best" src="images/bestbag_3.jpg">
<div class="desc">
<p class="name">[베테제] Double Youth Backpack (black) 백팩</p>
<p class="price">
<span class="sale_price">52,000원</span>
<!-- <del>50000원</del> -->
</p>
</div>
</div>
</li>
<li><div class="best_item">
<img class="best" src="images/bestbag_4.jpg">
<div class="desc">
<p class="name">킥플립 백팩 블랙_I006288.89.00</p>
<p class="price">
<span class="sale_price">119,000원</span>
<del>128,000원</del>
</p>
</div>
</div>
</li>
<li><div class="best_item">
<img class="best" src="images/bestbag_5.jpg">
<div class="desc">
<p class="name">MARK RYDEN 마크라이든 노트북 학생 직장인 백팩 MR0018B</p>
<p class="price">
<span class="sale_price">85,000원</span>
<!-- <del>50000원</del> -->
</p>
</div>
</div>
</li>
</ul>
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