<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2023-05-18
  Time: 오전 11:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login</title>
    <script src="js/jquery-3.7.0.min.js"></script>
    <link rel="stylesheet" href="css/style.css">
    <script>
        $(function () {
            // 메시지 출력
            let m = "${msg}";
            if (m != "") {
                alert(m);
            }
        });
    </script>
</head>
<body>
<div class="wrap">
    <header>
        <jsp:include page="header.jsp"></jsp:include>
    </header>
    <section>
       <div class="content">
           <form action="loginProc" method="post" class="login-form">
             <h2 class="login-header">로그인</h2>
               <input type="text" class="login-input" name="m_id" placeholder="아이디 입력" autofocus required>
               <input type="password" class="login-input" name="m_pwd" placeholder="비밀번호 입력" required>
               <input type="submit" class="login-btn" value="로그인">
           </form>
       </div>
    </section>
    <footer>
        <jsp:include page="footer.jsp"></jsp:include>
    </footer>
</div>
</body>
</html>
