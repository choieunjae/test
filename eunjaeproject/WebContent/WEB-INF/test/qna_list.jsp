<%@ page contentType="text/html; charset=euc-kr" %> 
<%@ page language="java" import="java.sql.*,java.util.*" %> 
<HTML>
<HEAD><TITLE>QnA 게시판</TITLE>
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
<SCRIPT language="javascript">
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
 function check(){
  with(document.msgsearch){
   if(sval.value.length == 0){
    alert("검색어를 입력해 주세요!!");
    sval.focus();
    return false;
   }	
   document.msgsearch.submit();
  }
 }
 function rimgchg(p2,p3) {
  if (p3==2) 
   document.images[p2].src= "images/open.gif";
  else
   document.images[p2].src= "images/close.gif";
  }

 function imgchg(p2,p3) {
  if (p3==2) 
   document.images[p2].src= "images/open.gif";
  else
   document.images[p2].src= "images/close.gif";
 }
</SCRIPT>
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
<script language="javascript">
function check(){
	  with(document.msgsearch){
	   if(sval.value.length == 0){
	    alert("검색어를 입력해 주세요!!");
	    sval.focus();
	    return false;
	   }	
	   document.msgsearch.submit();
	  }
	 }
	 function rimgchg(p2,p3) {
	  if (p3==2) 
	   document.images[p2].src= "images/open.gif";
	  else
	   document.images[p2].src= "images/close.gif";
	  }

	 function imgchg(p2,p3) {
	  if (p3==2) 
	   document.images[p2].src= "images/open.gif";
	  else
	   document.images[p2].src= "images/close.gif";
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

</HEAD>
<BODY>

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
<P align=center><FONT color=#000000><STRONG>QnA</STRONG></FONT></P> 
<P>
<CENTER>
 <TABLE border=0 width=90% cellpadding=4 cellspacing=0 style="margin-bottom:2%;">
  <tr align="center"> 
   <td colspan="5" height="1" bgcolor="#e8f0ff"></td>
  </tr>
  <tr align="center" > 
   <td width="10%" ><font size="2">번호</font></td>
   <td width="60%" ><font size="2">제목</font></td>
   <td width="10%"><font size="2">등록자</font></td>
   <td width="10%"><font size="2">날짜</font></td>
   <td width="10%"><font size="2">조회</font></td>
  </tr>
  <tr align="center"> 
   <td colspan="5" bgcolor="#e8f0ff" height="1"></td>
  </tr>
 <% 
  Vector name=new Vector();
  Vector inputdate=new Vector();
  Vector email=new Vector();
  Vector subject=new Vector();
  Vector rcount=new Vector();
  
  Vector step=new Vector();
  Vector keyid=new Vector();
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
   con = DriverManager.getConnection("jdbc:mysql://localhost:3306/fboard?useUnicode=true&characterEncoding=euckr","root","1234");
  } catch (SQLException e) {
   out.println(e);
  }

 try {
  st = con.createStatement();
  String sql = "select * from freeboard order by" ;
  sql = sql + " masterid desc, replynum, step, id" ;
  rs = st.executeQuery(sql);

  if (!(rs.next()))  {
   out.println("게시판에 올린 글이 없습니다");
  } else {
   do {
    keyid.addElement(new Integer(rs.getInt("id")));
    name.addElement(rs.getString("name"));
    email.addElement(rs.getString("email"));
    String idate = rs.getString("inputdate");
    idate = idate.substring(0,8);
    inputdate.addElement(idate);
    subject.addElement(rs.getString("subject"));
    rcount.addElement(new Integer(rs.getInt("readcount")));
    step.addElement(new Integer(rs.getInt("step")));
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

   for(int j=startrow;j<=endrow;j++) {
    String temp=(String)email.elementAt(j);
    if ((temp == null) || (temp.equals("")) ) 
     em= (String)name.elementAt(j); 
    else
     em = "<A href=mailto:" + temp + ">" + name.elementAt(j) + "</A>";

    id= totalrows-j;
    if(j%2 == 0){
     out.println("<TR bgcolor='#FFFFFF' onMouseOver=\" bgColor= '#fff0f5'\" onMouseOut=\"bgColor=''\">");	
    } else {
     out.println("<TR bgcolor='#F4F4F4' onMouseOver=\" bgColor= '#fff0f5'\" onMouseOut=\"bgColor='#F4F4F4'\">");
    } 
    out.println("<TD align=center><font size='2'>");
    out.println(id+"</font></TD>");
    out.println("<TD>");
    int stepi= ((Integer)step.elementAt(j)).intValue();
    int imgcount = j-startrow; 
    if (stepi > 0 ) {
     for(int count=0; count < stepi; count++)
      out.print("&nbsp;&nbsp;");
     out.println("<IMG name=icon"+imgcount+ " src=images/arrow.png>");
     out.print("<A href=qna_read.jsp?id=");
     out.print(keyid.elementAt(j) + "&page=" + where );
     out.print(" onmouseover=\"rimgchg(" + imgcount + ",2)\"");
     out.print(" onmouseout=\"rimgchg(" + imgcount + ",3)\"><font size='2'>");
    } else {
     out.println("<IMG name=icon"+imgcount+ " src=images/close.gif>");
     out.print("<A href=qna_read.jsp?id=");
     out.print(keyid.elementAt(j) + "&page=" + where +"><font size='2'>" );
//      out.print(" onmouseover=\"imgchg(" + imgcount + ",2)\"");
//      out.print(" onmouseout=\"imgchg(" + imgcount + ",3)\">");
    }
String clink = "<A href = qna_read.jsp?id=" +keyid.elementAt(j);
clink = clink +"&page=" + where+">"+subject.elementAt(j)+"</font></a>";
    out.println(subject.elementAt(j) + "</TD>");
    out.println("<TD align=center><font size='2'>");
    out.println(em+ "</font></TD>");
    out.println("<TD align=center><font size='2'>");
    out.println(inputdate.elementAt(j)+ "</font></TD>");
    out.println("<TD align=center><font size='2'>");
    out.println(rcount.elementAt(j)+ "</font></TD>");
    out.println("</TR>"); 
   }
   rs.close();
  }
  out.println("</TABLE>");
  st.close();
  con.close();
 } catch (java.sql.SQLException e) {
  out.println(e);
 } 

 if (wheregroup > 1) {
  out.println("[<A href=qna_list.jsp?gogroup=1><font size='2'>처음</font></A>]"); 
  out.println("[<A href=qna_list.jsp?gogroup="+priorgroup +"><font size='2'>이전</font></A>]");
 } else {
  out.println("<font size='2'>[처음]</font>") ;
  out.println("<font size='2'>[이전]</font>") ;
 }
 if (name.size() !=0) { 
  for(int jj=startpage; jj<=endpage; jj++) {
   if (jj==where) 
    out.println("<font size='2'>["+jj+"]</font>") ;
   else
    out.println("[<A href=qna_list.jsp?go="+jj+"><font size='2'>" + jj + "</font></A>]") ;
   } 
  }
  if (wheregroup < totalgroup) {
   out.println("[<A href=qna_list.jsp?gogroup="+ nextgroup+ "><font size='2'>다음</font></A>]");
   out.println("[<A href=qna_list.jsp?gogroup="+ totalgroup + "><font size='2'>마지막</font></A>]");
  } else {
   out.println("<font size='2'>[다음]</font>");
   out.println("<font size='2'>[마지막]</font>");
  }
//   out.println ("<font size='2'>전체 글수 :"+totalrows+"</font>"); 
 %>
<!--<TABLE border=0 width=600 cellpadding=0 cellspacing=0>
 <TR>
  <TD align=right valign=bottom>
   <A href="freeboard_write.htm"><img src="images/write.gif" width="66" height="21" border="0"></A>
   </TD>
  </TR>
 </TABLE>-->

<FORM method="post" name="msgsearch" action="qna_search.jsp">
<TABLE border=0 width=600 cellpadding=0 cellspacing=0 style="padding-top:1%;">
 <TR>
  <TD align=right width="241"> 
   <SELECT name=stype >
    <OPTION value=1 >이름
    <OPTION value=2 >제목
    <OPTION value=3 >내용
    <OPTION value=4 >이름+제목
    <OPTION value=5 >이름+내용
    <OPTION value=6 >제목+내용
    <OPTION value=7 >이름+제목+내용
   </SELECT>
  </TD>
  <TD width="127" align="center">
   <INPUT type=text size="17" name="sval" >
  </TD>
  <TD width="115">&nbsp;<a href="#" onClick="check();"><img src="images/search.png" border="0" align='absmiddle' width="54px" height="24px;"></A></TD>
  <TD align=right valign=bottom width="117" style="padding-top:1%;"><A href="qna_write.jsp"><img src="images/write.png" border="0"></TD>
 </TR>
</TABLE>
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