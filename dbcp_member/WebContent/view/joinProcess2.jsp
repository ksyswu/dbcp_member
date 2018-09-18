<%@page import="member.MemberVO"%>
<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String userid = request.getParameter("userid");
	
	MemberDAO dao = new MemberDAO();
	boolean flag = dao.checkId(userid);
	
	if(flag){//formValidaterk 작동하기 위해서는 false를 돌려줘야 인식함
		//out.print(0); //이렇게 하면 매번 새로고침을 해줘여함
		//아래방식으로하면 실시간으로 반영
		out.print("false");
	}else{
		out.print("true");
	}
%>



