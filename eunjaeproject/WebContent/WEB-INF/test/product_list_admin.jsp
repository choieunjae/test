<%@ page contentType="text/html; charset=euc-kr" %> 
<%@ page language="java" import="java.sql.*,java.util.*,java.text.*" %> 
<% request.setCharacterEncoding("euc-kr"); %>
<%@ page import="java.net.URLEncoder" %>

<HTML>
<HEAD><TITLE>상품 목록(관리자)</TITLE>
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
<BODY>
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
<FONT color=#0000ff face=굴림 size=+1>
<STRONG> 상품 목록 </STRONG></FONT></P> 

<FORM method=post name=search action="product_list.jsp">
<TABLE border=0 width=95%>
 <TR>
  <TD align=right>
   <FONT size=-1>상품명으로 찾기</FONT>
   <INPUT type=text name=pname>
   <INPUT type=submit value="검색">
  </TD>
 </TR>
 <TR>
  <TH>
   <FONT size=-1 style="margin-left:5%;">
    [<A href="main.jsp">메인으로</A>]
    <A href="product_list_admin.jsp">전체</A>-
    <A href='product_list_admin.jsp?cat1=1'>백팩</A>-
    <A href='product_list_admin.jsp?cat1=2'>크로스백</A>-
    <A href='product_list_admin.jsp?cat1=3'>힙색/에코백</A>-
    <A href='product_list_admin.jsp?cat1=4'>클러치/지갑</A>-
    <A href='product_list_admin.jsp?cat1=5'>캐리어</A>
   </FONT>
  </TH>
 </TR>
</TABLE>
</FORM>

<CENTER>
<TABLE border=0 width=95% cellpadding=4 cellspacing=4 style="font-size:10pt">
 <TR>
  <TH width=5% bgcolor=#cfdeff>
   <FONT color=black face=굴림>
    <NOBR>번호</NOBR>
   </FONT>
  </TH>
    <TH width=25% bgcolor=#cfdeff>
   <FONT color=black >
    <NOBR>상품사진</NOBR>
   </FONT>
  </TH>
  <TH width=15% bgcolor=#cfdeff>
   <FONT color=black >
    <NOBR>상품명</NOBR>
   </FONT>
  </TH>
  <TH width=10% bgcolor=#cfdeff>
   <FONT color=black >
    <NOBR>코드번호</NOBR>
   </FONT>
  </TH>
  <TH width=10% bgcolor=#cfdeff>
   <FONT color=black >
    <NOBR>제조원</NOBR>
   </FONT>
  </TH>
  <TH width=10% bgcolor=#cfdeff>
   <FONT color=black >
    <NOBR>판매시작일</NOBR>
   </FONT>
  </TH>
  <TH width=10% bgcolor=#cfdeff>
   <FONT color=black>
    <NOBR>판매가(원)</NOBR>
   </FONT>
  </TH>
  <TH width=5% bgcolor=#cfdeff>
   <FONT color=black >
    <NOBR>재고량</NOBR>
   </FONT>
  </TH>
  <TH width=10% bgcolor=#cfdeff>
   <FONT color=black >
    <NOBR>분류</NOBR>
   </FONT>
  </TH>
  <TH width=40% bgcolor=#cfdeff>
   <FONT color=black >
    <NOBR>상세분류</NOBR>
   </FONT>
  </TH>
 </TR>
<% 
 String cond="";
 String ca="";
 String ca2="";
 String pn="";
 
 if (request.getParameter("cat1") != null) {
  if( !(request.getParameter("cat1").equals("")) ) {
   ca=request.getParameter("cat1");
   cond= " where category = '"+ca+"'";
  }
 }
