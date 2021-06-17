<%@ page contentType="text/html;charset=EUC-KR" %>  
<%@ page language="java" import="java.text.*" %> 
<% request.setCharacterEncoding("euc-kr"); %> 
<% 

 int total=Integer.parseInt(request.getParameter("total"));
 int count=Integer.parseInt(request.getParameter("count"));
 
 NumberFormat nf= NumberFormat.getNumberInstance();
 String totalstr =  nf.format(total);   

%>
<HTML>
<link href="filegb.css" rel="stylesheet" type="text/css">
<meta charset="utf-8">
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
<link rel="StyleSheet" href="style.css" type="text/css">
<script language="JavaScript">
function card(){
	if(order.pay[0].checked == true){
		order.number.style.display="";
	}else if(order.pay[1].checked == true){
		order.number.style.display="none";
	}
	
}

function check(f) {
	  blank=false;
	  for (i=0; i<f.elements.length;i++) {
	   if (f.elements[i].value=="") {
	    if (f.elements[i].name != "number") 
	     blank=true ;
	    if ((f.elements[i].name == "number") && (f.pay.value == "card"))
	     blank=true ;
	   }
	  }

	  if (blank==true) 
	   alert("모든 항목을 입력하셔야 합니다.");
	  else
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
function card(){
	if(order.pay[0].checked == true){
		order.number.style.display="";
	}else if(order.pay[1].checked == true){
		order.number.style.display="none";
	}	
	
}
function check(f) {
	  blank=false;
	  for (i=0; i<f.elements.length;i++) {
	   if (f.elements[i].value=="") {
	    if (f.elements[i].name != "number") 
	     blank=true ;
	    if ((f.elements[i].name == "number") && (f.pay.value == "card"))
	     blank=true ;
	   }
	  }

	  if (blank==true) 
	   alert("모든 항목을 입력하셔야 합니다.");
	  else
	   f.submit();
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
<P>
 
<FORM method=post name=order action="order_save.jsp" >
<TABLE width=80% align="center" cellspacing="0" cellpadding="2">
 <tr align="center"> 
   <td colspan="3" height="1" bgcolor="#e8f0ff"></td>
  </tr>
 <TR>
  <TH colspan=2>
   <FONT size=+1 color=black>주문하기</FONT>
  </TH>
 </TR>
   <tr align="center"> 
   <td colspan="3" bgcolor="#e8f0ff" height="1"></td>
  </tr>
 <TR>
  <TD width=10% height=40px; bgcolor=#e8f0ff align=center style="border-right:1px solid #e8f0ff; border-left:1px solid #e8f0ff;">
   <FONT size=2 color=black>이름</FONT>
  </Td>
  <TD >
   &nbsp;<INPUT type=text name=wname size=30>
  </TD>
 </TR>
 <TR>
  <TD width=10% height=40px; bgcolor=#e8f0ff align=center style="border-right:1px solid #e8f0ff; border-left:1px solid #e8f0ff;">
   <FONT size=-1 color=black>결제 유형</FONT>
  </TD>
  <TD>
   <FONT size=-1>
    &nbsp;<INPUT type=radio name=pay value="card" onclick="card()">카드
    &nbsp;<INPUT type=radio name=pay value="cash" onclick="card()">온라인 입금
    <br>
    &nbsp;<INPUT type=text class=number name=number style="display:none;" placeholder="카드번호를 입력해 주세요." size=30>
   </FONT>
  </TD>
 </TR>

 <TR>
  <TD width=10% height=50px; bgcolor=#e8f0ff align=center style="border-right:1px solid #e8f0ff; border-left:1px solid #e8f0ff;">
   <FONT size=-1 color=black>배달 주소</FONT>
  </TD>
  <TD>
   &nbsp;<input type="text" name="zipcode_1" size="3" maxlength="3" class="input_style1" > - 
   <input type="text" name="zipcode_2" size="3" maxlength="3" class="input_style1" >
   <input name="button" type="button" onClick="window.open('zipcode_search2.jsp','zipcodesearch2','scrollbars=yes,width=500,height=500')" value="우편번호 검색">
   <font class="style2"><font color="#888888">우편번호 검색 버튼을 누르세요.</font></font><br>
   &nbsp;<input type="text" name="address_1" size="100" maxlength="100" class="input_style1" ><Br>
   &nbsp;<input type="text" name="address_2" size="100" maxlength="100" class="input_style1">
   <font class="style2"><font color="#888888">나머지 주소를 적어 넣습니다.</font></font>
  </TD>
 </TR>
 <TR>
  <TD width=10% height=40px; bgcolor=#e8f0ff align=center style="border-right:1px solid #e8f0ff; border-left:1px solid #e8f0ff;">
   <FONT size=-1 color=black>전화번호</FONT>
  </TD>
  <TD>
  &nbsp;<select name="phone1">
    <option value="010">010</option>                
    <option value="011">011</option>
    <option value="016">016</option>
    <option value="017">017</option>
    <option value="018">018</option>
    <option value="019">019</option>
   </select> - 
   <input type="text" name="phone2" size="4" maxlength="4" class="input_style1">  - 
   <input type="text" name="phone3" size="4" maxlength="4" class="input_style1"></td>
  </TD>
 </TR>
 <TR>
  <TD width=10% height=30px; bgcolor=#e8f0ff align=center style="border-right:1px solid #e8f0ff; border-left:1px solid #e8f0ff;">
   <FONT size=-1 color=black>주문 총 금액</FONT>
  </TD>
  <TD >
   <%=totalstr%>원
  </TD>
 </TR>
 <TR>
  <TD colspan=2>
   <INPUT type=hidden name=total value=<%=total%>>
   <INPUT type=hidden name=count value=<%=count%>>
   <INPUT type=button value=" " onClick="check(this.form)" class=ok>
   <INPUT type=reset value=" " class=rewrite>
  </TD>
 </TR>
</TABLE>
</CENTER>
</FORM>
<center><A href= "sale_list.jsp"><img src='images/go_baguni.jpg'></A>
</center>

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