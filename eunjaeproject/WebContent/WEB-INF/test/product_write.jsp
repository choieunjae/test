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
 function check(f) {
	 blank=false;
	 for (i=0; i<f.elements.length;i++) {
	  if (f.elements[i].value=="")
	   if (f.elements[i].name != "large") 
	    blank= true;
	 }
	 if (blank==true) 
	  alert("모든 항목을 입력하셔야 합니다.");
	 else
	  f.submit();
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
<script>
function check(f) {
	 blank=false;
	 for (i=0; i<f.elements.length;i++) {
	  if (f.elements[i].value=="")
	   if (f.elements[i].name != "large") 
	    blank= true;
	 }
	 if (blank==true) 
	  alert("모든 항목을 입력하셔야 합니다.");
	 else
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


<FORM method=post action="product_save.jsp" enctype="multipart/form-data" >
<TABLE width=80% border=0 align=center cellspacing=0 cellpadding=2>
<tr align="center"> 
   <td colspan="2" height="1" bgcolor="#e8f0ff" ></td>
  </tr>
 <TR>
  <TH  colspan=2  height=40px;>
   <FONT color=black> 상품 올리기</FONT></TH>
 </TR>
 <tr align="center"> 
   <td colspan="2" height="1" bgcolor="#e8f0ff" ></td>
  </tr>
 <TR>
  <TH width=20% height=40px; bgcolor=#e8f0ff align=center style='border-right:1px solid #e8f0ff; border-left:1px solid #e8f0ff;'>
   <FONT size=2> 작성자</FONT></TH>
  <TD style="padding:0 0 0 10 ;border-right:1px solid #e8f0ff"  align="left"> &nbsp;<INPUT type=text name=wname size=20>
  </TD>
 </TR>
 <TR>
  <TH width=20%height=40px; bgcolor=#e8f0ff align=center style='border-right:1px solid #e8f0ff; border-left:1px solid #e8f0ff;'>
   <FONT size=2>상품 분류</FONT></TH>
  <TD style="padding:0 0 0 10 ;border-right:1px solid #e8f0ff"  align="left" >
   <FONT size=2  color=white>
    &nbsp;<SELECT name=category1 size=1>
     <OPTION value=1>백팩
     <OPTION value=2>크로스백
     <OPTION value=3>힙색/에코백
     <OPTION value=4>클러치/지갑
     <OPTION value=5>캐리어
    </SELECT>
    <SELECT name=category2 size=1>
     <OPTION value=1>백팩(가죽)
     <OPTION value=2>백팩(캐쥬얼)
     <OPTION value=3>크로스백(가죽)
     <OPTION value=4>크로스백(캐쥬얼)
     <OPTION value=5>힙색
     <OPTION value=6>에코백
     <OPTION value=7>클러치
     <OPTION value=8>지갑
     <OPTION value=9>하드캐리어(21인치)
     <OPTION value=10>하드캐리어(22인치~25인치)
     <OPTION value=11>하드캐리어(26인치 이상)
     <OPTION value=12>소프트캐리어(21인치)
     <OPTION value=13>소프트캐리어(22인치~25인치)
     <OPTION value=14>소프트캐리어(26인치 이상)
    </SELECT>
   </FONT>
  </TD>
 </TR>
 
 </TR>
 <TR>
  <TH width=20% height=40px; bgcolor=#e8f0ff align=center style='border-right:1px solid #e8f0ff; border-left:1px solid #e8f0ff;'>
   <FONT size=2>상품명</FONT></TH>
  <TD style="padding:0 0 0 10 ;border-right:1px solid #e8f0ff"  align="left">
   &nbsp;<INPUT type=text name=pname size=30>
  </TD>
 </TR>
 <TR>
  <TH width=20% height=40px; bgcolor=#e8f0ff align=center style='border-right:1px solid #e8f0ff; border-left:1px solid #e8f0ff;'>
   <FONT size=2 >제조원</FONT></TH>
  <TD style="padding:0 0 0 10 ;border-right:1px solid #e8f0ff"  align="left">
   &nbsp;<INPUT type=text name=sname size=30>
  </TD>
 </TR>
 <TR>
  <TH width=20% height=40px; bgcolor=#e8f0ff align=center style='border-right:1px solid #e8f0ff; border-left:1px solid #e8f0ff;'>
   <FONT size=2 >시중가</FONT>
  </TH>
  <TD style="padding:0 0 0 10 ;border-right:1px solid #e8f0ff"  align="left">
   &nbsp;<INPUT type=text name=price size=10>
  </TD>
 </TR>
 <TR>
  <TH width=20% height=40px; bgcolor=#e8f0ff align=center style='border-right:1px solid #e8f0ff; border-left:1px solid #e8f0ff;'>
   <FONT size=2>판매가</FONT>
  </TH>
  <TD style="padding:0 0 0 10 ;border-right:1px solid #e8f0ff"  align="left">
   &nbsp;<INPUT type=text name=dprice size=10>
  </TD>
 </TR>
 <TR>
 <TH width=20% height=40px; bgcolor=#e8f0ff align=center style='border-right:1px solid #e8f0ff; border-left:1px solid #e8f0ff;'>
   <FONT size=2 >상품 색깔</FONT></TH>
  <TD style="padding:0 0 0 10 ;border-right:1px solid #e8f0ff"  align="left">
   <FONT size=2  color=white>
   &nbsp;<SELECT name=color size=1>
     <OPTION value=1>검정
     <OPTION value=2>흰색
     <OPTION value=3>네이비
     <OPTION value=4>아이보리
     <OPTION value=5>회색
     <OPTION value=6>파랑
    </SELECT>
    </FONT>
    </TD>
 </TR>
 <TR>
  <TH width=20% height=40px; bgcolor=#e8f0ff align=center style='border-right:1px solid #e8f0ff; border-left:1px solid #e8f0ff;'>
   <FONT size=2 >입고 수량</FONT>
  </TH>
  <TD style="padding:0 0 0 10 ;border-right:1px solid #e8f0ff"  align="left">
   &nbsp;<INPUT type=text name=stock size=10>
  </TD>
 </TR>
 <TR>
  <TH width=20% height=40px; bgcolor=#e8f0ff align=center style='border-right:1px solid #e8f0ff; border-left:1px solid #e8f0ff;'>
   <FONT size=2>작은 이미지</FONT>
  </TH>
  <TD style="padding:0 0 0 10 ;border-right:1px solid #e8f0ff"  align="left">
   &nbsp;<INPUT type=file name=small size=30>
  </TD >
 </TR>
 <TR>
  <TH width=20% height=40px; bgcolor=#e8f0ff align=center style='border-right:1px solid #e8f0ff; border-left:1px solid #e8f0ff;'>
   <FONT size=2 >큰 이미지</FONT>
  </TH>
  <TD style="padding:0 0 0 10 ;border-right:1px solid #e8f0ff"  align="left">
   &nbsp;<INPUT type=file name=large size=30>
  </TD>
 </TR>
 <TR>
  <TH height=40px; bgcolor=#e8f0ff align=center style='border-right:1px solid #e8f0ff; border-left:1px solid #e8f0ff;'>
   <FONT size=2> 상품 내용</FONT>
  </TH>

  <TD style="padding:0 0 0 10 ;border-right:1px solid #e8f0ff"  align="left">
   &nbsp;<TEXTAREA name=description cols=120 rows=5></TEXTAREA>
  </TD>
 </TR>
  <tr>              
  <td colspan="2" height="1" bgcolor="#e8f0ff"></td>     
 </tr>                                      
 <tr>                                         
  <td colspan="2" height="10"></td>                                    
 </tr>  
 <TR>
  <TD colspan=2 align="right">
   <INPUT type=button class='save'  value=" "onClick="check(this.form)" >
   <INPUT type=reset value=" "  class='reset2' >
  </TD>
 </TR>
 
</TABLE>

</CENTER>
</FORM>
<center><A href= "main.jsp"><img src='images/go_main.jpg'></A></center>
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