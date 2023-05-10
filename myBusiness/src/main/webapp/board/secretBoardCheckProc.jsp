<%@page import="member.MemberBean"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<jsp:useBean id="bMgr" class="board.BoardBean" />

<%
request.setCharacterEncoding("UTF-8");
String id = (String) session.getAttribute("idKey");
String originPass = request.getParameter("pwd");
String inputPass = request.getParameter("pass");
String num = request.getParameter("num");
String nowPage = (String) request.getParameter("nowPage");
String keyField = (String) request.getParameter("keyField");
String keyWord = (String) request.getParameter("keyWord");

String url = "secretBoardCheck.jsp";
String msg = "비밀번호가 일치하지 않습니다.";

if (originPass.equals(inputPass)) {
	url = "list.jsp";
	url = "read.jsp?num=" + num + "&" + "nowPage=" + nowPage + "&" + "keyField=" + keyField + "&" + "keyWord=" + keyWord	;
	msg = "패스워드가 일치합니다.";

}
%>
<script>
  alert("<%=msg%>");  
  location.href="<%=url%>";
</script>

