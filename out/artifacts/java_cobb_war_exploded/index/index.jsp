
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>博士入学考试首页</title>
    <link rel="stylesheet" href="/css/bootstrap.css">
    <link rel="stylesheet" href="/css/index_index.css">
    <script src="/js/jquery.js"></script>
    <script src="/js/bootstrap.js"></script>
</head>
<body>
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
                <a class="navbar-brand" href="#">博士入学考试首页</a>
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">

                </ul>

                <ul class="nav navbar-nav navbar-right">
                    <li><a href="#" onclick="loginOu()">退出系统</a></li>
                </ul>
            </div><!-- /.navbar-collapse -->
        </div><!-- /.container-fluid -->
    </nav>
    <div id="userInfoDiv">
        <div class="img">
            <img src="" alt="" id="user_img">
        </div>
        <div class="info">
            <div class="list-group">
                <a href="#" class="list-group-item disabled">
                    我的信息
                </a>
                <a href="#" class="list-group-item" id="my_name">Dapibus ac facilisis in</a>
                <a href="#" class="list-group-item" id="my_username">Morbi leo risus</a>
                <a href="#" class="list-group-item" id="my_idCardNo">Porta ac consectetur ac</a>
                <a href="#" class="list-group-item" id="my_phone">Vestibulum at eros</a>
                <a href="#" class="list-group-item" >
                    <button  data-toggle="modal" data-target="#myModalupdateUserInfo" class="btn btn-success">完善信息</button></a>
            </div>
        </div>
    </div>

    <div id="bokaolistDiv">
        <div class="jumbotron jumck">
            <h1>博考列表</h1>
            <div id="bokaoTable"></div>
        </div>
    </div>


    <!-- 完善个人信息 -->
    <div class="modal fade" id="myModalupdateUserInfo" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabelupInfo">完善个人信息</h4>
                </div>
                <div class="modal-body">
                    <label style="font-size: 20px;color: white">名字</label>
                    <div class="input-group">
                        <span class="input-group-addon" >@</span>
                        <input type="text" id="upuser_name" class="form-control" placeholder="名字" aria-describedby="basic-addon1">
                    </div>
                    <br>
                    <label style="font-size: 20px;color: white">电话</label>
                    <div class="input-group">
                        <span class="input-group-addon" >@</span>
                        <input type="text" id="upuser_phone" class="form-control" placeholder="电话" aria-describedby="basic-addon1">
                    </div>
                    <label style="font-size: 20px;color: white">身份证</label>
                    <div class="input-group">
                        <span class="input-group-addon" >@</span>
                        <input type="text" id="upuser_idCardNo" class="form-control" placeholder="身份证" aria-describedby="basic-addon1">
                    </div>
                    <label style="font-size: 20px;color: white">头像</label>
                    <div class="input-group">
                        <span class="input-group-addon" >@</span>
                        <input type="file" id="upuser_headImg" class="form-control">
                    </div>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                    <button type="button" class="btn btn-primary" onclick="updateUserInfo()">修改我的信息</button>
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
                    <h2>考试科目列表</h2>
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
    <!-- 试题列表-->
    <!-- Modal -->
    <div class="modal fade" id="myModalbotestViewadd_shiti" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabeltestViewadd_shiti">考试试题</h4>
                </div>
                <div class="modal-body">
                    <h2>考试试题</h2>
                    <input type="hidden" id="test_view_aitem_Id">
                    <ul class="list-group">
                        <li>1</li>
                    </ul>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                    <button type="button" class="btn btn-primary" >提交答案</button>
                </div>
            </div>
        </div>
    </div>
    <!-- 查询面试成绩！-->
    <!-- Modal -->
    <div class="modal fade" id="myModalmianshi" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabelmianshi">查看面试成绩</h4>
                </div>
                <div class="modal-body">
                    <div id="mianshi_grade_seach" style="font-size: 20px;color: black">面试成绩</div>


                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                </div>
            </div>
        </div>
    </div>

    <script>
        var userInfo = JSON.parse(window.localStorage.getItem("userInfo"))
        var RightanswerArr = []
        console.log(userInfo)
        function userInfoToDom() {
            $("#my_name").html("姓名："+userInfo.name)
            $("#my_username").html("用户名："+userInfo.username)
            $("#my_idCardNo").html("身份证：："+userInfo.idCardNo)
            $("#my_phone").html("联系方式："+userInfo.phone)
            if(!userInfo.headImg){
                $("#user_img").attr({"src":"/imgs/adminbg.jpg"})
            }else {
                $("#user_img").attr({"src":userInfo.headImg})
            }
        }
        userInfoToDom()
        function loginOu() {
            window.localStorage.clear()
            window.location.replace("http://localhost:8080/${pageContext.request.contextPath}")
        }

        function updateUserInfo() {
            var data = {
                "id":userInfo.id,
                "name":$("#upuser_name").val(),
                "idCardNo":$("#upuser_idCardNo").val(),
                "phone":$("#upuser_phone").val()
            }
            data=JSON.stringify(data);
            var formData = new FormData();
            for(var index = 0; index < $('#upuser_headImg')[0].files.length; index++){
                formData.append('file', $('#upuser_headImg')[0].files[index]);
            }
            console.log(formData);
            console.log(data);
            if ($("#upuser_name").val()==""||
                $("#upuser_idCardNo").val()==""||
                $("#upuser_phone").val()==""||
                $('#upuser_headImg')[0].files.length==0
            ){
                alert("信息不能为空！！");
            } else {
                $.ajax({
                    url:'${pageContext.request.contextPath}/updateUserInfo',
                    type:'post',
                    data:data,
                    dataType:'json',
                    contentType:'application/json',
                    success:function(data){
                        console.log(data);
                        userupImg()
                    },
                    error:function(data){
                        console.log("zou err");
                        console.log(data)
                        userupImg()
                    }
                });
            }
        }
        function userupImg(){
            var formData = new FormData();
            for(var index = 0; index < $('#upuser_headImg')[0].files.length; index++){
                formData.append('file', $('#upuser_headImg')[0].files[index]);
            }
            formData.append('id', userInfo.id);
            $.ajax({
                url:'${pageContext.request.contextPath}/updateUserInfoImg?id='+userInfo.id,
                type:'post',
                cache: false,
                data:formData,
                processData: false,
                contentType: false,
                enctype:"multipart/form-data",
                success:function(data){
                    console.log("图片成功！")
                    alert("更新成功！")
                    userInfo = data.userInfo;
                    window.localStorage.setItem("userInfo",userInfo)
                    return  userInfoToDom();
                },
                error:function(data){
                    console.log("图片走失败")
                }
            });
        }

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

                    <button type="button" class="btn btn-info" data-toggle="modal" data-target="#myModalbotestView" uid="`+boKaoList[i].T_id+`" sc="`+boKaoList[i].school+`" pro="`+boKaoList[i].project+`">参加考试</button>

