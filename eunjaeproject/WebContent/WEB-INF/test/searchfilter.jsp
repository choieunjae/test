<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>ENJOY BAG!</title>
<link href="css/bag.css" media="all" rel="stylesheet" />
<%@ page contentType="text/html; charset=euc-kr" %> 
<%@ page language="java" import="java.sql.*,java.util.*,java.text.*" %> 
<% request.setCharacterEncoding("euc-kr"); %>
<%@ page import="java.net.URLEncoder" %>
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


</head>
<BODY>
<body>
   <div id="wrap">
      <header>
	<a href="main.jsp" target="_blank">
    	<p style="text-align: center;"><img class="logo" src="images/logo.png" alt="logo"></a> </p>  
            <div id="top">
	<div class="product">
	<class="product"><a href="product_write.jsp">��ǰ ����ϱ� (������)</a>
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
<P align=center>
<FONT color=#000000 size=+1>
<STRONG> ���� �˻� ���� </STRONG></FONT></P> 

<FORM method=get name=search action="searchfilter.jsp">
<TABLE border=0 width=95%>
 <TR>
  <TD align=right>
   <FONT size=-1>��ǰ������ ã��</FONT>
   <INPUT type=text name=pname>&nbsp;
   <INPUT type=submit class="search_2" value=" ">
  </TD>
 </TR>
 <TR>
  <TH>
    <p class="s_filter">
    <input type="checkbox" name="co" value="1">����
    <input type="checkbox" name="co" value="2">�Ͼ�
    <input type="checkbox" name="co" value="3">���̺�
    <input type="checkbox" name="co" value="4">���̺���
 	<input type="checkbox" name="co" value="5">ȸ��
    <input type="checkbox" name="co" value="6">�Ķ�
    </p>
  <br><br><Br>
  <p class="s_filter2">
    <input type="checkbox" name="cat1" value="1">����
    <input type="checkbox" name="cat1" value="2">ũ�ν���
    <input type="checkbox" name="cat1" value="3">����/���ڹ�
    <input type="checkbox" name="cat1" value="4">Ŭ��ġ/����
 	<input type="checkbox" name="cat1" value="5">ĳ����
   </p>
   <input type="submit" class="submit_filter" value=" "> 
  </TH>
 </TR>
</TABLE>
</FORM>

<CENTER>
<ul class="product_list" border=0 style="font-size:10pt">

<% 
 String cond="";
 String ca="";
 String ca2="";
 String pn="";
 String co = "";
 String cor[] = request.getParameterValues("co");
 String cate[]= request.getParameterValues("cat1");
 
// if(request.getParameter("co")!=null && request.getParameter("cat1")!=null){
// 	if(!(request.getParameter("co").equals(""))&&!(request.getParameter("cat1").equals(""))){
// 		co=request.getParameter("co");
// 		ca=request.getParameter("cat1");
// 		cond=" where color='"+co+"' and category='"+ca+"'";	
// 	}
// }else if(request.getParameter("co")!=null){
// 	if(!(request.getParameter("co").equals(""))){
// 		co=request.getParameter("co");
// 		cond=" where color ='"+co+"'";
// 	}
// }else if(request.getParameter("cat1")!=null){
// 	 if( !(request.getParameter("cat1").equals("")) ) {
// 		   ca=request.getParameter("cat1");
// 		   cond= " where category = '"+ca+"'";
// 	}
// }

if(cor!=null&&cate!=null){
	if(!(cor.equals(""))&&!(cate.equals(""))){
		cond = " where (color ='";
		for(int i =0; i<cor.length; i++){
			cond += cor[i]+"' or color='";
		}
		cond += "') and (category ='";
		for(int i =0; i<cate.length; i++){
			cond += cate[i]+"' or category='";
	}
		cond += "')";
	}
}else if(cor!=null){
	if(!(cor.equals(""))){
		cond = " where color ='";
		for(int i =0; i<cor.length; i++){
			cond += cor[i]+"' or color='";
		}
		cond += "'";
		
	}
}else if(cate!=null){
	if(!(cate.equals(""))){
		cond = " where category ='";
		for(int i =0; i<cate.length; i++){
			cond += cate[i]+"' or category='";
		}
		cond += "'";
	}
}

