<%@page import="java.time.LocalDate"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="survey.*,java.util.Vector"%>
<jsp:useBean id="pMgr" class="survey.PollMgr" />
<html>
<head>
<title>JSP Poll</title>
<link href="../css/style.css" rel="stylesheet" type="text/css">
</head>
<body bgcolor="black">
<!-- 상단 메뉴 바 -->
<jsp:include page="../layout/nav.jsp"></jsp:include>
  <div align="center">
    <br />
    <h2>투표프로그램</h2>
    <hr width="600" />
    <b>설문폼</b>
    <!--폴 리스트 폼 자리-->
    <jsp:include page="pollForm.jsp" />
    <hr width="600" />
    <b>설문리스트</b>
    <!--폴 리스트 테이블 자리-->
    <table>
      <tr>
        <td>
          <table width="500" border="1">
            <tr>
              <td align="center">
                <b>번호</b>
              </td>
              <td>
                <b>제목</b>
              </td>
              <td>
                <b>시작일~종료일</b>
              </td>
            </tr>
            <%
            Vector<PollListBean> vlist = pMgr.getAllList();

            int count = vlist.size();
            for (int i = 0; i < vlist.size(); i++) {
            	PollListBean plBean = vlist.get(i);
            	int num = plBean.getNum();
            	String question = plBean.getQuestion();
            	String sdate = plBean.getSdate();
            	String edate = plBean.getEdate();
            	LocalDate today = LocalDate.now();
            	LocalDate date = LocalDate.parse(edate);

            	out.println("<tr><td align='center'>" + count + "</td>");
            	out.println("<td><a href='pollList.jsp?num=" + num + "'>" + question + "</a></td>");
            	if (today.isAfter(date)) {
            		out.println("<td>" + "[종료] " + sdate + " ~ " + edate + "</td></tr>");
            	} else {
            		out.println("<td>" + "[진행중] " + sdate + " ~ " + edate + "</td></tr>");
            	}
            	count = count - 1;
            }
            %>
          </table>
        </td>
      </tr>
      <tr>
        <td align="right">
          <a href="pollInsert.jsp">설문 작성하기</a>
        </td>
      </tr>
    </table>
  </div>
</body>
</html>