<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
  <nav>
    <ul>
      <li><a href="${pageContext.request.contextPath}/index.jsp"> 홈</a></li>

      <li><a href="${pageContext.request.contextPath}/board/list.jsp"> 게시판 </a></li>
      <li><a href="${pageContext.request.contextPath}/survey/pollList.jsp"> 설문조사
        </a></li>

      <li><a href="${pageContext.request.contextPath}/member/member.jsp"> 회원가입 </a></li>
      <c:if test="${sessionScope.idKey != null }">
        <li><a href="${pageContext.request.contextPath}/member/changePass.jsp"> 비밀번호 변경 /
          </a> <a href="${pageContext.request.contextPath}/member/logout.jsp"> 로그아웃 </a></li>
      </c:if>
      <c:if test="${sessionScope.idKey == null }">
        <li><a href="${pageContext.request.contextPath}/member/login.jsp"> 로그인 </a></li>
      </c:if>

    </ul>
  </nav>
</body>
</html>