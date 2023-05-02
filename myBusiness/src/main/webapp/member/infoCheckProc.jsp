<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="member.MemberBean"%>
<jsp:useBean id="mMgr" class="member.MemberMgr" />
<jsp:useBean id="encrypt" class="member.Encrypt" />

<%
String id = (String) session.getAttribute("idKey");
String pass = (String) request.getParameter("pwd");
MemberBean loggedInUser = mMgr.getMember(id);
/* System.out.println(loggedInUser.getPwd()); */
boolean result = mMgr.loginMember(id, encrypt.getEncrypt(pass));
/* System.out.println(result); */

if (result) {
	/* 회원정보 조회 화면  */
%>
<script>
    location.href = "loginUserInfo.jsp";
</script>
<%
} else {
/* 정보 조회 불가능  */
%>
<script>
    alert("로그인된 유저의 비밀번호가 아닙니다.")
    location.href = "infoCheck.jsp";
    
</script>
<%
}
%>
