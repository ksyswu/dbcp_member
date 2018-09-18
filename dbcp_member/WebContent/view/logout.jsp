<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//세션 해제후 index.jsp로 이동
	session.invalidate();
	response.sendRedirect("../index.jsp");
	
	/* out.print("<script>");
	out.print("alert('로그아웃 완료');");
	out.print("location.href='../index.jsp'");
	out.print("</script>"); */
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>
