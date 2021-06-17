<%@ page contentType="text/html; charset=EUC-KR" %> 
<%@ page language="java" import="java.sql.*,java.util.*" %> 

<HTML>
<HEAD><TITLE>ENJOY BAG!</TITLE>
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

function view(temp){
	filename="/jsp/JJSP/upload/"+temp;
	i=window.open(filename,"win","height:400,width=400,toolbar=0, menubar=0, scrollbars=1, resizeble=1, status=0");

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



// function erchk() {
<%-- 	var value = '<%=session.getValue("member_id")%>'; --%>
//     if (value=='null') {
//         alert("로그인 먼저 해주세요!");
//         return false;
// 	}else
// 		document.baguni.submit();
// 	}
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
	filename="/jsp/JJSP/upload/"+temp;
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
 <td width="9%" class="style2"><a href="select.jsp" target="mainFrame">개인 정보 조회</a></td>
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
int maxrows=4;
int totalrows=0;
int totalpages=0;
Vector name=new Vector();
Vector inputdate=new Vector();
Vector email=new Vector();
Vector subject=new Vector();
Vector rcount=new Vector();
Vector step=new Vector();
Vector keyid=new Vector();
Vector fname=new Vector();
Vector like_cnt=new Vector();
String finame=null;

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
 
 String url = "http://localhost:8080/jsp/JJSP/upload/";
 String small=null;
 
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
  sql = "select * from product where id="+id;
  rs = st.executeQuery(sql);
  if (!(rs.next()))  {
   out.println("해당 내용이 없습니다");
  } else {
   small=url+rs.getString("small");
   out.println("<div style='height:620px;'>");
   out.println("<div id=product_table>");
   out.println("<div class=product_img>");
   out.println("<div class=product_name>");
   out.println("<p class='product_sub' style='width:40%; padding:0 20%; '>"+rs.getString("pname")+"</p>");
   out.println("</div>");
   out.println("<A href=JavaScript:view(\""+rs.getString("large")+"\")>");
   out.println("<IMG width=400px height=400px src="+small+">");
   out.println("<BR></A><a href='javascript:frameclose()'></a>");
   out.println("<div class=product_comment>");
   out.println("<p style='width:60%;'>"+rs.getString("description")+"</p>");
   out.println("</div></div>");
   out.println("<div class=product_com>");
   out.println("<hr width = '100%' color = '#737373' size = '3'>");
   out.println("<p class='product_sub'>"+rs.getString("pname")+"</p>" ); 
   out.println("<p class='sub'>가격</p><p class='s_won'><STRIKE>"+rs.getString("price")+"</STRIKE>원</br><br></p>");
   out.println("<p class='sub'>할인가</p><p class='won'>"+rs.getString("downprice")+"원<br></p>");
  out.println("<FORM method=post name=baguni action=\"sale.jsp\" height=700px>");
    int stocki=rs.getInt("stock");
    if (stocki>0) { 
     out.println("<p class='jumun'>구매수량");
     out.println("<INPUT type=text name=quantity size=2 value=1>개<br><br>");
     out.println("배송비:무료</br></br></br>");
     out.println("<INPUT type=hidden name=id value="+id+">");
     out.println("<INPUT type=hidden name=cat1 value="+ca+">");
	 out.println("<INPUT type=hidden name=cat2 value="+ca2+">");
     out.println("<INPUT type=hidden name=pname value="+pn+">");
     out.println("<INPUT type=submit class=baguni name=baguni value=''></p>");
    } else
     out.println("품절");
   out.println("<hr width = '100%' color = '#737373' size = '3'>");
   out.println("</div>");  
   out.println("</div>");
  }
 out.print("<div id=right>");
 out.print("<A href=\"product_list.jsp?go="+ request.getParameter("go"));
 out.print("&cat="+ ca +"&pname="+pn+"\"><img src='images/go_list.jpg'></A>");
 out.print("</div></div>");
  
 String em=null;
 String sql2=null;
 Connection conn= null;
 Statement stmt =null;
 ResultSet rst =null;
 
String url2 = "http://localhost:8080/jsp/JJSP/photorv/";
String photo=null;

try {
 Class.forName("org.gjt.mm.mysql.Driver");
} catch (ClassNotFoundException e ) {
 out.println(e);
}

try{
 conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/photoboard?useUnicode=true&characterEncoding=euckr","root","1234");
} catch (SQLException e) {
 out.println(e);
}

try {
	  stmt = conn.createStatement();
	  sql2 = "select * from photorv where product_name='"+rs.getString("pname")+"' order by like_cnt desc";
	  rst = stmt.executeQuery(sql2);
	  if (!(rst.next()))  {
		  out.println("<center style='height:400px;'><p style='background-color:#e8f0ff; padding:1%;'><font size='4'>포토리뷰</font></p>");
	   out.println("해당 상품의 리뷰가 없습니다</center>");
	  } else {
		  out.println("<center style='height:400px;'><p style='background-color:#e8f0ff; padding:1%;'><font size='4'>포토리뷰</font></p>");
			   do {
				   keyid.addElement(new Integer(rst.getInt("id")));
				    name.addElement(rst.getString("name"));
				    email.addElement(rst.getString("email"));
				    String idate = rst.getString("inputdate");
				    idate = idate.substring(0,8);
				    inputdate.addElement(idate);
				    subject.addElement(rst.getString("subject"));
				    rcount.addElement(new Integer(rst.getInt("readcount")));
				    step.addElement(new Integer(rst.getInt("step")));
				    fname.addElement(rst.getString("filename"));
				    like_cnt.addElement(new Integer(rst.getInt("like_cnt")));
			   }while(rst.next());
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
			    String temp=(String)email.elementAt(j);
			    if ((temp == null) || (temp.equals("")) ) 
			     em= (String)name.elementAt(j); 
			    else
			     em = "<A href=mailto:" + temp + ">" + name.elementAt(j) + "</A>";
				
			    finame=(String)fname.elementAt(j);
			    if(finame.length()!=0)
			    	finame="<A href=down.jsp?file="+finame+">"+finame+"</a>";
			     
			    id= totalrows-j;
			    if(j%2 == 0){
			     out.println("<TR bgcolor='#FFFFFF' onMouseOver=\" bgColor= '#fff0f5'\" onMouseOut=\"bgColor=''\">");	
			    } else {
			     out.println("<TR bgcolor='#F4F4F4' onMouseOver=\" bgColor= '#fff0f5'\" onMouseOut=\"bgColor='#F4F4F4'\">");
			    }
			    
			    out.println("<li class='photo_review'>");
			    out.print("<A href=photo_read.jsp?id=");
			    out.print(id+ "&page=" + where +">" );
			    out.println("<div class='img_review'><IMG width=80% src="+url2+"/"+fname.elementAt(j)+"></a></div>");
			   
			    int stepi= ((Integer)step.elementAt(j)).intValue();
			    int imgcount = j-startrow;  
		       out.println("<p class='photo_like'>추천수 : "+like_cnt.elementAt(j)+ "</p>");
		       out.println("</li>");
		   }
	  rst.close();
	  } 
	  stmt.close();
	  conn.close();
	 
	}catch (SQLException e) {
		  out.println(e);
	  } 
rs.close();
st.close();
con.close();
} catch (SQLException e) {
out.println(e);
} 
 out.println("</center><p style='float:right'><A href='photo_list.jsp'><img src='images/more_review.jpg'></a></p>");

 out.println("<p style='float:right'><a href='photo_write.jsp'><img src='images/review_upl2.jpg'>&nbsp;&nbsp;</a></p>");
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