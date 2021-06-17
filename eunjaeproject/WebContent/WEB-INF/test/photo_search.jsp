<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>ENJOY BAG!</title>
<link href="css/bag.css" media="all" rel="stylesheet" />
<%@ page contentType="text/html; charset=euc-kr" %> 
<%@ page language="java" import="java.sql.*,java.util.*,java.io.*" %>
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
<P align=center>
 <FONT color=#000000  size=3>
 <STRONG>포토 리뷰</STRONG>
 </FONT>
</P> 
<FORM method=post name=search action="photo_search.jsp">
 <TABLE border=0 width=95%>
  <TR>
   <TD align=left width=30% valign=bottom>
    </TD>
   <TD align=right width=70% valign=bottom>
    <FONT size=2 >
     <SELECT name=stype >
<% 
 String cond = null;
 int what = 1;
 String val=null;  
 if (request.getParameter("stype") != null) {
  what = Integer.parseInt(request.getParameter("stype"));
  val= request.getParameter("sval");
  if (what==1) {
   out.println("<OPTION value=1 selected>이름");
   cond = " where name like '%"+ val+ "%'";
  } else  
   out.println("<OPTION value=1 >이름");
  if (what==2) {
   out.println("<OPTION value=2 selected>제목");
   cond = " where subject like '%"+ val+ "%'";
  } else  
   out.println("<OPTION value=2>제목");
  if (what==3) { 
   out.println("<OPTION value=3 selected>내용");
   cond = " where content  like '%"+ val+ "%'";
  } else  
   out.println("<OPTION value=3>내용");
  if (what==4) {
   out.println("<OPTION value=4 selected>이름/제목");
   cond = " where name  like '%"+ val + "%'";
   cond = cond + " or  subject  like '%"+ val+ "%'";
  } else  
   out.println("<OPTION value=4>이름/제목");
  if (what==5) {
   out.println("<OPTION value=5 selected>이름/내용");
   cond = " where name  like '%"+ val + "%'";
   cond = cond + " or  content  like '%"+ val+ "%'";
  } else  
   out.println("<OPTION value=5>이름/내용");
  if (what==6) {
   out.println("<OPTION value=6 selected>제목/내용");
   cond = " where subject  like '%"+ val + "%'";
   cond = cond + " or  content  like '%"+ val+ "%'";
  } else  
   out.println("<OPTION value=6>제목/내용");
  if (what==7) {
   out.println("<OPTION value=7 selected>이름/제목/내용");
   cond = " where name  like '%"+ val + "%'";
   cond = cond + " or  subject  like '%"+ val+ "%'";
   cond = cond + " or  content  like '%"+ val+ "%'";
  } else  
   out.println("<OPTION value=7>이름/제목/내용");
  if (val.trim().equals(""))
   cond = "";
 }
%>
     </SELECT>
	</FONT>
    <INPUT type=text name="sval" value="<%=request.getParameter("sval")%>">
    <INPUT type=submit value="검색">
   </TD>
  </TR>
 </TABLE>
</FORM>
<CENTER>
<ul class='photo_list' border=0 width=95% cellpadding=4 cellspacing=4 style="font-size:10pt">

