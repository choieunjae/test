<%@ page contentType="text/html;charset=euc-kr"%>
<%@ page language="java" import="java.sql.*, java.text.*,java.util.*,java.io.*" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<HTML>
<HEAD><TITLE>��ǰ(�̹���)����</TITLE>
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
<script language="JavaScript">

</script>
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
<%
 String fileurl= "/jsp/JJSP/photorv/";
 String saveFolder="photorv";
 String encType="euc-kr";
 int Maxsize = 5*1024*1024;
 ServletContext context = getServletContext();
 try{
	 MultipartRequest multi =null;
	 
	 DefaultFileRenamePolicy policy = new DefaultFileRenamePolicy();
	 multi = new MultipartRequest(request,fileurl,Maxsize,encType,policy);
	 String na = multi.getParameter("name");
	 String em = multi.getParameter("email");
	 String sub = multi.getParameter("subject"); 
	 String cont = multi.getParameter("content");
	 String pw = multi.getParameter("password");
	 String pna = multi.getParameter("CPinfo");
	 
	  int id =1;
	  int pos=0;
	  if (cont.length()==1) {
	   cont = cont+ " ";
	  } else { 
	   while ((pos=cont.indexOf("\'", pos)) != -1) {
	    String left=cont.substring(0, pos);
	    String right=cont.substring(pos, cont.length());
	    cont = left + "\'" + right;
	    pos += 2;
	   }
	  }

 java.util.Date yymmdd = new java.util.Date() ;
 SimpleDateFormat myformat = new SimpleDateFormat("yy-MM-d h:mm a");
 
 String ymd=myformat.format(yymmdd);
 String sql=null;
 Connection con=null;
 Statement st=null; 
 ResultSet rs=null;  
 int cnt=0; 

 try {
  Class.forName("org.gjt.mm.mysql.Driver");
 } catch (ClassNotFoundException e){
  out.println(e.getMessage());
 }

 try {
  con = DriverManager.getConnection("jdbc:mysql://localhost:3306/photoboard?useUnicode=true&characterEncoding=euckr","root","1234");

  st = con.createStatement();
  sql = "select max(id) from  photorv";
  rs = st.executeQuery(sql);
  if (!(rs.next())) {
   id=1;
  }
  else {
   id= rs.getInt(1) + 1 ;
   rs.close();
  }       
  
  Enumeration files = multi.getFileNames();
  String filename ="";
  String name=(String)files.nextElement();
  filename=(String)multi.getFilesystemName(name);
  
  File file = multi.getFile(name);
  if(filename!=null){
	String original = multi.getOriginalFileName(name);
	String type=multi.getContentType(name);

	   sql = "insert into photorv(id,name,password,email,subject," +   
	   "content,inputdate,masterid,readcount,replynum,step,filename,"+
	   " filesize,product_name) values(" +id + ", '" +  na + "','" + pw + "','"+ em 
	   + "','" + sub + "','" + cont + "','" + ymd + "'," +id+","  
	   + "0,0,0,'"+filename+"',"+file.length()+",'"+pna+"')";
  }else{
	   sql = "insert into photorv(id,name,password,email,subject," +   
			    "content,inputdate,masterid,readcount,replynum,step,filename,"+
			    " filesize,product_name) values(" +id + ", '" +  na + "','" + pw + "','"+ em 
			    + "','" + sub + "','" + cont + "','" + ymd + "'," +id+","  
			    + "0,0,0,'',0,'"+pna+"')";
  }
  
  cnt=st.executeUpdate(sql);
  if(cnt>0){
	  if(filename!=null)
		  out.println("<div class='baguni_header' style='width:30%; margin:auto; text-align:center;'>������</div><div class='baguni_content'style='width:30%; height:250px; margin:auto; text-align:center;'><img src='images/upload.png' width=300 height=300><p style='margin:auto'></div><div class='baguni_footer'style='width:80%; margin:auto;text-align:center;'></div>");
	    else 
	    out.println("<div class='baguni_header' style='width:30%; margin:auto; text-align:center;'>������</div><div class='baguni_content'style='width:30%; height:250px; margin:auto; text-align:center;'><img src='images/notupload.png' width=300 height=300><p style='margin:auto'></div><div class='baguni_footer'style='width:80%; margin:auto;text-align:center;'></div>");
	   }else{
		   out.println("<div class='baguni_header' style='width:30%; margin:auto; text-align:center;'>������</div>");
		   out.println("<div class='baguni_content'style='width:30%; height:250px; margin:auto; text-align:center;'>");
		   out.println("<img src='images/notupload_2.png' width=300 height=300><p style='margin:auto'></div>");
		   out.println("<div class='baguni_footer'style='width:80%; margin:auto;text-align:center;'>");
	    out.println("</div>");
  }
  
  st.close();
  con.close();
 }catch (SQLException e) {
  out.println(e);
 }
 } catch(IOException ioe){
	 out.println(ioe);
 }
 
%>
<div style="margin:0 auto; width:80%">
<A href="photo_list.jsp"><img src="images/review_list.png" style="float:right;margin-left:4px;"></A> 
<A href="photo_write.jsp"><img src="images/review_upload.png"style="float:right">&nbsp;&nbsp;</A>
</div>
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