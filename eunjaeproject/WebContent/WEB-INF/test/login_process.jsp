<%@ page contentType="text/html; charset=euc-kr" %> 
<%@ page language="java" import="java.sql.*,java.io.*,java.text.*,java.net.*,java.util.*"%>
<%
 String userid   = request.getParameter("userid");
 String password = request.getParameter("password");
 Connection conn = null;
 Statement  stmt = null;
 ResultSet  rs   = null;
 String query    = new String();
 String name	    = new String();
 String email = new String();
 PreparedStatement pstmt = null;
 
try {
 Class.forName("org.gjt.mm.mysql.Driver");
} catch (ClassNotFoundException e ) {
 out.println(e);
}    
try {
 conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/member?useUnicode=true&characterEncoding=euckr","root","1234");
 stmt = conn.createStatement();
} catch(SQLException e) {
 out.println(e);
}
boolean bLogin = false;
try{
 query = "select * from member where userid = '"+userid+"'";
 query = query + " and password = '"+password+"'";
 rs = stmt.executeQuery(query);
 if(rs.next()){
  name   = rs.getString("username");
  email = rs.getString("email");
  bLogin = true;
 }else{
  bLogin = false;
 }
 rs.close();
} catch(SQLException e) {
 out.println(e);
} finally {
 conn.close();
}
if (bLogin){
 session.setAttribute("member_id",userid); 
 session.setAttribute("member_name",name); 
 response.sendRedirect("main.jsp");
}else{
 out.println("<script>alert('아이디와 비밀번호를 확인하세요');history.back();</script>");
}
%>