<% 
 Vector name=new Vector();
 Vector inputdate=new Vector();
 Vector email=new Vector();
 Vector subject=new Vector();
 Vector rcount=new Vector();
 Vector keyid=new Vector();
 Vector step=new Vector();
 Vector like_cnt=new Vector();
 Vector fname=new Vector();
 String finame=null;
 String url="http://localhost:8080/jsp/JJSP/photorv";
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
 
 int nextpage=where+1;
 int priorpage = where-1;
 int startrow=0;
 int endrow=0;
 int maxrows=5;
 int totalrows=0;
 int totalpages=0;
 
 int id=0;
 
 String em=null;
 Connection con= null;
 Statement st =null;
 ResultSet rs =null;
 
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
  String sql = "select * from photorv " + cond;
  sql = sql + " order by id desc" ;
  rs = st.executeQuery(sql);
  if (!(rs.next()))  {
	  out.println("<p class='review'>리뷰가 없습니다.</p>");
	   out.println("<p class='go_review'><a href='photo_write.jsp'>[리뷰 작성하러 가기]</a></p>");
  } else {
   do {
    keyid.addElement(new Integer(rs.getInt("id")));
    name.addElement(rs.getString("name"));
    email.addElement(rs.getString("email"));
    String idate = rs.getString("inputdate");
    idate = idate.substring(0,8);
    fname.addElement(rs.getString("filename"));
    inputdate.addElement(idate);
    subject.addElement(rs.getString("subject"));
    like_cnt.addElement(new Integer(rs.getInt("like_cnt")));
   }while(rs.next());
   totalrows = name.size();
   totalpages = (totalrows-1)/maxrows +1;
   startrow = (where-1) * maxrows;
   endrow = startrow+maxrows-1  ;
   if (endrow >= totalrows)
    endrow=totalrows-1;
   
   totalgroup = (totalpages-1)/maxpages +1;
   if (endpage > totalpages) 
    endpage=totalpages;


   for(int j =startrow;j<=endrow;j++) {

    id= totalrows-j;
    if(j%2 == 0){
     out.println("<TR bgcolor='#FFFFFF' onMouseOver=\" bgColor= '#fff0f5'\" onMouseOut=\"bgColor=''\">");	
    } else {
     out.println("<TR bgcolor='#F4F4F4' onMouseOver=\" bgColor= '#fff0f5'\" onMouseOut=\"bgColor='#F4F4F4'\">");
    }
    out.println("<li>");
    out.print("<A href=photo_read.jsp?id=");
    out.print(keyid.elementAt(j) + "&page=" + where +">" );
    out.println("<div class='img-box'><IMG width=100% src="+url+"/"+fname.elementAt(j)+"></div>");
   
//     int stepi= ((Integer)step.elementAt(j)).intValue();
//     int imgcount = j-startrow; 
 
// 	String clink = "<A href = photo_read.jsp?id=" +keyid.elementAt(j);
// 	clink = clink +"&page=" + where+">"+subject.elementAt(j)+"</a>";
    out.println("<p class='photo_sub' style='font-size:16px; font-weight:bold;'>제목 : "+subject.elementAt(j) + "</p></a>");
    out.println("<form name='like' method='post' action ='photo_list_ul.jsp' style='float:right; margin-top:2%;margin-right:2%' >");
    out.println("<input type='hidden' name='like' value='"+keyid.elementAt(j)+"'>");
    out.println("<input type='submit' name='sumbit' id='like' class='btn_info' value=''>");
    out.println("</input>");
    out.println("</form><br><br>");
    out.println("<p class='photo_date'>등록날짜 : "+inputdate.elementAt(j)+ "</p>");
    out.println("<p class='photo_like'>추천수 : "+like_cnt.elementAt(j)+ "</p>");
    out.println("</li>"); 
    

   }
   rs.close();
  }
  out.println("</ul>");
  st.close();
  con.close();
 } catch (java.sql.SQLException e) {
  out.println(e);
 } 
 if (wheregroup > 1) {
  out.print("[<A href=photo_search.jsp?gogroup=1"); 
  out.print("&stype="+ what+"&sval=" + val +">처음</A>]");
  out.print("[<A href=photo_search.jsp?gogroup="+priorgroup);
  out.print("&stype="+ what+"&sval=" + val +">이전</A>]");
 } else {
  out.println("[처음]") ;
  out.println("[이전]") ;
 }
 if (name.size() !=0) {
  for(int jj=startpage; jj<=endpage; jj++) {
   if (jj==where) 
    out.println("["+jj+"]") ;
   else {
   out.print("[<A href=photo_search.jsp?go="+jj);
   out.print("&stype="+ what+"&sval=" + val +">" + jj + "</A>]") ;
   }
  }
 }
 if (wheregroup < totalgroup) {
  out.print("[<A href=photo_search.jsp?gogroup="+ nextgroup);
  out.print("&stype="+ what+"&sval=" + val +">다음</A>]");
  out.print("[<A href=photo_search.jsp?gogroup="+totalgroup); 
  out.print("&stype="+ what+"&sval=" + val +">마지막</A>]");
 } else {
  out.println("[다음]");
  out.println("[마지막]");
 }
 out.println ("검색된 글 수 :"+totalrows);
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