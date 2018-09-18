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
	
	//db테이블에 삽입하기
	MemberDAO dao = new MemberDAO();
	//결과 확인
	boolean result = dao.checkId(userid);
	
	if(result){
		out.print(0);
	}else{
		out.print(1);
	}
%>





