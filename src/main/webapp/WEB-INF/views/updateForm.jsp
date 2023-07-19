<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
  <title>update</title>
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
      <form action="updateProc" class="write-form" method="post" enctype="multipart/form-data">
        <div class="user-info">
          <div class="user-info-sub">
            <p>등급 [${mb.g_name}]</p>
            <p>POINT [${mb.m_point}]</p>
          </div>
        </div>
        <h2 class="login-header">글수정</h2>
        <input type="hidden" name="b_id" value="${mb.m_id}">
        <input type="hidden" name="b_num" value="${board.b_num}">
        <input type="text" name="b_title" class="write-input" placeholder="제목 입력" required autofocus
        value="${board.b_title}">
        <textarea rows="15" name="b_contents" class="write-input ta" placeholder="내용을 적어주세요.">${board.b_contents}</textarea>
        <div class="filebox">
          <div id="bfile" style="margin-bottom: 10px;">
            <c:if test="${empty fList}">
              <label style="width: 100%;">첨부파일이 없습니다.</label>
            </c:if>
            <c:if test="${!empty fList}">
              <c:forEach var="f" items="${fList}">
                <label style="width: 100%;" onclick="delfile('${f.bf_sysname}')">
                  ${f.bf_oriname}
                </label>
              </c:forEach>
            </c:if>
          </div>
          <label for="file">파일추가</label>
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
    location.href = "/contents?b_num=${board.b_num}";
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

  function delfile(sysname){
    //alert(sysname);
    let con = confirm("파일을 삭제하시겠습니까?");
    if(con == true){
      let objdata = {"sysname" : sysname};
      objdata.bnum = ${board.b_num};
      $.ajax({
        url:"delFile",
        type:"post",
        data: objdata,
        success : function (res){
          console.log(res);
          let fList = "";
          if(res.length == 0){
            fList += '<label style="width: 100%;">첨부파일이 없습니다.</label>';
          } else {
            for(let f of res){
              fList += '<label style="width: 100%;" onclick="delfile(\''
                      + f.bf_sysname + '\')">' + f.bf_oriname + '</label>';
            }
          }
          $("#bfile").html(fList);
        },
        error: function (err){
          console.log(err);
          alert("삭제 실패");
        }
      });
    }
  }

</script>
</html>
