<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2023-05-17
  Time: 오전 10:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Raspberry Board</title>
    <script src="js/jquery-3.7.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
    <link rel="stylesheet" href="css/style.css">
    <script>
        $(function () {
            //메세지 출력
            let m = "${msg}";
            if(m != ""){
                alert(m);
            }

            // bxSlider 설정용 스크립터
            $(".slider").bxSlider({
                mode: 'fade',
                slideWidth: 700
            });
        });
    </script>
</head>
<body>
<div class="wrap">
    <header>
        <jsp:include page="header.jsp"></jsp:include>
    </header>
    <section>
        <div class="content-home">
            <div class="slider">
                <div><img src="images/Desert.jpg"></div>
                <div><img src="images/water.jpg"></div>
                <div><img src="images/Lighthouse.jpg"></div>
                <div><img src="images/Tulips.jpg"></div>
                <div><img src="images/nature.jpg"></div>
            </div>
        </div>
    </section>
    <footer>
        <jsp:include page="footer.jsp"></jsp:include>
    </footer>
</div>
</body>
</html>
