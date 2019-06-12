
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>后台管理系统</title>
    <link rel="stylesheet" href="/css/bootstrap.css">
    <link rel="stylesheet" href="/css/admin.css">
    <script src="/js/jquery.js"></script>
    <script src="/js/bootstrap.js"></script>
</head>
<body>
<div id="app">
    <nav class="navbar navbar-default navbar-inverse">
        <div class="container-fluid">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="#">后台管理系统</a>
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">

                </ul>

                <ul class="nav navbar-nav navbar-right">
                    <li><a href="#" onclick="loginOut()">退出系统</a></li>
                </ul>
            </div><!-- /.navbar-collapse -->
        </div><!-- /.container-fluid -->
    </nav>
    <div id="left_nav">
        <!-- Single button -->
        <div class="btn-group">
            <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                用户管理 <span class="caret"></span>
            </button>
            <ul class="dropdown-menu">
                <li><a href="#" class="jumb_cp" onclick="getUserList()">用户列表</a></li>
            </ul>
        </div>
        <!-- Single button -->
        <div class="btn-group">
            <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                博试列表 <span class="caret"></span>
            </button>
            <ul class="dropdown-menu">
                <li><a href="#" class="jumb_cp" onclick="getBoKaoList()">博考列表</a></li>

            </ul>
        </div>
        <!-- Single button -->
        <div class="btn-group">
            <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                成绩管理 <span class="caret"></span>
            </button>
            <ul class="dropdown-menu">
                <li><a href="#" class="jumb_cp" onclick="getGradeList()">成绩列表</a></li>
            </ul>
        </div>
    </div>
    <div id="main">
        <div class="jumbotron" id="shouyehuanying">
            <h1>欢迎管理员</h1>
            <p style="text-indent: 2em"> 博士研究生考试分为春季考试和秋季考试两种，一般来说春季考试在三月份进行，九月份入学；秋季考试在十或十一月份进行，次年三月份入学。不过博士研究生考试是由各学校组织的，具体考试时间不同的学校也是不一样的。有的学校是两次考试两次入学，有的是一次考试一次入学，还有的是一次考试两次入学。建议登陆所报考学校网站查询有关信息。</p>
        </div>
        <div class="jumbotron jumck" style="display: none">
            <h1>用户列表 <button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModaluseradd">添加</button></h1>
            <div id="userTable"></div>

        </div>
        <div class="jumbotron jumck" style="display: none">
            <h1>博考列表 <button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModalbokaoadd">添加</button></h1>
            <div id="bokaoTable"></div>
        </div>
        <div class="jumbotron jumck" style="display: none">
            <h1>各个学校的专业博士入学考试成绩</h1>
            <div id="gradeList"></div>
        </div>
    </div>
    <!-- 用户的添加-->
    <!-- Modal -->
    <div class="modal fade" id="myModaluseradd" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabeluseradd">用户的添加</h4>
                </div>
                <div class="modal-body">
                    <label style="font-size: 20px;color: white">用戶名</label>
                    <div class="input-group">
                        <span class="input-group-addon" >@</span>
                        <input type="text" id="add_username" class="form-control" placeholder="用戶名" aria-describedby="basic-addon1">
                    </div>
                    <br>
                    <label style="font-size: 20px;color: white">密碼</label>
                    <div class="input-group">
                        <span class="input-group-addon" >@</span>
                        <input type="password" id="add_password" class="form-control" placeholder="密碼" aria-describedby="basic-addon1">
                    </div>
                    <br><br>
                    <select name="" id="add_is_admin" value="false" style="height: 30px;width: 100px;">
                        <option value="false">普通用户</option>
                        <option value="true">管理员</option>
                    </select>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                    <button type="button" class="btn btn-primary">添加</button>
                </div>
            </div>
        </div>
    </div>
    <!-- 用户的修改-->
    <!-- Modal -->
    <div class="modal fade" id="myModaluseredit" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabeluseredit">用户的修改</h4>
                </div>
                <input type="hidden" id="edit_id">
                <div class="modal-body">
                    <label style="font-size: 20px;color: white">用戶名</label>
                    <div class="input-group">
                        <span class="input-group-addon" >@</span>
                        <input type="text" id="edit_username" class="form-control" placeholder="用戶名" aria-describedby="basic-addon1" readonly>
                    </div>
                    <br>
                    <label style="font-size: 20px;color: white">密碼</label>
                    <div class="input-group">
                        <span class="input-group-addon" >@</span>
                        <input type="password" id="edit_password" class="form-control" placeholder="密碼" aria-describedby="basic-addon1">
                    </div>
                    <br><br>
                    <select name="" id="edit_is_admin" value="false" style="height: 30px;width: 100px;">
                        <option value="false">普通用户</option>
                        <option value="true">管理员</option>
                    </select>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                    <button type="button" class="btn btn-primary">修改</button>
                </div>
            </div>
        </div>
    </div>


    <!-- 博考的添加-->
    <!-- Modal -->
    <div class="modal fade" id="myModalbokaoadd" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabelbokaoadd">博考的添加</h4>
                </div>
                <div class="modal-body">
                    <label style="font-size: 20px;color: white">学校</label>
                    <div class="input-group">
                        <span class="input-group-addon" >@</span>
                        <input type="text" id="add_school" class="form-control" placeholder="学校" aria-describedby="basic-addon1">
                    </div>
                    <br>
                    <label style="font-size: 20px;color: white">方向</label>
                    <div class="input-group">
                        <span class="input-group-addon" >@</span>
                        <input type="text" id="add_project" class="form-control" placeholder="方向" aria-describedby="basic-addon1">
                    </div>
                    <br><br>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                    <button type="button" class="btn btn-primary">添加</button>
                </div>
            </div>
        </div>
    </div>


    <!-- 查看试题-->
    <!-- Modal -->
    <div class="modal fade" id="myModalbotestView" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabeltestView">试题的查看</h4>
                </div>
                <div class="modal-body">
                    <h2>考试科目列表　<button type="button" class="btn btn-default"  data-toggle="modal" data-target="#myModalbotestViewadd" >添加考试科目</button></h2>
                    <input type="hidden" id="test_view_bokaoId">
                    <ul class="list-group">

                    </ul>
                    <br><br>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>

                </div>
            </div>
        </div>
    </div>
    <!-- 科目名称-->
    <!-- Modal -->
    <div class="modal fade" id="myModalbotestViewadd" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabeltestViewadd">科目的添加</h4>
                </div>
                <div class="modal-body">
                    <label style="font-size: 20px;color: white">科目名称</label>
                    <div class="input-group">
                        <span class="input-group-addon" >@</span>
                        <input type="text" id="test_list_item_add_title" class="form-control" placeholder="科目名称" aria-describedby="basic-addon1">
                    </div>
                    <br>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                    <button type="button" class="btn btn-primary">添加</button>
                </div>
            </div>
        </div>
    </div>
    <!-- 试题列表-->
    <!-- Modal -->
    <div class="modal fade" id="myModalbotestViewadd_shiti" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabeltestViewadd_shiti">试题列表</h4>
                </div>
                <div class="modal-body">
                    <h2>试题列表　<button type="button" class="btn btn-default"  data-toggle="modal" data-target="#myModalbotestViewadd_shitiAdd" >添加试题</button></h2>
                    <input type="hidden" id="test_view_aitem_Id">
                    <ul class="list-group">
                        <li>1</li>
                    </ul>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>

                </div>
            </div>
        </div>
    </div>
    <!-- 试题添加-->
    <!-- Modal -->
    <div class="modal fade" id="myModalbotestViewadd_shitiAdd" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabeltestViewadd_shitiAdd">科目的试题添加</h4>
                </div>
                <div class="modal-body">
                    <label style="font-size: 20px;color: white">描述</label>
                    <div class="input-group">
                        <span class="input-group-addon" >@</span>
                        <input type="text" id="test_list_item_shiti_add_desc" class="form-control" placeholder="描述" aria-describedby="basic-addon1">
                    </div>
                    <br>
                    <label style="font-size: 20px;color: white">选项Ａ</label>
                    <div class="input-group">
                        <span class="input-group-addon" >A</span>
                        <input type="text" id="shiti_secA" class="form-control" placeholder="选项" aria-describedby="basic-addon1">
                    </div>
                    <label style="font-size: 20px;color: white">选项B</label>
                    <div class="input-group">
                        <span class="input-group-addon" >B</span>
                        <input type="text" id="shiti_secB" class="form-control" placeholder="选项" aria-describedby="basic-addon1">
                    </div>
                    <label style="font-size: 20px;color: white">选项C</label>
                    <div class="input-group">
                        <span class="input-group-addon" >C</span>
                        <input type="text" id="shiti_secC" class="form-control" placeholder="选项" aria-describedby="basic-addon1">
                    </div>
                    <label style="font-size: 20px;color: white">答案</label>
                    <div class="input-group">
                        <span class="input-group-addon" >@</span>
                        <input type="text" id="test_list_item_shiti_add_answer" class="form-control" placeholder="答案" aria-describedby="basic-addon1">
                    </div>
                    <br>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                    <button type="button" class="btn btn-primary">添加</button>
                </div>
            </div>
        </div>
    </div>