// if(request.getParameter("co")!=null){
// 	if(!(request.getParameter("co").equals(""))){
// 		co=request.getParameter("co");
// 		cond=" where color ='"+co+"'";
// 	}
// }
// if (request.getParameter("cat1") != null) {
// 	  if( !(request.getParameter("cat1").equals("")) ) {
// 	   ca=request.getParameter("cat1");
// 	   cond= " where category = '"+ca+"'";
// 	  }
// 	 }
 
 Vector pname=new Vector();
 Vector sname=new Vector();
 Vector keyid=new Vector();
 Vector cat1=new Vector();
 Vector cat2= new Vector();
 Vector col = new Vector();
 Vector dprice=new Vector();
 Vector inputdate=new Vector();
 Vector stock=new Vector();
 Vector img = new Vector();
 String category=null;
 String category2=null;
 String color = null;
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
 int maxrows=16;
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
  sql = sql+ cond+" order by id";
  rs = st.executeQuery(sql);
  if (!(rs.next()))  {
   out.println("��ǰ�� �����ϴ�");
  } else {
	  
   do {
	img.addElement(rs.getString("large"));
    keyid.addElement(new Long(rs.getLong("id")));
    cat1.addElement(rs.getString("category"));
    cat2.addElement(rs.getString("category2"));
    col.addElement(rs.getString("color"));
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
    switch(Integer.parseInt((String)col.elementAt(j)) ){
    case 1:
    	color="����";
    	break;
    case 2:
    	color="���";
    	break;
    case 3:
    	color="���̺�";
    	break;
    case 4:
    	color="���̺���";
    	break;
    case 5: 
    	color="ȸ��";
    	break;
    case 6:
    	color="�Ķ�";
    	break;
    default:
    	break;
    }
    switch ( Integer.parseInt((String)cat1.elementAt(j)) ) {
    case 1:
     category="����";
     break;
    case 2: 
     category="ũ�ν���";
     break;
    case 3:
     category="����/���ڹ�";
     break;
    case 4:
     category="Ŭ��ġ/����";
     break;   
    case 5:
     category="�ϵ� ĳ����";
     break;
    case 6:
     category="����Ʈ ĳ����";
     break;
    default:
     break;
   } 
    out.println("<li>");
    out.println("<A href=\"product_read.jsp?id="+id + "&go=" + where);
    out.println("&cat="+ca+"\">");  
    out.println("<div class='img-box'><IMG width=100% src="+url+img.elementAt(j)+"></div>");
    out.println("<div class='text-box'><span class='p_name'>"+pname.elementAt(j)+"</span><br><br>");
    out.println("<span class='price'>"+downprice+"</span></div>");
    out.println("</A>");
    out.println("</li>");
   }
   rs.close();    
  }
  out.println("</ul>");
  st.close();
  con.close();
 } catch (SQLException e) {
  out.println(e);
 } 

 if (wheregroup > 1) {
  out.print("<font size='2'>[<A href=\"searchfilter.jsp?gogroup=1"); 
  out.print("\">ó��</A>]</font>");
  out.print("<font size='2'>[<A href=\"searchfilter.jsp?gogroup="+priorgroup);
  out.print("\">����</A>]</font>");
 } else {
  out.println("<font size='2'>[ó��]</font>") ;
  out.println("<font size='2'>[����]</font>") ;
 }
 
 if (totalrows !=0) {  
  for(int jj=startpage; jj<=endpage; jj++) {
   if (jj==where) 
    out.println("<font size='2'>["+jj+"]</font>") ;
   else {
	   if(cor!=null&&cate!=null){
	   	   out.print("<font size='2'>[<A href=\"searchfilter.jsp?go="+jj+"&co=") ;
	   	   for(int t=0; t<cor.length; t++){
	   		  out.print(cor[t]+"&co=");
	   	   }
	   	   out.print("&cat1=");
	   	   for(int v=0; v<cate.length; v++){
	   		   out.print(cate[v]+"&cat1=");
	   	   }
		    out.print("\">"+jj + "</A>]</font>") ; 
	   }else if(cor!=null){
	   	   out.print("<font size='2'>[<A href=\"searchfilter.jsp?go="+jj+"&co=") ;
	  	 	for(int t=0; t<cor.length; t++){
	   		  out.print(cor[t]+"&co=");
	   	   }
	  	 	out.print("\">"+jj + "</A>]</font>") ; 
	   }else if(cate!=null){
		   out.print("<font size='2'>[<A href=\"searchfilter.jsp?go="+jj+"&cat1=") ;
		   for(int v=0; v<cate.length; v++){
	   		   out.print(cate[v]+"&cat1=");
	   	   }
	  	 	out.print("\">"+jj + "</A>]</font>") ;  
	   }else{
		   out.println("<font size='2'>[<A href=searchfilter.jsp?go="+jj+">"+jj+"</a>]</font>");

	   }
   }
  } 
 }
 if (wheregroup < totalgroup) {
  out.print("<font size='2'>[<A href=\"searchfilter.jsp?gogroup="+ nextgroup);
  out.print("\">����</A>]</font>");
  out.print("<font size='2'>[<A href=\"searchfilter.jsp?gogroup="+ totalgroup);
  out.print("\">������</A>]</font>");
 } else {
  out.println("<font size='2'>[����]</font>");
  out.println("<font size='2'>[������]</font>");
 }
 out.println("<br>");
 out.println ("<font size='2'>��ü��ǰ�� :"+totalrows+"</font>"); 
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