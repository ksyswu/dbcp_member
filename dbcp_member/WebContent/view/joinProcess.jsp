<%@page import="member.MemberVO"%>
<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//joinForm에서 입력받은 값 처리하기
	//한글
	request.setCharacterEncoding("utf-8");

	//joinFrom에서 입력받은 값 가져오기
	String userid=request.getParameter("userid");
	String password=request.getParameter("password");
	String name=request.getParameter("name");
	String gender=request.getParameter("gender");
	String email=request.getParameter("email");
	
	//dao 연동
	MemberDAO dao = new MemberDAO();
	
	//data 삽입
	MemberVO vo = new MemberVO();
	vo.setUserid(userid);
	vo.setPassword(password);
	vo.setName(name);
	vo.setGender(gender);
	vo.setEmail(email);
	
	//결과 확인
	int result = dao.member_insert(vo);
	
	if(result>0){
		out.print("<script>");
		out.print("alert('회원가입 완료');");
		out.print("location.href='loginForm.jsp';");
		out.print("</script>");
	}else{
		out.print("<script>");
		out.print("alert('회원가입 실패');");
		out.print("history.back();");
		out.print("</script>");
	}
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






