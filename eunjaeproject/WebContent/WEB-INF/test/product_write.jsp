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
 function check(f) {
	 blank=false;
	 for (i=0; i<f.elements.length;i++) {
	  if (f.elements[i].value=="")
	   if (f.elements[i].name != "large") 
	    blank= true;
	 }
	 if (blank==true) 
	  alert("��� �׸��� �Է��ϼž� �մϴ�.");
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
     <td width="3%" align="center" class="style1" align="center">ȸ��ID </td>
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
<script>
function check(f) {
	 blank=false;
	 for (i=0; i<f.elements.length;i++) {
	  if (f.elements[i].value=="")
	   if (f.elements[i].name != "large") 
	    blank= true;
	 }
	 if (blank==true) 
	  alert("��� �׸��� �Է��ϼž� �մϴ�.");
	 else
	  f.submit();
	}
</script>
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
	<class="product"><a href="admin_product.jsp">��ǰ ����ϱ� (������)</a>
	</div>
 
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


<FORM method=post action="product_save.jsp" enctype="multipart/form-data" >
<TABLE width=80% border=0 align=center cellspacing=0 cellpadding=2>
<tr align="center"> 
   <td colspan="2" height="1" bgcolor="#e8f0ff" ></td>
  </tr>
 <TR>
  <TH  colspan=2  height=40px;>
   <FONT color=black> ��ǰ �ø���</FONT></TH>
 </TR>
 <tr align="center"> 
   <td colspan="2" height="1" bgcolor="#e8f0ff" ></td>
  </tr>
 <TR>
  <TH width=20% height=40px; bgcolor=#e8f0ff align=center style='border-right:1px solid #e8f0ff; border-left:1px solid #e8f0ff;'>
   <FONT size=2> �ۼ���</FONT></TH>
  <TD style="padding:0 0 0 10 ;border-right:1px solid #e8f0ff"  align="left"> &nbsp;<INPUT type=text name=wname size=20>
  </TD>
 </TR>
 <TR>
  <TH width=20%height=40px; bgcolor=#e8f0ff align=center style='border-right:1px solid #e8f0ff; border-left:1px solid #e8f0ff;'>
   <FONT size=2>��ǰ �з�</FONT></TH>
  <TD style="padding:0 0 0 10 ;border-right:1px solid #e8f0ff"  align="left" >
   <FONT size=2  color=white>
    &nbsp;<SELECT name=category1 size=1>
     <OPTION value=1>����
     <OPTION value=2>ũ�ν���
     <OPTION value=3>����/���ڹ�
     <OPTION value=4>Ŭ��ġ/����
     <OPTION value=5>ĳ����
    </SELECT>
    <SELECT name=category2 size=1>
     <OPTION value=1>����(����)
     <OPTION value=2>����(ĳ���)
     <OPTION value=3>ũ�ν���(����)
     <OPTION value=4>ũ�ν���(ĳ���)
     <OPTION value=5>����
     <OPTION value=6>���ڹ�
     <OPTION value=7>Ŭ��ġ
     <OPTION value=8>����
     <OPTION value=9>�ϵ�ĳ����(21��ġ)
     <OPTION value=10>�ϵ�ĳ����(22��ġ~25��ġ)
     <OPTION value=11>�ϵ�ĳ����(26��ġ �̻�)
     <OPTION value=12>����Ʈĳ����(21��ġ)
     <OPTION value=13>����Ʈĳ����(22��ġ~25��ġ)
     <OPTION value=14>����Ʈĳ����(26��ġ �̻�)
    </SELECT>
   </FONT>
  </TD>
 </TR>
 
 </TR>
 <TR>
  <TH width=20% height=40px; bgcolor=#e8f0ff align=center style='border-right:1px solid #e8f0ff; border-left:1px solid #e8f0ff;'>
   <FONT size=2>��ǰ��</FONT></TH>
  <TD style="padding:0 0 0 10 ;border-right:1px solid #e8f0ff"  align="left">
   &nbsp;<INPUT type=text name=pname size=30>
  </TD>
 </TR>
 <TR>
  <TH width=20% height=40px; bgcolor=#e8f0ff align=center style='border-right:1px solid #e8f0ff; border-left:1px solid #e8f0ff;'>
   <FONT size=2 >������</FONT></TH>
  <TD style="padding:0 0 0 10 ;border-right:1px solid #e8f0ff"  align="left">
   &nbsp;<INPUT type=text name=sname size=30>
  </TD>
 </TR>
 <TR>
  <TH width=20% height=40px; bgcolor=#e8f0ff align=center style='border-right:1px solid #e8f0ff; border-left:1px solid #e8f0ff;'>
   <FONT size=2 >���߰�</FONT>
  </TH>
  <TD style="padding:0 0 0 10 ;border-right:1px solid #e8f0ff"  align="left">
   &nbsp;<INPUT type=text name=price size=10>
  </TD>
 </TR>
 <TR>
  <TH width=20% height=40px; bgcolor=#e8f0ff align=center style='border-right:1px solid #e8f0ff; border-left:1px solid #e8f0ff;'>
   <FONT size=2>�ǸŰ�</FONT>
  </TH>
  <TD style="padding:0 0 0 10 ;border-right:1px solid #e8f0ff"  align="left">
   &nbsp;<INPUT type=text name=dprice size=10>
  </TD>
 </TR>
 <TR>
 <TH width=20% height=40px; bgcolor=#e8f0ff align=center style='border-right:1px solid #e8f0ff; border-left:1px solid #e8f0ff;'>
   <FONT size=2 >��ǰ ����</FONT></TH>
  <TD style="padding:0 0 0 10 ;border-right:1px solid #e8f0ff"  align="left">
   <FONT size=2  color=white>
   &nbsp;<SELECT name=color size=1>
     <OPTION value=1>����
     <OPTION value=2>���
     <OPTION value=3>���̺�
     <OPTION value=4>���̺���
     <OPTION value=5>ȸ��
     <OPTION value=6>�Ķ�
    </SELECT>
    </FONT>
    </TD>
 </TR>
 <TR>
  <TH width=20% height=40px; bgcolor=#e8f0ff align=center style='border-right:1px solid #e8f0ff; border-left:1px solid #e8f0ff;'>
   <FONT size=2 >�԰� ����</FONT>
  </TH>
  <TD style="padding:0 0 0 10 ;border-right:1px solid #e8f0ff"  align="left">
   &nbsp;<INPUT type=text name=stock size=10>
  </TD>
 </TR>
 <TR>
  <TH width=20% height=40px; bgcolor=#e8f0ff align=center style='border-right:1px solid #e8f0ff; border-left:1px solid #e8f0ff;'>
   <FONT size=2>���� �̹���</FONT>
  </TH>
  <TD style="padding:0 0 0 10 ;border-right:1px solid #e8f0ff"  align="left">
   &nbsp;<INPUT type=file name=small size=30>
  </TD >
 </TR>
 <TR>
  <TH width=20% height=40px; bgcolor=#e8f0ff align=center style='border-right:1px solid #e8f0ff; border-left:1px solid #e8f0ff;'>
   <FONT size=2 >ū �̹���</FONT>
  </TH>
  <TD style="padding:0 0 0 10 ;border-right:1px solid #e8f0ff"  align="left">
   &nbsp;<INPUT type=file name=large size=30>
  </TD>
 </TR>
 <TR>
  <TH height=40px; bgcolor=#e8f0ff align=center style='border-right:1px solid #e8f0ff; border-left:1px solid #e8f0ff;'>
   <FONT size=2> ��ǰ ����</FONT>
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