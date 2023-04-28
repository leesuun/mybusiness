<%@page import="member.MemberBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:useBean id="mMgr" class="member.MemberMgr" />

<%
request.setCharacterEncoding("UTF-8");
String id = (String) session.getAttribute("idKey");
if (id == null) {
%>
<script type="text/javascript">
    alert("로그인이 필요합니다.")
    location.href = "login.jsp";
</script>
<%
} else {
%>
<%
MemberBean loggedInUser = mMgr.getMember(id);
String[] hobbys = null;
if (id != null) {
	hobbys = mMgr.getMember(id).getHobby();
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../css/style.css?5" />
<link rel="stylesheet" href="../css/loginUserInfo.css?3" />
<title>Insert title here</title>
</head>
<body>
  <h2><%=loggedInUser.getName() + "님의 정보 조회 결과입니다."%></h2>
  <hr />
  <table cellpadding="2">
    <thead>
      <tr>
        <th>아이디</th>
        <th>패스워드</th>
        <th>성별</th>
        <th>생일</th>
        <th>이메일</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td><%=loggedInUser.getId()%></td>
        <td><%=loggedInUser.getPwd()%></td>
        <td>
          <%="<span>" + (loggedInUser.getGender().equals("1") ? "남자" : "여자") + "</span>"%>
        </td>
        <td><%=loggedInUser.getBirthday()%></td>
        <td><%=loggedInUser.getEmail()%></td>
      </tr>
    </tbody>
  </table>
  <table cellpadding="2">
    <thead>
      <tr>
        <th>우편번호</th>
        <th>집주소</th>
        <th>취미</th>
        <th>직업</th>
        <th>국적</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td><%=loggedInUser.getZipcode()%></td>
        <td><%=loggedInUser.getAddress()%></td>
        <td>
          <%
          final String hobbyList[] = { "인터넷", "여행", "게임", "영화", "운동" };
          for (int i = 0; i < hobbys.length; i++) {
          	if (hobbys[i].equals("1")) {
          		out.println("<span>" + hobbyList[i] + "," + "</span>");
          	}
          }
          %>
        </td>
        <td><%=loggedInUser.getJob()%></td>
        <td><%=loggedInUser.getNationality()%></td>
      </tr>
    </tbody>
  </table>
</body>
</html>
<%
}
%>