</div>
    <script>
        $(".jumb_cp").click(function() {
            $("#shouyehuanying").hide()
            console.log("click")
                $(".jumck").eq($(".jumb_cp").index(this)).show().siblings("div").hide();
            }
        )
        //用户的操作
        function getUserList() {
            console.log("userList")
            $.get("${pageContext.request.contextPath}/getUserList",function (data) {
                console.log(data);
                var userList = data.Userlist
                var str = `
                <table class="table table-hover table-bordered table-striped" >
                        <tr>
                        <td>序号</td>
                        <td>用户名</td>
                        <td>密码</td>
                        <td>名字</td>
                        <td>电话</td>
                        <td>省份证</td>
                        <td>是否管理员</td>
                        <td>操作</td>
                    </tr>`;
                for(var i =0;i<userList.length;i++){
                    console.log(userList[i].username)
                    str += `<tr>
                    <td>`+(i+1)+`</td>
                    <td>`+userList[i].username+`</td>
                    <td>`+userList[i].password+`</td>
                    <td>`+userList[i].name+`</td>
                    <td>`+userList[i].phone+`</td>
                    <td>`+userList[i].idCardNo+`</td>
                    <td>`+userList[i].is_admin+`</td>
                    <td><button type="button" class="btn btn-warning" data-toggle="modal" data-target="#myModaluseredit" uid="`+userList[i].id+`">修改</button>
                        <button type="button" class="btn btn-danger" uid="`+userList[i].id+`">删除</button></td>
                </tr>`
                }
                str+=`</table>`;
                $("#userTable").html(str)
            },"json")
        }
            $(document).on("click","#userTable .btn-danger",function () {
                var id =$(this).attr("uid")
                if(confirm("你是否要删除ｉｄ为："+id+"的用户！！！")){
                    $.get("${pageContext.request.contextPath}/deleteUserById",{id :id},function (data) {
                        console.log(data);
                        return getUserList()

                    },"json")
                }
            })
            $(document).on("click","#userTable .btn-warning",function () {
                var id =$(this).attr("uid")

                $.get("${pageContext.request.contextPath}/getUserInfoById",{id :id},function (data) {
                    console.log(data);
                    var userInfo = data.userInfo;
                    $("#edit_username").val(userInfo.username)
                    $("#edit_password").val(userInfo.password)
                    $("#edit_is_admin").val(userInfo.is_admin)
                    $("#edit_id").val(userInfo.id);
                },"json")

            })

            function deleUserById(id) {
                console.log(id)
                if(confirm("是否要删除ｉd为"+id+"的用户")){
                    alert("删除成功")
                }
            }
            $(document).on("click","#myModaluseradd .btn-primary",function () {
                var username = $("#add_username").val();
                var password = $("#add_password").val();
                var is_admin = $("#add_is_admin").val();
                if(username==""||password==""||is_admin==""){
                    alert("添加信息不能为空！")
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
                    url:'${pageContext.request.contextPath}/adminUserAdd',
                    type:'post',
                    data:data,
                    success:function(data){
                        console.log(data);
                        alert("添加成功！")
                        return getUserList()
                    },
                    error:function(data){
                        console.log("zou err");
                        console.log(data)
                    }
                });
            })


        $(document).on("click","#myModaluseredit .btn-primary",function () {
            var id = $("#edit_id").val();
            var username = $("#edit_username").val();
            var password = $("#edit_password").val();
            var is_admin = $("#edit_is_admin").val();
            if(username==""||password==""||is_admin==""){
                alert("修改的信息不能为空！")
                return
            }
            var data = {
                id:id,
                username:username,
                password:password,
                is_admin:is_admin
            }
            //data = JSON.stringify(data);
            console.log(data);
            $.ajax({
                url:'${pageContext.request.contextPath}/adminUserEditById',
                type:'post',
                data:data,
                success:function(data){
                    console.log(data);
                    alert("修改成功！")
                    return getUserList()
                },
                error:function(data){
                    console.log("zou err");
                    console.log(data)
                }
            });
        })

        //　博考的操作
        function getBoKaoList() {
            $.get("${pageContext.request.contextPath}/getBoKaoList",function (data) {
                console.log(data);
                var boKaoList = data.Userlist
                var str = `
                <table class="table table-hover table-bordered table-striped" >
                        <tr>
                        <td>序号</td>
                        <td>学校</td>
                        <td>方向</td>
                        <td>操作</td>
                    </tr>`;
                for(var i =0;i<boKaoList.length;i++){
                    str += `<tr>
                    <td>`+(i+1)+`</td>
                    <td>`+boKaoList[i].school+`</td>
                    <td>`+boKaoList[i].project+`</td>
                    <td>
                        <button type="button" class="btn btn-danger" uid="`+boKaoList[i].T_id+`">删除</button>
                    <button type="button" class="btn btn-info" data-toggle="modal" data-target="#myModalbotestView" uid="`+boKaoList[i].T_id+`" sc="`+boKaoList[i].school+`" pro="`+boKaoList[i].project+`">查看试题</button></td>
                </tr>`
                }
                str+=`</table>`;
                $("#bokaoTable").html(str)
            },"json")
        }
        $(document).on("click","#bokaoTable .btn-danger",function () {
            var id =$(this).attr("uid")
            if(confirm("你是否要删除ｉｄ为："+id+"的博考列表！！！")){
                $.get("${pageContext.request.contextPath}/deleteBokaoById",{id :id},function (data) {
                    console.log(data);
                    return getBoKaoList();

                },"json")
            }
        })
        $(document).on("click","#myModalbokaoadd .btn-primary",function () {
            var school = $("#add_school").val();
            var project = $("#add_project").val();
            if(school==""||project==""){
                alert("添加信息不能为空！")
                return
            }
            var data = {
                school:school,
                project:project
            }
            //data = JSON.stringify(data);
            console.log(data);
            $.ajax({
                url:'${pageContext.request.contextPath}/bokaoAdd',
                type:'post',
                data:data,
                success:function(data){
                    console.log(data);
                    alert("添加成功！")
                    return getBoKaoList();
                },
                error:function(data){
                    console.log("zou err");
                    console.log(data)
                }
            });
        })
        $(document).on("click","#bokaoTable .btn-info",function () {
            var id =$(this).attr("uid")
            var school = $(this).attr("sc")
            var pro = $(this).attr("pro")
            $("#test_view_bokaoId").val(id)
            $("#myModalLabeltestView").html(school+"-"+pro +"的试题")
            console.log("进入试题查看")
            $.get("${pageContext.request.contextPath}/bokaoTestList",{id :id},function (data) {
                console.log(data,"bokaoTestList");
                var list = data.list;
                var str = ``;
                for(var i=0;i<list.length;i++){
                    str+=`<li class="list-group-item">`+list[i].title+`  <button type="button" class="btn btn-info" data-toggle="modal" data-target="#myModalbotestViewadd_shiti" uid="`+list[i].I_id+`">试题列表</button>   <button type="button" class="btn btn-danger" uid="`+list[i].I_id+`">删除</button></li>`
                }
                $("#myModalbotestView .list-group").html(str)
            },"json")
        })
        $(document).on("click","#myModalbotestViewadd .btn-primary",function () {
            var T_id =$("#test_view_bokaoId").val()
            var title = $("#test_list_item_add_title").val()
            console.log(T_id);
            $.get("${pageContext.request.contextPath}/bokaoTestListItemAdd",{T_id :T_id,title:title},function (data) {
                console.log(data,"bokaoTestList");
                var list = data.list;
                var str = ``;
                for(var i=0;i<list.length;i++){
                    str+=`<li class="list-group-item">`+list[i].title+` <button type="button" class="btn btn-info" data-toggle="modal" data-target="#myModalbotestViewadd_shiti" uid="`+list[i].I_id+`">试题列表</button>   <button type="button" class="btn btn-danger" uid="`+list[i].I_id+`">删除</button></li>`
                }
                $("#myModalbotestView .list-group").html(str)
            },"json")
        })
        $(document).on("click","#myModalbotestView .btn-danger",function () {
            var I_id =$(this).attr("uid")
            var T_id = $("#test_view_bokaoId").val()
            if(confirm("你是否要删除ｉｄ为："+I_id+"的科目！！！")){
                $.get("${pageContext.request.contextPath}/bokaoTestListItemDele",{id :I_id,T_id:T_id},function (data) {
                    console.log(data);
                    var list = data.list;
                    var str = ``;
                    for(var i=0;i<list.length;i++){
                        str+=`<li class="list-group-item">`+list[i].title+` <button type="button" class="btn btn-info" data-toggle="modal" data-target="#myModalbotestViewadd_shiti" uid="`+list[i].I_id+`">试题列表</button>  <button type="button" class="btn btn-danger" uid="`+list[i].I_id+`">删除</button></li>`
                    }
                    $("#myModalbotestView .list-group").html(str)
                },"json")
            }
        })
        $(document).on("click","#myModalbotestView .btn-info",function () {
            var I_id =$(this).attr("uid")
            $("#test_view_aitem_Id").val(I_id)
            $.get("${pageContext.request.contextPath}/bokaoTestListShitiList",{id :I_id},function (data) {
                console.log(data,"bokaoTestList");
                var list = data.list;
                var str = ``;
                for(var i=0;i<list.length;i++){
                    str+=`<li class="list-group-item">描述：`+list[i].title+`  选项A:`+list[i].secA+`  选项B:`+list[i].secB+`  选项C:`+list[i].secC+`答案：`+list[i].answer+` <button type="button" class="btn btn-danger"  uid="`+list[i].i_id+`">删除</button></li>`
                }
                $("#myModalbotestViewadd_shiti .list-group").html(str)
            },"json")
        })
        $(document).on("click","#myModalbotestViewadd_shitiAdd .btn-primary",function () {
            var Item_id =$("#test_view_aitem_Id").val()
            var title = $("#test_list_item_shiti_add_desc").val()
            var answer = $("#test_list_item_shiti_add_answer").val()
            var secA = $("#shiti_secA").val()
            var secB = $("#shiti_secB").val()
            var secC = $("#shiti_secC").val()
            if(title==""||answer==""){
                alert("试题添加不能为空！")
                return
            }
            $.get("${pageContext.request.contextPath}/bokaoTestListShitiAdd",{Item_id :Item_id,title:title,answer:answer,secA:secA,secB:secB,secC:secC},function (data) {
                console.log(data,"试题列表的获取");
                alert("添加试题成功！")
                var list = data.list;
                var str = ``;
                for(var i=0;i<list.length;i++){
                    str+=`<li class="list-group-item">描述：`+list[i].title+`  选项A:`+list[i].secA+`  选项B:`+list[i].secB+`  选项C:`+list[i].secC+`  答案：`+list[i].answer+` <button type="button" class="btn btn-danger" uid="`+list[i].i_id+`">删除</button></li>`
                }
                $("#myModalbotestViewadd_shiti .list-group").html(str)
            },"json")
        })
        $(document).on("click","#myModalbotestViewadd_shiti .btn-danger",function () {
            var i_id =$(this).attr("uid")
            var Item_id = $("#test_view_aitem_Id").val()
            if(confirm("你是否要删除ｉｄ为："+i_id+"的试题！！！")){
                $.get("${pageContext.request.contextPath}/bokaoTestListShitideleByiid",{id :i_id,Item_id:Item_id},function (data) {
                    console.log(data);

                    var list = data.list;
                    var str = ``;
                    for(var i=0;i<list.length;i++){
                        str+=`<li class="list-group-item">描述：`+list[i].title+`  选项A:`+list[i].secA+`  选项B:`+list[i].secB+`  选项C:`+list[i].secC+`  答案：`+list[i].answer+` <button type="button" class="btn btn-danger" uid="`+list[i].i_id+`">删除</button></li>`
                    }
                    $("#myModalbotestViewadd_shiti .list-group").html(str)

                },"json")
            }
        })
        function loginOut() {
            window.localStorage.clear()
            window.location.replace("http://localhost:8080/${pageContext.request.contextPath}")
        }

        function getGradeList() {
            $.get("${pageContext.request.contextPath}/getGradeList",function (data) {
                console.log(data);
                var boKaoList = data.GradeList
                var str = `
                <table class="table table-hover table-bordered table-striped" >
                        <tr>
                        <td>序号</td>
                        <td>学校</td>
                        <td>方向</td>
                        <td>科目</td>
                        <td>名字</td>
                        <td>身份证</td>
                        <td>电话</td>
                        <td>分数</td>
                    </tr>`;
                for(var i =0;i<boKaoList.length;i++){
                    str += `<tr>
                    <td>`+(i+1)+`</td>
                    <td>`+boKaoList[i].school+`</td>
                    <td>`+boKaoList[i].project+`</td>
                    <td>`+boKaoList[i].title+`</td>
                    <td>`+boKaoList[i].name+`</td>
                    <td>`+boKaoList[i].idCardNo+`</td>
                    <td>`+boKaoList[i].phone+`</td>
                    <td>`+boKaoList[i].grade+`</td>
                    </tr>`
                }
                str+=`</table>`;
                $("#gradeList").html(str)
            },"json")
        }
    </script>
</body>
</html>
