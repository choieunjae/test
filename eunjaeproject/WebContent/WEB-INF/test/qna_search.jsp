<%@ page contentType="text/html; charset=euc-kr" %> 
<%@ page language="java" import="java.sql.*,java.util.*" %> 
<HTML>
<HEAD><TITLE>QnA �Խ���</TITLE>
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
	   alert("ID�� �Է��ϼ���!");
	   document.login.userid.focus();	
	   return;
	  }  
	  if (!document.login.password.value) {
	   alert("�н����带 �Է��ϼ���!");
	   document.login.password.focus();	
	   return;
	  }
	  document.login.submit();
	 }
 function check(){
  with(document.msgsearch){
   if(sval.value.length == 0){
    alert("�˻�� �Է��� �ּ���!!");
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
     <td width="7%" align="center" class="style1" align="center">ȸ��ID </td>
     <td width="7%"><input type="text" maxlength="16" name="userid" size='10' class="input_style1"></td>
     <td width="3%" class="style1" align="center">PASS </td>
     <td width="5%"><input type="password" maxlength="12" name="password" size='10' class="input_style1"></td>
<td width="1%">&nbsp; </td>     
<td  width="14%"class='style2' align="right"><a href="javascript:login_check()">�α���</a>&nbsp;<a href="insert_page.jsp" target="_top">ȸ������&nbsp;</a><a href="sale_list.jsp" target="_top">��ٱ���&nbsp;</a></a><a href="admin.jsp" target="_top">�����ڸ��</td>
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
          <td width="13%"><font class="style2"><%=mem_name%> �� ȯ���մϴ�.</font></td>
<td width="7%"><font  class="style2"><a href="logout.jsp">�α׾ƿ�</a></font></td>
 <td width="9%"><font class="style2"><a href="select.jsp" target="mainFrame">���� ���� ��ȸ</a></font></td>
 <td width="7%"><font class="style2"><a href="sale_list.jsp" target="mainFrame">��ٱ���</a></font></td>
 <td width="7%"><font class="style2"><a href="qna_list.jsp" target="mainFrame">������</a></font></td>
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
	<class="product"><a href="admin_product.jsp">��ǰ ����ϱ� (������)</a>
	</div>
	</div>

         <div id="menu">
            </div>
        <ul id="nav">
 		<li><a href="searchfilter.jsp">����˻�����</a></li>
		<li><a href="backpack.jsp">����</a></li>
		<li><a href="crossbag.jsp">ũ�ν���</a></li>
		<li><a href="hipeco.jsp">����/���ڹ�</a></li>
		<li><a href="clutchwallet.jsp">Ŭ��ġ/����</a></li>
		<li><a href="carrier.jsp">ĳ����</a></li>
		<li><a href="photo_list.jsp">���丮��</a></li>
		<li><a href="qna_list.jsp">QnA</a></li>
		</ul>
      </header>
<P>
<P align=center>
 <FONT color=#000000 size=3>
 <STRONG>�� �Խ���</STRONG>
 </FONT>
</P> 
<FORM method=post name=search action="qna_search.jsp">
 <TABLE border=0 width=95%>
  <TR>

   <TD align=right width=70% valign=bottom>
    <FONT size=2 face=����>
     <SELECT name=stype >
<% 
 String cond = null;
 int what = 1;
 String val=null;  
 if (request.getParameter("stype") != null) {
  what = Integer.parseInt(request.getParameter("stype"));
  val= request.getParameter("sval");
  if (what==1) {
   out.println("<OPTION value=1 selected>�̸�");
   cond = " where name like '%"+ val+ "%'";
  } else  
   out.println("<OPTION value=1 >�̸�");
  if (what==2) {
   out.println("<OPTION value=2 selected>����");
   cond = " where subject like '%"+ val+ "%'";
  } else  
   out.println("<OPTION value=2>����");
  if (what==3) { 
   out.println("<OPTION value=3 selected>����");
   cond = " where content  like '%"+ val+ "%'";
  } else  
   out.println("<OPTION value=3>����");
  if (what==4) {
   out.println("<OPTION value=4 selected>�̸�/����");
   cond = " where name  like '%"+ val + "%'";
   cond = cond + " or  subject  like '%"+ val+ "%'";
  } else  
   out.println("<OPTION value=4>�̸�/����");
  if (what==5) {
   out.println("<OPTION value=5 selected>�̸�/����");
   cond = " where name  like '%"+ val + "%'";
   cond = cond + " or  content  like '%"+ val+ "%'";
  } else  
   out.println("<OPTION value=5>�̸�/����");
  if (what==6) {
   out.println("<OPTION value=6 selected>����/����");
   cond = " where subject  like '%"+ val + "%'";
   cond = cond + " or  content  like '%"+ val+ "%'";
  } else  
   out.println("<OPTION value=6>����/����");
  if (what==7) {
   out.println("<OPTION value=7 selected>�̸�/����/����");
   cond = " where name  like '%"+ val + "%'";
   cond = cond + " or  subject  like '%"+ val+ "%'";
   cond = cond + " or  content  like '%"+ val+ "%'";
  } else  
   out.println("<OPTION value=7>�̸�/����/����");
  if (val.trim().equals(""))
   cond = "";
 }
%>
     </SELECT>
	</FONT>
    <INPUT type=text name="sval" value="<%=request.getParameter("sval")%>">
    <INPUT type=submit value="�˻�">
   </TD>
  </TR>
 </TABLE>
</FORM>
<CENTER>
 <TABLE border=0 width=90% cellpadding=4 cellspacing=0 style="margin-bottom:2%;">
  <tr align="center"> 
   <td colspan="5" height="1" bgcolor="#e8f0ff"></td>
  </tr>
  <tr align="center" > 
   <td width="10%" ><font size="2">��ȣ</font></td>
   <td width="60%" ><font size="2">����</font></td>
   <td width="10%"><font size="2">�����</font></td>
   <td width="10%"><font size="2">��¥</font></td>
   <td width="10%"><font size="2">��ȸ</font></td>
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
 Vector keyid=new Vector();
 Vector step=new Vector();
 
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
  String sql = "select * from freeboard " + cond;
  sql = sql + " order by id desc" ;
  rs = st.executeQuery(sql);
  if (!(rs.next()))  {
   out.println("�ش��ϴ� ���� �����ϴ�");
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
    String temp=(String)(email.elementAt(j));
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
    if (stepi > 0 ) {
        for(int count=0; count < stepi; count++)
         out.print("&nbsp;&nbsp;");
        out.print("<A href=qna_read.jsp?id=");
        out.print(keyid.elementAt(j) + "&page=" + where );
       } else {
        out.print("<A href=qna_read.jsp?id=");
        out.print(keyid.elementAt(j) + "&page=" + where +"><font size='2'>" );
//         out.print(" onmouseover=\"imgchg(" + imgcount + ",2)\"");
//         out.print(" onmouseout=\"imgchg(" + imgcount + ",3)\">");
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
  out.print("[<A href=qna_search.jsp?gogroup=1"); 
  out.print("&stype="+ what+"&sval=" + val +">ó��</A>]");
  out.print("[<A href=qna_search.jsp?gogroup="+priorgroup);
  out.print("&stype="+ what+"&sval=" + val +">����</A>]");
 } else {
  out.println("[ó��]") ;
  out.println("[����]") ;
 }
 if (name.size() !=0) {
  for(int jj=startpage; jj<=endpage; jj++) {
   if (jj==where) 
    out.println("["+jj+"]") ;
   else {
   out.print("[<A href=qna_search.jsp?go="+jj);
   out.print("&stype="+ what+"&sval=" + val +">" + jj + "</A>]") ;
   }
  }
 }
 if (wheregroup < totalgroup) {
  out.print("[<A href=qna_search.jsp?gogroup="+ nextgroup);
  out.print("&stype="+ what+"&sval=" + val +">����</A>]");
  out.print("[<A href=qna_search.jsp?gogroup="+totalgroup); 
  out.print("&stype="+ what+"&sval=" + val +">������</A>]");
 } else {
  out.println("[����]");
  out.println("[������]");
 }
 out.println ("�˻��� �� �� :"+totalrows);
%>
<footer>
<div class="util_menu"  style="height:50px; border-top:2px solid #96b6fa; border-bottom:2px solid #96b6fa;">
<span class="ft_1">�̿���</span>
<span>|</span>
<span class="ft_1">����������޹�ħ</span>
</div>
<span class="name" style="padding-top:2%;">Ȩ������ ��ǥ : ������</span>
<span class="tel" style="padding-top:2%;">����ó : 032-770-8114</span>
<span class="addr" style="padding-top:2%;">�ּ� : ��õ������ ���� ����� 113</span>
</footer>
</div>
</div>
</body>
</html>