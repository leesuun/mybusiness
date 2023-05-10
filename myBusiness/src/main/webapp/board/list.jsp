<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- 로그인 체크 -->
<%
request.setCharacterEncoding("UTF-8");
String id = (String) session.getAttribute("idKey");
%>

<%@page import="board.BoardBean"%>
<%@page import="java.util.Vector"%>
<jsp:useBean id="bMgr" class="board.BoardMgr" />

<%
String pass = null;
int moveNum = 0;

int totalRecord = 0; //전체레코드수
int numPerPage = 10; // 페이지당 레코드 수 
int pagePerBlock = 15; //블럭당 페이지수 

int totalPage = 0; //전체 페이지 수 
int totalBlock = 0; //전체 블럭수 
 
int nowPage = 1; // 현재페이지 
int nowBlock = 1; //현재블럭 
 
int start = 0; //디비의 select 시작번호 
int end = 10; //시작번호로 부터 가져올 select 갯수 

int listSize = 0; //현재 읽어온 게시물의 수

String keyWord = "", keyField = "";
Vector<BoardBean> vlist = null;
if (request.getParameter("keyWord") != null) {
	keyWord = request.getParameter("keyWord");
	keyField = request.getParameter("keyField");
}
if (request.getParameter("reload") != null) {
	if (request.getParameter("reload").equals("true")) {
		keyWord = "";
		keyField = "";
	}
}

if (request.getParameter("nowPage") != null) {
	System.out.println(request.getParameter("nowPage"));
	nowPage = Integer.parseInt(request.getParameter("nowPage"));
}
start = (nowPage * numPerPage) - numPerPage;
end = numPerPage;

totalRecord = bMgr.getTotalCount(keyField, keyWord);
totalPage = (int) Math.ceil((double) totalRecord / numPerPage); //전체페이지수
nowBlock = (int) Math.ceil((double) nowPage / pagePerBlock); //현재블럭 계산

totalBlock = (int) Math.ceil((double) totalPage / pagePerBlock); //전체블럭계산
%>
<html>
<head>
<title>JSP Board</title>
<link href="../css/style.css?1" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="../css/board/list.css?1" />
<script src="../js/board/list.js?3"></script>
 <script type="text/javascript">