</td>
                </tr>`
                }
                str+=`</table>`;
                $("#bokaoTable").html(str)
            },"json")
        }

        getBoKaoList()
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
                    str+=`<li class="list-group-item">`+list[i].title+`  <button type="button" class="btn btn-info" data-toggle="modal" data-target="#myModalbotestViewadd_shiti" uid="`+list[i].I_id+`">考试</button>
                    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModalmianshi"  uid="`+list[i].I_id+`">查看面试成绩</button>
                </li>`
                }
                $("#myModalbotestView .list-group").html(str)
            },"json")
        })
        $(document).on("click","#myModalbotestView .btn-primary",function () {
            var I_id =$(this).attr("uid")
            var u_id = userInfo.id
            $.get("${pageContext.request.contextPath}/getGradeByUser",{i_id :I_id,u_id:u_id},function (data) {
                console.log(data,"ok");
                console.log(data.agrade[0].mianshi)
                $("#mianshi_grade_seach").html("你的面试成绩为："+data.agrade[0].mianshi);
                setTimeout(function () {
                    $("#mianshi_grade_seach").html("重新获取，面试成绩！");
                },1000)
            },"json")
        })
        $(document).on("click","#myModalbotestView .btn-info",function () {
            var I_id =$(this).attr("uid")
            var u_id = userInfo.id
            var count;
            $("#test_view_aitem_Id").val(I_id)
            $.get("${pageContext.request.contextPath}/gradeIsExitByTowId",{i_id :I_id,u_id:u_id},function (data) {
                console.log(data,"isExit");
                count = data.count
                console.log(data.count != 0||data.list.length==0)
                if (data.count != 0||data.list.length==0){
                    if(data.list.length==0){
                        $("#myModalbotestViewadd_shiti .list-group").html("试卷还未出来，耐心等候！")
                    }else{
                        $("#myModalbotestViewadd_shiti .list-group").html("你已经考过试了！ 分数为："+data.agrade[0].grade+"分！")
                    }

                    $("#myModalbotestViewadd_shiti .btn-primary").hide()
                    return
                }
                $("#myModalbotestViewadd_shiti .btn-primary").show()
            },"json")

            $.get("${pageContext.request.contextPath}/bokaoTestListShitiList",{id :I_id,u_id:u_id},function (data) {
                console.log(data,"bokaoTestList");
                var list = data.list;
                console.log(list.length==0)
                if(list.length==0){
                    $("#myModalbotestViewadd_shiti .list-group").html("试卷还未出来，耐心等候！")
                    $("#myModalbotestViewadd_shiti .btn-primary").hide()
                    return
                }else if (data.count == 0){
                    $("#myModalbotestViewadd_shiti .btn-primary").show()
                    RightanswerArr = data.list;
                    var str = ``;
                    for(var i=0;i<list.length;i++){
                        str+=`<li class="list-group-item">描述：`+list[i].title+`  选项A:`+list[i].secA+`  选项B:`+list[i].secB+`  选项C:`+list[i].secC+` -------答案：<input type="text"></li>`
                    }
                    $("#myModalbotestViewadd_shiti .list-group").html(str)
                } else{
                    if(data.count!=0){
                        $("#myModalbotestViewadd_shiti .list-group").html("你已经考过试了！ 分数为："+data.agrade[0].grade+"分！")
                    }else {
                        $("#myModalbotestViewadd_shiti .list-group").html("你已经考过试了！ 分数为：分！")
                    }

                    $("#myModalbotestViewadd_shiti .btn-primary").hide()
                    return
                }

            },"json")
        })
        $(document).on("click","#myModalbotestViewadd_shiti .btn-primary",function () {
            console.log("提交答案")
            var $inputArr = $('#myModalbotestViewadd_shiti input');//length = 3
            //3.循环处理input,并定义结果集
            var result = [];
            $inputArr.each(function(){
                //4.将每个input的值放进结果集
                result.push($(this).val());
            });
            //5.打印结果
            result.shift()
            var anserArr = [...result];
            console.log(result);
            console.log(anserArr)
            console.log(RightanswerArr)
            var grade = 0
            for (var i = 0 ;i<anserArr.length;i++){
                if(anserArr[i]==RightanswerArr[i].answer){
                    grade+=5;
                }
            }
            console.log("总分数："+grade)
            var i_id = $("#test_view_aitem_Id").val();
            var u_id = userInfo.id
            $.get("${pageContext.request.contextPath}/gradeAdd",{i_id :i_id,u_id:u_id,grade:grade},function (data) {
                console.log(data,"isExit");
                $("#myModalbotestViewadd_shiti .list-group").html("你已经考过试了！ 分数为："+data.agrade[0].grade+"分！")
                $("#myModalbotestViewadd_shiti .btn-primary").hide()
            },"json")

        })
    </script>
</body>
</html>
