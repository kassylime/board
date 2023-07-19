<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="top-bar">
  <div class="content">
    <img alt="로고" src="https://cdn.pixabay.com/photo/2016/01/08/18/48/kitten-1129027_1280.png" class="top-left logo" onclick="gohome()">
    <h2 class="top-left top-home">WEB BOARD</h2>
    <nav class="top-right">
      <ul>
        <%--로그인 설정 성공시에만 보일예정--%>
        <li class="suc" id="mname">테스트님</li>
        <li class="suc"><a href="logout">Logout</a></li>
        <li class="bef"><a href="loginForm">Login</a></li>
        <li class="bef"><a href="joinForm">Join</a></li>
      </ul>
    </nav>
  </div>
</div>

<script>
  function gohome(){
    // 로그인할 정보를 세션에 저장 mb
    let id = "${mb.m_id}";
    if(id == ""){
      // 로그인 전
      location.href = "/";
    } else {
      // 로그인 후
      location.href = "list?pageNum=1";
      <%--// 로그인한 회원 정보 출력--%>
      <%--let loginName = "${mb.m_name}";--%>
      <%--console.log(loginName);--%>
      <%--$("#mname").html(loginName + "님");--%>
      <%--$(".suc").css("display", "block");--%>
      <%--$(".bef").css("display", "none");--%>
    }
  }
</script>