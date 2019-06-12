
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>博士考試登錄入口</title>
    <link rel="stylesheet" href="/css/bootstrap.css">
    <link rel="stylesheet" href="/css/index.css">
    <script src="/js/jquery.js"></script>
    <script src="/js/bootstrap.js"></script>
  </head>
  <body>
  <div id="title">
    <h1 style="color: white">博士入学考試入口</h1>
  </div>
    <div id="main">
      <div id="loginBox">
        <h1>登录</h1>
        <label style="font-size: 20px;color: white">用戶名</label>
        <div class="input-group">
          <span class="input-group-addon" >@</span>
          <input type="text" id="lo_username" class="form-control" placeholder="用戶名" aria-describedby="basic-addon1">
        </div>
        <br>
        <label style="font-size: 20px;color: white">密碼</label>
        <div class="input-group">
          <span class="input-group-addon" >@</span>
          <input type="password" id="lo_password" class="form-control" placeholder="密碼" aria-describedby="basic-addon1">
        </div>
        <br><br>
        <select name="" id="is_admin" value="false" style="height: 30px;width: 100px;">
          <option value="false">普通用户</option>
          <option value="true">管理员</option>
        </select>
        <br>
        <button class="btn-primary btn" style="margin-left: 43%" onclick="userLogin()">登錄</button>
        <br>
        <p>还没有账号，去注册　<a href="#" onclick="goregister()">去注册</a></p>
      </div>


      <div id="registBox" style="display: none">
        <h1>注册</h1>
        <label style="font-size: 20px;color: white">用戶名</label>
        <div class="input-group">
          <span class="input-group-addon" id="basic-addon1">@</span>
          <input type="text" id="re_username" class="form-control" placeholder="用戶名" aria-describedby="basic-addon1">

        </div>
        <div id="tip"></div>
        <br>
        <label style="font-size: 20px;color: white">密碼</label>
        <div class="input-group">
          <span class="input-group-addon" id="basic-addon２">@</span>
          <input type="password" id="re_password" class="form-control" placeholder="密碼" aria-describedby="basic-addon1">
        </div>
        <br>
        <label style="font-size: 20px;color: white">重复密碼</label>
        <div class="input-group">
          <span class="input-group-addon" id="basic-addon３">@</span>
          <input type="password" id="rere_password" class="form-control" placeholder="重复密碼" aria-describedby="basic-addon1">
        </div>
        <br><br>
        <br>
        <button class="btn-primary" style="margin-left: 43%" onclick="registerUser()">注册</button>
        <br>
        <p>已有账号，去登陆　<a href="#" onclick="gologin()">去登陆</a></p>
      </div>

    </div>
  </body>
  <script>
    function goregister() {
      $("#loginBox").hide();
      $("#registBox").show();
    }
    function gologin() {
      $("#registBox").hide();
      $("#loginBox").show();
    }

    $("#re_username").blur(function () {
      var username = $(this).val();
      $.get("${pageContext.request.contextPath}/findUserAjaxServlet",{username :username},function (data) {
        console.log(data);

        if (data.userExit){
          $("#tip").html(data.msg);
          $("#tip").css("color","red");
          $("#re_username").val("")
        } else{
          $("#tip").html(data.msg);
          $("#tip").css("color","white");
        }
      },"json")
    })
    function registerUser() {
      var username = $("#re_username").val();
      var password = $("#re_password").val();
      var repassword = $("#rere_password").val();
      console.log(password)
      console.log(repassword)
      if(username==""||password==""||repassword==""){
        alert("注册信息不能为空！")
        return
      }
      if(password!=repassword){
        alert("两次密码不一样！")
        return
      }
      var data = {
        username:username,
        password:password,
        repassword:repassword
      }
      //data = JSON.stringify(data);
      console.log(data);
      $.ajax({
        url:'${pageContext.request.contextPath}/userregister/add',
        type:'post',
        data:data,
        success:function(data){
          console.log(data);
          alert("注册成功！即将返回登录")
          $("#registBox").hide();
          $("#loginBox").show();
        },
        error:function(data){
          console.log("zou err");
          console.log(data)
        }
      });
    }

    function userLogin() {
      var username = $("#lo_username").val();
      var password = $("#lo_password").val();
      var is_admin = $("#is_admin").val();
      if(username==""||password==""){
        alert("登录信息不能为空！")
        return
      }

      var data = {
        username:username,
        password:password,
        is_admin:is_admin
      }
      //data = JSON.stringify(data);
      console.log(data);
      $.ajax({
        url:'${pageContext.request.contextPath}/userregister/login',
        type:'post',
        data:data,
        success:function(data){
          console.log(data);
          var userInfo = JSON.stringify(data.loginInfo);

          window.localStorage.setItem("userInfo",userInfo)
          alert(data.msg)
          if(data.stadus=="ok"&&data.code==1){
            window.location.href = "http://localhost:8080/${pageContext.request.contextPath}/admin/admin.jsp"
          }
          if(data.stadus=="ok"&&data.code==0){
            window.location.href = "http://localhost:8080/${pageContext.request.contextPath}/index/index.jsp"
          }
        },
        error:function(data){
          console.log("zou err");
          console.log(data)
        }
      });
    }
  </script>
</html>
