<%@ page contentType="text/html; charset=UTF-8"%>
<jsp:useBean id="mMgr" class="member.MemberMgr" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
request.setCharacterEncoding("UTF-8");
String id = request.getParameter("id");
boolean result = mMgr.checkId(id);
%>
<html>
<head>
<title>ID 중복체</title>
<link href="../css/style.css" rel="stylesheet" type="text/css">
</head>
<body bgcolor="black">
  <div align="center">
    <br /> <b><%=id %></b>
    <c:choose>
      <c:when test="<%=result%>">
        <span>는 이미 존재하는 ID입니다.</span>
      </c:when>
      <c:otherwise>
        <span>는 사용 가능 합니다.</span>
      </c:otherwise>
    </c:choose>
    <br />
    <br />
    <a href="#" onClick="self.close()">닫기</a>
  </div>
</body>
</html>