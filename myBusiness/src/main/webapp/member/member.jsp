<%@ page contentType="text/html; charset=UTF-8"%>
<html>
<head>
<title>회원가입</title>
<link href="../css/style.css" rel="stylesheet" type="text/css">


<script type="text/javascript" src="../js/script.js?3"></script>
<script type="text/javascript" src="../js/idCheck.js?2"></script>
</head>
<body bgcolor="black" onLoad="regFrm.id.focus()">
<!-- 상단 메뉴 바 -->
<jsp:include page="../layout/nav.jsp"></jsp:include>
  <div align="center">
    <br /> <br />
    <form name="regFrm" method="post" action="memberProc.jsp">
      <table cellpadding="5">
        <tr>
          <td bgcolor="black">
            <table border="1" cellspacing="0" cellpadding="2" width="600">
              <tr bgcolor="#996600">
                <td colspan="3" style="text-align: center; padding:5px;">
                  <font color="#FFFFFF"><b>회원 가입</b></font>
                </td>
              </tr>
              <tr>
                <td width="20%">아이디</td>
                <td width="50%">
                  <input name="id" value="1" size="15">
                  <input type="button" value="ID중복확인"
                    onClick="idCheck(this.form.id.value)"
                  >
                </td>
                <td width="30%">아이디를 적어 주세요.</td>
              </tr>
              <tr>
                <td>패스워드</td>
                <td>
                  <input type="password" value="1" name="pwd" size="15">
                </td>
                <td>패스워드를 적어주세요.</td>
              </tr>
              <tr>
                <td>패스워드 확인</td>
                <td>
                  <input type="password" value="1" name="repwd" size="15">
                </td>
                <td>패스워드를 확인합니다.</td>
              </tr>
              <tr>
                <td>이름</td>
                <td>
                  <input name="name" value="1" size="15">
                </td>
                <td>이름을 적어주세요.</td>
              </tr>
              <tr>
                <td>생년월일</td>
                <td>
                  <input name="birthday" value="2012-12-12" type="date" size="6" min="2018-01-01"
                    max="2018-12-31"
                  >
                </td>
                <td>생년월일를 적어 주세요.</td>
              </tr>
              <tr>
                <td>Email</td>
                <td>
                  <input name="email" value="12@naver.com" size="30">
                </td>
                <td>이메일를 적어 주세요.</td>
              </tr>

              <tr>
                <td colspan="3" align="center">
                  <input type="button" value="회원가입" onclick="inputCheck()">
                  &nbsp; &nbsp;
                  <input type="reset" value="다시쓰기">
                  &nbsp; &nbsp;
                  <input type="button" value="로그인"
                    onClick="javascript:location.href='login.jsp'"
                  >
                </td>
              </tr>

            </table>
          </td>
        </tr>
      </table>
    </form>
  </div>
</body>
</html>