</script>
</head>
<body bgcolor="black">
<!-- 상단 메뉴 바 -->
<jsp:include page="../layout/nav.jsp"></jsp:include>
  <div align="center">
    <br />
    <header style="display: flex; justify-content: center; align-items: center; gap: 10px">
      <h2>JSPBoard</h2>
    </header>
    <br />
    <table align="center" width="600">
      <tr>
        <td>
          Total :
          <%=totalRecord%>Articles(<font color="red"> <%=nowPage%>/<%=totalPage%>Pages
          </font>)
        </td>
      </tr>
    </table>
    <table align="center" width="600" cellpadding="3">
      <tr>
        <td align="center" colspan="2">
          <%
          vlist = bMgr.getBoardList(keyField, keyWord, start, end);
          listSize = vlist.size();//브라우저 화면에 보여질 게시물갯수
          if (vlist.isEmpty()) {
          	out.println("등록된 게시물이 없습니다.");
          } else {
          %>
          <table width="100%" cellpadding="2" cellspacing="0">
            <tr align="center" bgcolor="#D0D0D0" height="120%">
              <td>번 호</td>
              <td>제 목</td>
              <td>이 름</td>
              <td>날 짜</td>
              <td>조회수</td>
            </tr>
            <%
            for (int i = 0; i < numPerPage; i++) {
            	if (i == listSize)
            		break;
            	BoardBean bean = vlist.get(i);
            	int num = bean.getNum();
            	String name = bean.getName();
            	String subject = bean.getSubject();
            	String regdate = bean.getRegdate();
            	int depth = bean.getDepth();
            	int count = bean.getCount();
            	/* System.out.println(bean.getPass()); */
            %>
            <tr>
              <td align="center">
                <%=totalRecord - ((nowPage - 1) * numPerPage) - i%>
              </td>
              <td>
                <%
                /*   System.out.println(bean.getSubject().contains("[삭제한 글]")); */
                if (depth > 0) {
                	for (int j = 0; j < depth; j++) {
                		out.println("&nbsp;&nbsp;");
                	}
                }
                %>
                <%
                if (bean.getSubject().contains("[삭제한 글]")) {
                	/* System.out.println(bean.getPass()); */
                %>
                <span style="color: red"><%=subject%></span>

                <%
                } else if (bean.getPass().equals("")) {
                /* System.out.println(bean.getSubject()); */
                %>
                <a style="cursor: pointer;" onclick="read('<%=num %>')"><%=subject%></a>
                <%-- <a href="javascript:read('<%=num%>')"><%=subject%></a> --%>

                <%
                } else {
                pass = bean.getPass();
                moveNum = num;
                %>
                <a href="javascript:secretBoardCheck('<%=num%>','<%=pass%>')">
                  <span><%="[비밀글] " + subject%></span>
                </a>
                <%
                }
                %>

              </td>
              <td align="center"><%=name%></td>
              <td align="center"><%=regdate%></td>
              <td align="center"><%=count%></td>
            </tr>

            <%
            } //for
            %>
          </table>
          <%
          } //if
          %>
        </td>
      </tr>
      <tr>
        <td colspan="2">
          <br /> <br />
        </td>
      </tr>
      <tr>
        <td>
          <!-- 페이징 및 블럭 처리 Start-->
          <%
          int pageStart = (nowBlock - 1) * pagePerBlock + 1; //하단 페이지 시작번호
          int pageEnd = ((pageStart + pagePerBlock) <= totalPage) ? (pageStart + pagePerBlock) : totalPage + 1;
          //하단 페이지 끝번호
          if (totalPage != 0) {
          	if (nowBlock > 1) {
          %>
          <a href="javascript:block('<%=nowBlock - 1%>','<%=pagePerBlock%>')">prev...</a>
          <%
          }
          %>&nbsp;
          <%
          for (; pageStart < pageEnd; pageStart++) {
          %>
          <a href="javascript:pageing('<%=pageStart%>')">
            <%
            if (pageStart == nowPage) {
            %><font color="blue"> <%
 }
 %> [<%=pageStart%>] <%
 if (pageStart == nowPage) {
 %></font>
            <%
            }
            %>
          </a>
          <%
          } //for
          %>&nbsp;
          <%
          if (totalBlock > nowBlock) {                                                                                
          %>
          <a href="javascript:block('<%=nowBlock + 1%>')">.....next</a>
          <%
          }
          %>&nbsp;
          <%
          }
          %>
          <!-- 페이징 및 블럭 처리 End-->
        </td>
        <td align="right">
          <a href="post.jsp">[글쓰기]</a>
          <a href="javascript:list()">[처음으로]</a>
        </td>
      </tr>
    </table>
    <hr width="600" />
    <form name="searchFrm" method="get" action="list.jsp">
      <table width="600" cellpadding="4" cellspacing="0">
        <tr>
          <td align="center" valign="bottom">
            <select name="keyField" size="1">
              <option value="name">이 름</option>
              <option value="subject">제 목</option>
              <option value="content">내 용</option>
            </select>
            <input size="16" name="keyWord">
            <input type="button" value="찾기" onClick="javascript:check()">
            <input type="hidden" name="nowPage" value="1">
          </td>
        </tr>
      </table>
    </form>
    <form name="listFrm" method="post">
      <input type="hidden" name="reload" value="true">
      <input type="hidden" name="nowPage" value="1">
    </form>
    <form name="readFrm" method=post>
      <input type="hidden" name="num" value="<%=moveNum%>">
      <input type="hidden" name="nowPage" value="<%=nowPage%>">
      <input type="hidden" name="keyField" value="<%=keyField%>">
      <input type="hidden" name="keyWord" value="<%=keyWord%>">
      <input type="hidden" name="pass" value="<%=pass%>">
    </form>
  </div>
</body>
</html>