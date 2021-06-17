<%@ page contentType="text/html; charset=euc-kr" %> 
<%@ page language="java" import="java.sql.*,java.io.*,java.text.*,java.net.*,java.util.*"%>
<% request.setCharacterEncoding("euc-kr"); %>
<%
Object mem_name  = session.getAttribute("member_name"); 
Object mem_id = session.getAttribute("member_id");
String saveid = request.getParameter("like");

Connection conn = null;
Statement  stmt = null;
ResultSet  rs   = null;
String query    = new String();
PreparedStatement pstmt = null;

try {
Class.forName("org.gjt.mm.mysql.Driver");
} catch (ClassNotFoundException e ) {
out.println(e);
}    
try {
conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/photoboard?useUnicode=true&characterEncoding=euckr","root","1234");
stmt = conn.createStatement();
} catch(SQLException e) {
out.println(e);
}
boolean bLogin = false;
if(mem_id !=null){
try{
 query = "Select * from like_save where id='"+saveid+"'and userid='"+mem_id+"';";
 rs = stmt.executeQuery(query);
 if(rs.next()){
	  	 bLogin = true; 
 }else{
	  try{
			  stmt = conn.createStatement();
			  String sql3 = "insert into like_save(id,userid) values('"+saveid+"','"+mem_id+"');" ;
			  stmt.executeUpdate(sql3);
			  int count=+1;
			  String sql4 = "update photorv set  like_cnt=like_cnt+1 where id ='"+saveid+"';";
			  stmt.executeUpdate(sql4);
			  
		  }catch(SQLException e){
			  out.println(e);
		  }
	     bLogin = false;
	  	}    
 rs.close();
} catch(SQLException e) {
 out.println(e);
} finally {
 conn.close();
}
if (bLogin){ 
	out.println("<script>alert('이미 추천하셨습니다.');history.back();</script>");
}else{
	out.println("<script>alert('추천되었습니다.');document.location.href='photo_list.jsp';</script>");
}
}else{
	out.println("<script>alert('추천 전에 로그인 하러 가기!');history.back();</script>");
}
%>