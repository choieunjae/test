<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equive="Content-Type" content="text/html; charset=EUC-KR">
<title>ENJOY BAG!</title>
</head>
<body>
<%
String value=request.getParameter("color");
out.print(value);
%>
</body>
</html>