<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="member.MemberBean"%>
<jsp:useBean id="mMgr" class="member.MemberMgr" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@  taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<sql:setDataSource
  url="jdbc:mysql://127.0.0.1:3306/board?userUnicode=true&characterEncoding=UTF-8"
  driver="com.mysql.cj.jdbc.Driver" user="root" password="qkfkadml@12" var="db"
  scope="application"
/>

<%
boolean checkOriginPass = false;
boolean checkChangePass = false;

request.setCharacterEncoding("UTF-8");
String id = (String) session.getAttribute("idKey");
String originInputPass = request.getParameter("originInputPass");
String changePass = request.getParameter("changePass");
String changePassConf = request.getParameter("changePassConf");

boolean result = mMgr.loginMember(id, originInputPass);
if (result) {
	checkOriginPass = true;
	if (changePass.equals(changePassConf)) {
		checkChangePass = true;
		
	}
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="../css/style.css" rel="stylesheet" type="text/css">
<title>Insert title here</title>
</head>
<body style="background-color: black">
  <jsp:include page="../layout/nav.jsp"></jsp:include>
  <br />
  <br />

  <h1>비밀번호 변경</h1>
  <br />
  <hr />
  <form name=regFrm action="changePass.jsp">
    현재 비밀번호
    <input type="password" name="originInputPass" />
    <br /> 변경할 비밀번호
    <input type="password" name="changePass" />
    <br /> 비밀번호 확인
    <input type="password" name="changePassConf" />

    <br />
    <input type="submit" value="변경" />
  </form>


   <c:if test="<%=checkOriginPass && checkChangePass %>">
    <sql:update dataSource="${db}">
  update tblMember set pwd=? where id=?
  <sql:param value="<%=changePass%>" />
      <sql:param value="<%=id%>" />
    </sql:update>
    <script type="text/javascript">
		    alert("비밀번호 변경 성공!");
		    location.href = "logout.jsp"
		</script>
  </c:if>
  
  <c:if test="<%=!checkOriginPass && (originInputPass != null) %>">
    <script type="text/javascript">
		    alert("현재 비밀번호가 일치하지 않습니다.");
		</script>
  </c:if>
  
  <c:if test="<%=!checkChangePass && (changePassConf != null) %>">
    <script type="text/javascript">
		    alert("변경할 비밀번호가 일치하지 않습니다.");
		</script>
  </c:if>

</body>
</html>