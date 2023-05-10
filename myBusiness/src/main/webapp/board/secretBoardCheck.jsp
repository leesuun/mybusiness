<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
String pass = (String) request.getParameter("pass");
String num = (String) request.getParameter("num");
String nowPage = (String) request.getParameter("nowPage");
String keyField = (String) request.getParameter("keyField");
String keyWord = (String) request.getParameter("keyWord");

/* System.out.println(pass);
System.out.println(num);
System.out.println("nowPage "+nowPage);
System.out.println( "keyField " + keyField);
System.out.println( "keyWord " +keyWord); */

/* System.out.println(pass); */
/* System.out.println(num); */
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  <form name="loginFrm" method="post" action="secretBoardCheckProc.jsp">
    <table>
      <tr>
        <td align="center" colspan="2">
          <h1>비밀 게시글 비밀번호 확인</h1>
        </td>
      </tr>
      <tr style="display: none">
        <td>비밀번호</td>
        <td>
          <input type="password" name="pass" value=<%=pass%>>
          <input type="text" name="num" value="<%=num%>">
          <input type="text" name="nowPage" value="<%=nowPage%>">
          <input type="text" name="keyField" value="<%=keyField%>">
          <input type="text" name="keyWord" value="<%=keyWord%>">
        </td>
      </tr>

      <tr>
        <td>비밀번호</td>
        <td>
          <input type="password" name="pwd">
        </td>
      </tr>
      <tr>
        <td>
          <div align="right">
            <input type="submit" value="확인">
          </div>
        </td>
      </tr>
    </table>
  </form>
</body>
</html>