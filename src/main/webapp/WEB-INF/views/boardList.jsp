<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2023-05-18
  Time: 오후 2:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Board</title>
    <script src="js/jquery-3.7.0.min.js"></script>
    <link rel="stylesheet" href="css/style.css">
    <script>
        $(function () {
            // 메시지 출력
            let m = "${msg}";
            if (m != "") {
                alert(m);
            }
            // 로그인한 회원 정보 및 로그아웃 출력
            let loginName = "${mb.m_name}";
            console.log(loginName);
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
            <div class="board-form">
                <div class="user-info">
                    <div class="user-info-sub">
                        <p>등급 [${mb.g_name}]</p>
                        <p>POINT [${mb.m_point}]</p>
                    </div>
                </div>
                <h2 class="login-header">게시글 목록</h2>
                <div class="search-area">
                    <select id="sel">
                        <option value="b_title" selected>제목</option>
                        <option value="b_contents">내용</option>
                        <option value="m_name">작성자</option>
                    </select>
                    <input type="text" id="keyword">
                    <button id="searchinfo">검색</button>
                </div>
                <div class="data-area">
                    <div class="title-row">
                        <div class="t-no p-10">번호</div>
                        <div class="t-title p-30">제목</div>
                        <div class="t-name p-15">작성자</div>
                        <div class="t-date p-30">작성일</div>
                        <div class="t-view p-15">댓글수</div>
                    </div>
                    <div class="data-row">
                        <c:if test="${empty bList}">
                            <div style="width: 100%">게시글이 없습니다.</div>
                        </c:if>
                        <c:if test="${!empty bList}">
                            <c:forEach var="bitem" items="${bList}">
                                <div class="t-no p-10">${bitem.b_num}</div>
                                <div class="t-title p-30"><a href="/contents?b_num=${bitem.b_num}">${bitem.b_title}</a> </div>
                                <div class="t-name p-15">${bitem.m_name}</div>
                                <div class="t-date p-30">
                                    <fmt:formatDate value="${bitem.b_date}" pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate>
                                </div>
                                <div class="t-view p-15">${bitem.b_views}</div>
                            </c:forEach>
                        </c:if>
                    </div>
                </div>
                <div class="btn-area">
                    <div class="paging">${paging}</div>
                    <button class="wr-btn" onclick="location.href='/writeForm'">글쓰기</button>
                </div>
            </div>
        </div>
    </section>
    <footer>
        <jsp:include page="footer.jsp"></jsp:include>
    </footer>
</div>
</body>
<script>
    $("#searchinfo").click(function (){
       let keyword = $("#keyword").val();
       if(keyword == ""){
           alert("검색어를 입력하세요.")
           return;
       }
       let select = $("#sel").val();
       console.log(select, keyword);
       location.href = "/list?colname=" + select + "&keyword=" + keyword + "&pageNum=1";
     });
</script>
</html>
