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
<script language="JavaScript">

function MM_openBrWindow(theURL,winName,features) { 
 form = document.join;
 if(winName == "userid_check"){
  if(!checkValue(form.userid, '아이디', 5, 16)){
   return;
  }
  theURL = theURL+"?userid="+form.userid.value;
 }
 window.open(theURL,winName,features);
}

function checkValue(target, cmt, lmin, lmax){
 var Alpha = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
 var Digit = '1234567890';
 var astr = Alpha+Digit;
 var i;
 var tValue = target.value;
 if(tValue.length < lmin || tValue.length > lmax){
  if(lmin==lmax) alert(cmt+'는'+lmin+'Byte이어야 합니다.');
  else alert(cmt+'는'+lmin+'~'+lmax+'Byte 이내로 입력하셔야 합니다.');
  target.focus();
  return false;
 }
 if(astr.length > 1){
  for (i=0; i<tValue.length; i++){
   if(astr.indexOf(tValue.substring(i,i+1))<0){
    alert(cmt+'에 허용할 수 없는 문자가 입력되었습니다.');
    target.focus();
    return false;
   }
  }
 }
 return true;
}



function doSubmit() {
 form = document.join;
 if(!form.userid.value){
  alert('아이디를 입력하지 않았습니다.');
  form.userid.focus();
  return;
 }
 if(!checkValue(form.userid, '아이디', 5, 16)){
  return;
 }
 if(!form.username.value){
  alert('이름을 입력하지 않았습니다.');
  form.username.focus();
  return;
 }
 if(!form.password.value){
  alert('비밀번호를 입력하지 않았습니다.');
  form.password.focus();
  return;
 }
 if(form.password.value != form.password2.value){
  alert('비밀번호가 일치하지 않았습니다.');
  form.password.value = "";
  form.password2.value = "";
  form.password.focus();
  return;
 }
 if(form.userid.value == form.password.value){
  alert("아이디와 비밀번호를 서로 다르게 입력하세요!");
  form.password.value = "";
  form.password2.value = "";
  form.password.focus();
  return;
 }
 if (!checkValue(form.password,'비밀번호',4,12)){
  return;
 }
 
 if(!form.email.value){
  alert('Email을 입력하지 않았습니다.');
  form.email.focus();
  return;
 }
 if(form.email.value.indexOf("@") < 0){
  alert('Email주소 형식이 틀립니다.');
  form.email.focus();
  return;
 }
 if(form.email.value.indexOf(".") < 0){
  alert('Email 도메인 주소가 틀립니다.');
  form.email.focus();
  return;
 }
 if(!form.zipcode1.value || !form.zipcode2.value){
  alert('우편번호를 입력하지 않았습니다.');
  MM_openBrWindow('zipcode_search.jsp', 'zipcode_search', 'scrollbars=yes, width=500, height=250');
  return;
 }
 if(!form.address1.value){
  alert('주소1를 입력하지 않았습니다.');
  MM_openBrWindow('zipcode_search.jsp', 'zipcode_search', 'scrollbars=yes, width=500, height=250');
  return;
 }
 if(!form.address2.value){
  alert('주소2를 입력하지 않았습니다.');
  form.address2.focus();
  return;
 }
 form.submit();
 }

</script>

<style>