if (request.getParameter("cat2") != null) {
  if( !(request.getParameter("cat2").equals("")) ) {
   ca2=request.getParameter("cat2");
   cond= " where category2 = '"+ca2+"'";
  }
 }

 if (request.getParameter("pname") != null) {
  if ( !(request.getParameter("pname").equals("")) ) {
   pn=request.getParameter("pname");
   cond= " where pname like '%"+ pn+"%'";
  }
 }
 
 Vector pname=new Vector();
 Vector sname=new Vector();
 Vector keyid=new Vector();
 Vector cat1=new Vector();
 Vector cat2= new Vector();
 Vector dprice=new Vector();
 Vector inputdate=new Vector();
 Vector stock=new Vector();
 Vector img = new Vector();
 String category=null;
 String category2=null;
 String url = "http://localhost:8080/jsp/JJSP/upload/";
 
 long id=0;
 
 NumberFormat nf = NumberFormat.getInstance();
 String downprice=null; 
 
 int where=1;
 int totalgroup=0;
 int maxpages=5;
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
 
 int startrow=0;
 int endrow=0;
 int maxrows=5;
 int totalrows=0;
 int totalpages=0;
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
  String sql = "select * from product";
  sql = sql+ cond+  " order by id";
  rs = st.executeQuery(sql);
  if (!(rs.next()))  {
   out.println("상품이 없습니다");
  } else {
	  
   do {
	img.addElement(rs.getString("large"));
    keyid.addElement(new Long(rs.getLong("id")));
    cat1.addElement(rs.getString("category"));
    cat2.addElement(rs.getString("category2"));
    pname.addElement(rs.getString("pname"));
    sname.addElement(rs.getString("sname"));
    dprice.addElement(new Integer(rs.getInt("downprice")));
    String idate = rs.getString("inputdate");
    idate = idate.substring(0,8);
    inputdate.addElement(idate);
    stock.addElement(new Integer(rs.getInt("stock")));
   }while(rs.next());
	

   totalrows = pname.size();
   totalpages = (totalrows-1)/maxrows +1;
   startrow = (where-1) * maxrows;
   endrow = startrow+maxrows-1  ;
   if (endrow >= totalrows)
    endrow=totalrows-1;
   totalgroup = (totalpages-1)/maxpages +1;
   if (endpage > totalpages) 
    endpage=totalpages;
   for(int j=startrow;j<=endrow;j++) {
    id= ( (Long)keyid.elementAt(j) ).longValue();
    downprice=nf.format( ((Integer)dprice.elementAt(j)).intValue() ); 
 switch ( Integer.parseInt((String)cat1.elementAt(j)) ) {
     case 1:
      category="백팩";
      break;
     case 2: 
      category="크로스백";
      break;
     case 3:
      category="힙색/에코백";
      break;
     case 4:
      category="클러치/지갑";
      break;   
     case 5:
      category="하드 캐리어";
      break;
     case 6:
      category="소프트 캐리어";
      break;
     default:
      break;
    } 
  switch ( Integer.parseInt((String)cat2.elementAt(j)) ) {
     case 1:
      category2="가죽 백팩";
      break;
     case 2: 
      category2="캐쥬얼 백팩";
      break;
     case 3:
      category2="가죽 크로스백";
      break;
     case 4:
      category2="캐쥬얼 크로스백";
      break;
     case 5:
      category2="힙색";
      break;
     case 6:
      category2="에코백";
      break;
     case 7:
      category2="클러치";
      break;
     case 8:
      category2="지갑";
      break;        
     case 9:
      category2="하드캐리어(21인치)";
      break;   
     case 10:
      category2="하드캐리어(22인치~25인치)";
      break;  
     case 11:
      category2="하드캐리어(26인치)";
      break;
     case 12:
      category2="소프트캐리어(21인치)";
      break;
     case 13:
      category2="소프트캐리어(22인치~25인치)";
      break;
     case 14:
      category2="소프트캐리어(26인치)";
      break;
     default:
      break;
    }
    out.println("<TR>");
    out.println("<TH width=5%  bgcolor=#eeeeee style='text-align:center'>");
    out.println(j+1+"</TH>");
    out.println("<TD width=25% bgcolor=#eeeeee style='text-align:center'>");
    out.println("<IMG width=300 height=300 src="+url+img.elementAt(j)+">");
    out.println("</TD>");
    out.println("<TD width=15% bgcolor=#eeeeee style='text-align:center'>");
    out.println("<A href=\"product_read.jsp?id="+id + "&go=" + where);
    out.println("&cat="+ca+"&pname="+pn+"\">"+pname.elementAt(j));  
    out.println("</A></TD>");
    out.println("<TD  width=10% bgcolor=#eeeeee style='text-align:center'>");
    out.println(id + "</TD>");
    out.println("<TD width=15% bgcolor=#eeeeee style='text-align:center'>");
    out.println(sname.elementAt(j) + "</TD>");
    out.println("<TD width=10% bgcolor=#eeeeee style='text-align:center'>");
    out.println(inputdate.elementAt(j)+ "</TD>");
    out.println("<TD width=10% bgcolor=#eeeeee style='text-align:center'>");
    out.println(downprice+ "</TD>");
    out.println("<TD width=5% bgcolor=#eeeeee style='text-align:center'>");
    out.println(stock.elementAt(j) + "</TD>");
    out.println("<TD width=20% bgcolor=#eeeeee style='text-align:center' >");
    out.println(category + "</TD>");
     out.println("<TD width=40% bgcolor=#eeeeee style='text-align:center'>");
    out.println(category2 + "</TD>");
   }
   rs.close();    
  }
  out.println("</TABLE>");
  st.close();
  con.close();
 } catch (SQLException e) {
  out.println(e);
 } 
  if (wheregroup > 1) {
  out.print("<font size='2'>[<A href=\"product_list_admin.jsp?gogroup=1"); 
  out.print("&cat1="+ca+"&pname="+pn+"\">처음</A>]</font>");
  out.print("<font size='2'>[<A href=\"product_list_admin.jsp?gogroup="+priorgroup);
  out.print("&cat1="+ca+"&pname="+pn+ "\">이전</A>]</font>");
 } else {
  out.println("<font size='2'>[처음]</font>") ;
  out.println("<font size='2'>[이전]</font>") ;
 }
 
 if (totalrows !=0) {  
  for(int jj=startpage; jj<=endpage; jj++) {
   if (jj==where) 
    out.println("<font size='2'>["+jj+"]</font>") ;
   else {
		   out.print("<font size='2'>[<A href=\"product_list_admin.jsp?cat1="+ca+"&go="+jj) ;
		    out.print("\">"+jj + "</A>]</font>") ;
   }
  } 
 }
 if (wheregroup < totalgroup) {
  out.print("<font size='2'>[<A href=\"product_list_admin.jsp?gogroup="+ nextgroup);
  out.print("&cat1="+ca+"&pname="+pn+"\">다음</A>]</font>");
  out.print("<font size='2'>[<A href=\"product_list_admin.jsp?gogroup="+ totalgroup);
  out.print("&cat1="+ca+"&pname="+pn+"\">마지막</A>]</font>");
 } else {
  out.println("<font size='2'>[다음]</font>");
  out.println("<font size='2'>[마지막]</font>");
 }
 out.println("<br>");
 out.println ("<font size='2'>전체상품수 :"+totalrows+"</font>"); 
 
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