<%@page import="survey.Format"%>
<%@page import="java.time.LocalDate"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="pMgr" class="survey.PollMgr" />
<jsp:useBean id="plBean" class="survey.PollListBean" />
<jsp:setProperty property="*" name="plBean" />
<jsp:useBean id="piBean" class="survey.PollItemBean" />
<jsp:setProperty property="*" name="piBean" />

<%
Format format = new Format();

String sdate = request.getParameter("sdateY") + "-" + format.formatString(request.getParameter("sdateM")) + "-"
		+ format.formatString(request.getParameter("sdateD"));
String edate = request.getParameter("edateY") + "-" + format.formatString(request.getParameter("edateM")) + "-"
		+ format.formatString(request.getParameter("edateD"));

String msg = "설문 추가에 실패 하였습니다.";
String url = "pollInsert.jsp";

if (format.compareStartEndDate(sdate, edate)) {
%>
<script>
   alert("<%=msg%>");
   location.href="<%=url%>";
</script>

<%
} else {

plBean.setSdate(sdate);
plBean.setEdate(edate);

boolean flag = pMgr.insertPoll(plBean, piBean);
System.out.println(flag);
if (flag) {
	msg = "설문이 추가 되었습니다.";
	url = "pollList.jsp";
}
%>
<script>
   alert("<%=msg%>");
   location.href="<%=url%>";
</script>
<%
}
%>