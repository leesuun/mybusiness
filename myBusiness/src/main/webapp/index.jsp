<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/style.css?2" />
<link rel="stylesheet" href="css/todo.css?2" />

<%!String title = "Momentum";%>
<title><%=title%></title>
</head>
<body>

<!-- 상단 메뉴 바 -->
<jsp:include page="layout/nav.jsp"></jsp:include>
  <div id="bg-img"></div>
  <main class="momentum-app">
    <h1 id="clock" class="clock"></h1>
    <form id="login__form" class="hidden">
      <input required id="login__input" type="text" placeholder="Write your name.." />
    </form>
    <div id="greeting-box" class="greeting-box">
      <h1 id="greeting" class="hidden greeting"></h1>
      <button id="greeting-button"></button>
    </div>

    <form id="todo-form" class="todo-form">
      <input required type="text" placeholder="Write a to do...." />
    </form>
    <ul id="todo-list" class="todo-list"></ul>

    <div id="quote" class="quote">
      <span id="quotes"></span>
      <span id="author"></span>
    </div>

    <a target="_blank" href="https://www.weather.go.kr/w/index.do">
      <span id="weather" class="weather">
        <span></span>
        <span></span>
      </span>
    </a>
  </main>

  <script src="https://kit.fontawesome.com/6833760571.js"></script>
  <script src="js/todo/bg.js"></script>
  <script src="js/todo/greeting.js"></script>
  <script src="js/todo/todo.js"></script>
  <script src="js/todo/quotes.js"></script>
  <script src="js/todo/clock.js"></script>

</body>
</html>