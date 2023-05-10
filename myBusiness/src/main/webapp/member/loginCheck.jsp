<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- 로그인 체크 -->
<%
request.setCharacterEncoding("UTF-8");
String id = (String) session.getAttribute("idKey");
String pageType = request.getParameter("page");

if (id == null) {
	if (pageType.equals("board")) {
%>
<script type="text/javascript">
    alert("로그인이 필요합니다.");
    location.href = "../member/login.jsp";
</script>
<%
} else {
%>
<script type="text/javascript">
    alert("로그인이 필요합니다.");
    location.href = "login.jsp";
</script>
<%
}
return;
}
%>
