<%@page import="member.MemberVO"%>
<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
//선생님
	//로그인 처리
	//loginForm.jsp에서 사용자가 입력한 id와 current_password를 가져온 후
	//db를 거쳐 확인 후 존재하는 사용자라변 세션에 담기
	request.setCharacterEncoding("utf-8");
	String userid=request.getParameter("userid");
	String password=request.getParameter("current_password");
	
	//dao 연동
	MemberDAO dao = new MemberDAO();
	MemberVO vo=dao.isLogin(userid, password);
	
	
	//결과 확인
	if(vo != null){
		//세션은 객체 자체를 담을 수 있기에 vo로 넣어도 됨
		session.setAttribute("vo", vo);
		
		out.print("<script>");
		out.print("alert('로그인 완료');");
		out.print("location.href='loginForm.jsp'");
		out.print("</script>");


	}else{
		out.print("<script>");
		out.print("alert('아이디와 비밀 번호를 확인해 주세요');");
		out.print("history.back();");
		out.print("</script>");
	}
%>

<%-- <%
	//로그인 처리
	//loginForm.jsp에서 사용자가 입력한 id와 current_password를 가져온 후
	//db를 거쳐 확인 후 존재하는 사용자라변 세션에 담기
	
	//joinForm에서 입력받은 값 처리하기
	//한글
	request.setCharacterEncoding("utf-8");

	//joinForm에서 입력받은 값 가져오기
	String userid=request.getParameter("userid");
	String password=request.getParameter("current_password");
	
	//dao 연동
	MemberDAO dao = new MemberDAO();
	
	//data 삽입
	MemberVO vo = new MemberVO();
	vo.setUserid(userid);
	vo.setPassword(password);
	
	MemberVO vo1=dao.islogin(vo);
	
	
	//결과 확인
	if(vo1 != null){
		//세션
		//HttpSession session1 = request.getSession();
		session.setAttribute("userid", vo1.getUserid());
		session.setAttribute("name", vo1.getName()); 
		
		out.print("<script>");
		out.print("alert('로그인 완료');");
		out.print("location.href='loginForm.jsp'");
		out.print("</script>");


	}else{
		out.print("<script>");
		out.print("alert('로그인 실패');");
		out.print("history.back();");
		out.print("</script>");
	}
%> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>