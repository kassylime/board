<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2023-05-25
  Time: 오후 2:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>내부서버오류</title>
  <link rel="stylesheet" href="css/style.css">
</head>
<body>
<header>
  <jsp:include page="../header.jsp"></jsp:include>
</header>
<section>
  <div class="content">
    <center>
      <img src="https://cdn.pixabay.com/photo/2019/05/02/22/07/graphic-4174647_1280.png" width="30%" style="margin-top: 100px">
      <h1>서버에 문제가 발생하였습니다.</h1>
      <p>관리자에게 문의하세요.</p>
    </center>
  </div>
</section>
<footer>
  <jsp:include page="../footer.jsp"></jsp:include>
</footer>
</body>
</html>