</style>
</HEAD>
<body bgcolor="#FFFFFF" oncontextmenu="return false" onselectstart="return false" ondragstart="return false">
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
<TABLE align=center cellpadding=8 cellspacing=0 width='80%' height="500px" topmargin="0" leftmargin="0" rightmargin="0" marginheight="0" marginwidth="0" >
<TR>
<TD width="80%">
<form name="join" method="post" action="insert.jsp">
<table width="80%" height="600px;"  cellspacing="0" cellpadding="0" style="margin:0 auto;" >
 <tr> 
 <h3 style="margin: 0 auto ; width:80%; padding-bottom:1%; text-align:center;">회원가입 </h3>
 <hr width=80% color=#e8f0ff>
  <td width="15%" align="center" bgcolor=#e8f0ff border-bottom="1px solid #444444;"><font class="style1">아이디</font><font color="#FF0000" size=1>*</font></td>
  <td width="75%">&nbsp;
   <input type="text" name="userid" size="16" maxlength="16" class="input_style1">
   <input type="button" value="중복확인" onClick="MM_openBrWindow('userid_check.jsp','userid_check','width=330,height=200')">
   <font class="style2">(영문+숫자 5~16자리) <font color="#888888">중복 확인 절차를 거쳐야 합니다.</font></font></td>
 </tr>
 <tr> 
  <td width="15%" align="center" bgcolor=#e8f0ff><font class="style1" >비밀번호</font><font color="#FF0000" size=1>*</font></td>
  <td width="75%">&nbsp; 
   <input type="password" name="password" size="12" maxlength="12" class="input_style1">
   <font class="style1">다시한번&nbsp; </font>
   <input type="password" name="password2" size="12" maxlength="12" class="input_style1">
   <font class="style2">(영문+숫자 4~12자리)</font></td>
 </tr>          
 <tr> 
  <td width="15%" align="center" bgcolor=#e8f0ff><font class="style1">이름</font><font color="#FF0000" size=1>*</font></td>
  <td width="75%">&nbsp;&nbsp;<input type="text" name="username" size="10" maxlength="10" class="input_style1"> </td>
 </tr>

 <tr > 
  <td width="15%" align="center" bgcolor=#e8f0ff><font class="style1">EMAIL</font><font color="#FF0000" size=1>*</font></td>
  <td width="75%">&nbsp;&nbsp;<input type="text" name="email" size="20" maxlength="50" class="input_style1"></td>
 </tr>
 <tr > 
  <td width="15%" align="center" bgcolor=#e8f0ff><font class="style1">주소</font><font color="#FF0000" size=1>*</font></td>
  <td width="75%">&nbsp; 
   <input type="text" name="zipcode1" size="3" maxlength="3" class="input_style1" > - 
   <input type="text" name="zipcode2" size="3" maxlength="3" class="input_style1" >
   <input name="button" type="button" onClick="MM_openBrWindow('zipcode_search.jsp','zipcodesearch','scrollbars=yes,width=500,height=250')" value="우편번호 검색">
   <font class="style2"><font color="#888888">우편번호 검색 버튼을 누르세요.</font></font><br>
   &nbsp;&nbsp;<input type="text" name="address1" size="50" maxlength="100" class="input_style1" ><Br>
   &nbsp;&nbsp;<input type="text" name="address2" size="50" maxlength="100" class="input_style1">
   <font class="style2"><font color="#888888">나머지 주소를 적어 넣습니다.</font></font>
  </td>
 </tr>

 <tr > 
  <td width="15%" align="center" bgcolor=#e8f0ff><font class="style1">핸드폰&nbsp;&nbsp;</font></td>
  <td width="75%">&nbsp; 
   <select name="phone1">
    <option value="010">010</option>                
    <option value="011">011</option>
    <option value="016">016</option>
    <option value="017">017</option>
    <option value="018">018</option>
    <option value="019">019</option>
   </select> - 
   <input type="text" name="phone2" size="4" maxlength="4" class="input_style1">  - 
   <input type="text" name="phone3" size="4" maxlength="4" class="input_style1"></td>
 </tr>
</table>
 <hr width=80% color=#e8f0ff>
<p style="margin:0 auto; width:80%;"><font color="#FF0000" size=1>*</font><font size="2">항목은 필수항목입니다.</font></p>
<table width="614" border="0" cellspacing="0" cellpadding="0" align="center" >
 <tr>
  <td width=100% align="center"> 
   <input type="hidden" name="userid_check">
   <input type="button" class='upload' value=" " onClick="doSubmit()">&nbsp;
   <input type="reset" class='reset' value=" " >&nbsp;
   <input type="button"class='cancel' value=" "  onClick="javascript:history.go(-1);">
  </td>
 </tr>
</table>
</form>
</TD></TR></TABLE>
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