<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2023-05-22
  Time: 오전 11:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Write</title>
    <script src="js/jquery-3.7.0.min.js"></script>
    <link rel="stylesheet" href="css/style.css">
    <script>
        $(function () {
            //메시지 출력 부분
            let m = "${msg}";
            if (m != "") {
                alert(m);
            }

            //로그인한 회원 정보 및 로그아웃 출력
            let loginName = "${mb.m_name}";
            $("#mname").html(loginName + "님");
            $(".suc").css("display", "block");
            $(".bef").css("display", "none");
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
            <form action="writeProc" class="write-form" method="post" enctype="multipart/form-data">
                <div class="user-info">
                    <div class="user-info-sub">
                        <p>등급 [${mb.g_name}]</p>
                        <p>POINT [${mb.m_point}]</p>
                    </div>
                </div>
                <h2 class="login-header">글쓰기</h2>
                <input type="hidden" name="b_id" value="${mb.m_id}">
                <input type="text" name="b_title" class="write-input" placeholder="제목 입력" required autofocus>
                <textarea rows="15" name="b_contents" class="write-input ta" placeholder="내용을 적어주세요."></textarea>
                <div class="filebox">
                    <label for="file">업로드</label>
                    <input type="file" name="files" id="file" multiple>
                    <input type="text" class="upload-name" value="파일선택" readonly>
                </div>
                <div class="btn-area">
                    <input type="submit" class="btn-write" value="W">
                    <input type="reset" class="btn-write" value="R">
                    <input type="button" class="btn-write" value="B" onclick="backbtn()">
                </div>
            </form>
        </div>
    </section>
    <footer>
        <jsp:include page="footer.jsp"></jsp:include>
    </footer>
</div>
</body>
<script>
    function backbtn() {
        let urlstr = "/list?";
        let col = "${search.colname}";
        let keyw = "${search.keyword}";

        if (col == null || col == '') {
            urlstr += "pageNum=${pageNum}";
        } else {
            urlstr += "colname=" + col + "&keyword=" + keyw + "&pageNum=" + urlstr;
        }
        location.href = urlstr;
    }

    // 파일 처리용 함수
    $("#file").on("change", function () {
        let files = $("#file")[0].files;

        let fileName = "";
        if (files.length > 1) {
            fileName = files[0].name + " 외 " + (files.length - 1) + "개";
        } else if (files.length == 1) {
            fileName = files[0].name;
        } else {
            fileName = "파일선택";
        }
        $(".upload-name").val(fileName);
    });
</script>
</html>
