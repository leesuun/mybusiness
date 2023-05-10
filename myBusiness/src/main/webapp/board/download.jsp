<%@page contentType="application; charset=UTF-8"%>

<!-- 로그인 체크 -->
<jsp:include page="../member/loginCheck.jsp">
  <jsp:param value="board" name="page" />
</jsp:include>

<jsp:useBean id="bMgr" class="board.BoardMgr" />

<%
bMgr.downLoad(request, response, out, pageContext);
%>