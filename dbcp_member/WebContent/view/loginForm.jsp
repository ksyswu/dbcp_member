<%@page import="member.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ include file="../layout/header.jsp" %>

<link href="../css/floating-labels.css" rel="stylesheet">
<%
	/* 세션에 값이 있다면 로그인상태, 세션에 값이 없는경우 비로그인 상태이므로 로그인 폼 보여주기 */
	//세션 여부 확인하기
	MemberVO vo = (MemberVO)session.getAttribute("vo");

	//if(session.getAttribute("userid") == null){
	if(vo == null){
%>
<form class="form-signin" name="loginform" action="loginProcess.jsp" method="post">
		<%-- 아이디 : <%=session.getAttribute("userid") %>
		이   름 : <%=session.getAttribute("name") %> --%>
		<br>
      <div class="form-label-group">
        <input type="text" id="userid" name="userid" class="form-control" placeholder="id" required autofocus>
        <label for="userid">아이디</label>
      </div>

      <div class="form-label-group">
        <input type="password" id="current_password" name="current_password" class="form-control" placeholder="Password" required>
        <label for="pass">비밀번호</label>
      </div>

      <div class="checkbox mb-3">
        <label>
          <input type="checkbox" value="remember-me"> Remember me
        </label>
      </div>
      <button class="btn btn-lg btn-primary btn-block" type="submit">Sign in</button>
      <p class="mt-5 mb-3 text-muted text-center">&copy; 2018</p>
    </form>	
<%
	}else{
%>
	<script>
		var name='<%=vo.getName()%>';
		//3번 메뉴(Loign)를 없애라는 스크립트 코드
		var $menu=$('#3').detach();
		var $tag='<span class="navbar-text">'+name+'님 반값습니다.</span>&nbsp;&nbsp;'
		+'<button type="button" id="logout" class="btn btn-primary">로그아웃</button>';
		//네비바에 우리가 만든 tag를 붙이라는 것
		$("#navbarCollapse").append($tag);
	</script>
<%}%>
	<script>
		//로그아웃 버튼 클릭시 동작
		$(function() {
			$("#logout").click(function() {
				location.href="logout.jsp"
			});
		});
	</script>

<%@ include file="../layout/footer.jsp" %>
