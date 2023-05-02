<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  <form name="loginFrm" method="post" action="infoCheckProc.jsp">
    <table>
      <tr>
        <td align="center" colspan="2">
          <h1>개인정보 확인 체크</h1>
        </td>
      </tr>
 
      <tr>
        <td>비밀번호</td>
        <td>
          <input type="password" name="pwd">
        </td>
      </tr>
      <tr>
        <td >
          <div align="right">
            <input type="submit" value="확인">
        
          </div>
        </td>
      </tr>
    </table>
  </form>
</body>
</html>