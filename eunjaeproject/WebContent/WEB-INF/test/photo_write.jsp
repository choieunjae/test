
<%@ page language="java" import="java.sql.*,java.util.*" %> 
<HTML>                                         
<HEAD> 
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
<meta charset="utf-8">
<title>ENJOY BAG!</title>
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
                                      
<SCRIPT language="javascript">                              
function check(){                                         
	 with(document.msgwrite){                      
	  if(subject.value.length == 0){                  
	   alert("제목을 입력해 주세요!!");                       
	   subject.focus();                           
	   return false;                             
	  }                                         
	  if(name.value.length == 0){                   
	   alert("이름을 입력해 주세요!!");                  
	   name.focus();                              
	   return false;                                  
	  }                                         
	  if(password.value.length == 0){              
	   alert("비밀번호를 입력해 주세요!!");              
	   password.focus();                            
	   return false;                               
	  }                                        
	  if(content.value.length == 0){                    
	   alert("내용을 입력해주세요!!");                   
	   content.focus();                         
	   return false;                           
	  }                                        
	  document.msgwrite.submit();                       
	 }                                          
	}                                       
</SCRIPT>                                    

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
<FORM name="msgwrite" method="post" enctype="multipart/form-data" action="photo_save.jsp">    
<CENTER>
<table width="90%"cellspacing="0" cellpadding="2">
 <tr> 
  <td colspan="2" bgcolor="#e8f0ff" height="1"></td>
 </tr>
 <tr> 
   <td colspan="2" style="margin:auto; text-align:center;" height="50" class="notice">&nbsp;&nbsp;<font size="4">포토리뷰 등록하기</font></td>
 </tr>
 <tr> 
  <td colspan="2" bgcolor="#e8f0ff" height="1"></td>
 </tr>
 <tr> 
  <td width="124" height="30" align="center" bgcolor="#e6eeff" style="border-right:1px solid #e8f0ff; border-left:1px solid #e8f0ff;padding:0 0 0 14"> 
   <font size="2">이 름</font>
  </td>
  <td width="494"  style="border-right:1px solid #e8f0ff; border-left:1px solid #e8f0ff;padding:0 0 0 10"> 
   <input type=text name=name>
  </td>
 </tr>
 <tr> 
  <td width="124" align="center" bgcolor="#e6eeff"style="border-right:1px solid #e8f0ff; border-left:1px solid #e8f0ff; padding:0 0 0 14"> 
   <font size="2">상품</font>
  </td>
  <td width="494" style="border-right:1px solid #e8f0ff; border-left:1px solid #e8f0ff;padding:0 0 0 10" height="25"> 
	<select name="CPinfo" size="1">
 <%
     	String sql=null;
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
 			  sql = "select pname,id from product GROUP BY id ORDER BY category";
 			  rs = st.executeQuery(sql);
 			  while(rs.next()){
 				  String values=rs.getString("pname");
 				  String vaid=rs.getString("id");
 			  
     %>
     <option value='<%=values%>'><%=values%></option>
     <%
 			  }
      } catch (SQLException se) {
       System.out.println(se.getMessage());
      } finally {
       try {
        if (rs != null)
         rs.close();
        if (st != null)
         st.close();
        if (con != null)
         con.close();
       } catch (SQLException se) {
        System.out.println(se.getMessage());
       }

      }
     %>
 </select>

  </td>
 </tr>
 <tr> 
  <td width="124" align="center" bgcolor="#e6eeff"style="border-right:1px solid #e8f0ff; border-left:1px solid #e8f0ff; padding:0 0 0 14"> 
   <font size="2">E-mail</font>
  </td>
  <td width="494" style="border-right:1px solid #e8f0ff; border-left:1px solid #e8f0ff;padding:0 0 0 10" height="25"> 
   <input type=text name=email>
  </td>
 </tr>
 <tr> 
  <td width="124"  align="center" bgcolor="#e6eeff" style="border-right:1px solid #e8f0ff; border-left:1px solid #e8f0ff; padding:0 0 0 14"> 
   <font size="2">제 목</font>
  </td>
  <td width="80%" style="border-right:1px solid #e8f0ff; border-left:1px solid #e8f0ff; padding:0 0 0 10" height="25"> 
   <input type=text name=subject size="150" maxlength="60">
  </td>
 </tr>
 <tr> 
  <td width="124" height="162" align="center" bgcolor="#e6eeff" style="border-right:1px solid #e8f0ff; border-left:1px solid #e8f0ff; padding:7 0 0 14" valign="top"> 
   <font size="2">내 용</font>
  </td>
  <td width="80%" valign="top"style="padding:5 0 5 10 ;border-right:1px solid #e8f0ff ;padding:5 0 5 10"> 
   <textarea cols="136" rows="10" name=content maxlength="2000"></textarea>
  </td>
 </tr>
 <tr>
  <td width="124" align="center" bgcolor="#e6eeff" style="border-right:1px solid #e8f0ff; border-left:1px solid #e8f0ff; padding:0 0 0 14">
   <font size="2">첨부파일</font>
  </td>
  <td width="494" style="border-right:1px solid #e8f0ff; border-left:1px solid #e8f0ff; padding:5 0 5 10" height="25">
   <input type="file" name="file" size=30>
  </td>
 </tr>
 <tr> 
  <td width="124" align="center" bgcolor="#e6eeff" style="border-right:1px solid #e8f0ff; border-left:1px solid #e8f0ff; padding:0 0 0 14"> 
   <font size="2">암 호</font>
  </td>
  <td width="494" style="border-right:1px solid #e8f0ff; border-left:1px solid #e8f0ff; padding:5 0 5 10" height="25"> 
   <input type=password name=password>
   <br> (비밀번호를 입력하면 수정 또는 삭제가 가능합니다.) </td>
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
     <td width="28%">&nbsp;</td>
     <td width="51%">&nbsp;</td>
  <td width="5%"><a href="#" onClick="history.go(-1)"><img src="images/cancel.png" width="46" height="20" border="0"></td>
     <td width="5%"><a href="#" onClick="check();"><img src="images/ok.png" width="46" height="20" border="0"></a></td>
    </tr>
   </table>
  </td>
 </tr>
</table>
</CENTER>                                            
</FORM>   
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