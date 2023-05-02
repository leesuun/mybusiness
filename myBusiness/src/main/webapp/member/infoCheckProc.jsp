<%@page import="member.MemberBean"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<jsp:useBean id="mMgr" class="member.MemberMgr" />
<jsp:useBean id="encrypt" class="member.Encrypt" />
<%
request.setCharacterEncoding("UTF-8");
String id = (String) session.getAttribute("idKey");
String pwd = request.getParameter("pwd");
String url = "infoCheck.jsp";
String msg = "로그인에 실패 하였습니다.";
/* System.out.println(pwd);
System.out.println(encrypt.getEncrypt(pwd)); */

boolean result = mMgr.loginMember(id, encrypt.getEncrypt(pwd));
if (result) {
  session.setAttribute("idKey", id);
  url = "loginUserInfo.jsp";
  msg = "패스워드가 일치합니다.";
}
%>
<script>
  alert("<%=msg%>");  
  location.href="<%=url%>";
</script>

 