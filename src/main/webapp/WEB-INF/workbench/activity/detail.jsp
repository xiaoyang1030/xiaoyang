<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">

    <link href="${pageContext.request.contextPath}/jquery/bootstrap_3.3.0/css/bootstrap.min.css" type="text/css"
          rel="stylesheet"/>
    <script type="text/javascript" src="${pageContext.request.contextPath}/jquery/jquery-1.11.1-min.js"></script>
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/jquery/bootstrap_3.3.0/js/bootstrap.min.js"></script>

    <script type="text/javascript">

        //默认情况下取消和保存按钮是隐藏的
        var cancelAndSaveBtnDefault = true;

        $(function () {
            $("#remark").focus(function () {
                if (cancelAndSaveBtnDefault) {
                    //设置remarkDiv的高度为130px
                    $("#remarkDiv").css("height", "130px");
                    //显示
                    $("#cancelAndSaveBtn").show("2000");
                    cancelAndSaveBtnDefault = false;
                }
            });

            $("#cancelBtn").click(function () {
                //显示
                $("#cancelAndSaveBtn").hide();
                //设置remarkDiv的高度为130px
                $("#remarkDiv").css("height", "90px");
                cancelAndSaveBtnDefault = true;
            });

            //使用js事件委派机制通过父类元素给子类元素绑定之间
            $('#father').on('mouseover', '.remarkDiv', function () {
                $(this).children("div").children("div").show();
            });

            $('#father').on('mouseout', '.remarkDiv', function () {
                $(this).children("div").children("div").hide();
            });

            $('#father').on('mouseover', '.myHref', function () {
                $(this).children("span").css("color", "red");
            });

            $('#father').on('mouseout', '.myHref', function () {
                $(this).children("span").css("color", "#E6E6E6");
            });

            // $(".remarkDiv").mouseover(function () {
            //     $(this).children("div").children("div").show();
            // });
            //
            // $(".remarkDiv").mouseout(function () {
            //     $(this).children("div").children("div").hide();
            // });
            //
            // $(".myHref").mouseover(function () {
            //     $(this).children("span").css("color", "red");
            // });
            //
            // $(".myHref").mouseout(function () {
            //     $(this).children("span").css("color", "#E6E6E6");
            // });
        });

    </script>

</head>
<body>


<!-- 修改市场活动的模态窗口 -->
<div class="modal fade" id="editActivityModal" role="dialog">
    <div class="modal-dialog" role="document" style="width: 85%;">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">
                    <span aria-hidden="true">×</span>
                </button>
                <h4 class="modal-title" id="myModalLabel">修改市场活动</h4>
            </div>
            <div class="modal-body">

                <form class="form-horizontal" role="form">

                    <div class="form-group">
                        <input type="hidden" id="activityId" value="${activity.id}">
                        <label for="edit-marketActivityOwner" class="col-sm-2 control-label">所有者<span
                                style="font-size: 15px; color: red;">*</span></label>
                        <div class="col-sm-10" style="width: 300px;">
                            <select class="form-control" id="edit-marketActivityOwner">
                            </select>
                        </div>
                        <label for="edit-marketActivityName" class="col-sm-2 control-label">名称<span
                                style="font-size: 15px; color: red;">*</span></label>
                        <div class="col-sm-10" style="width: 300px;">
                            <input type="text" class="form-control" id="edit-marketActivityName">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="edit-startTime" class="col-sm-2 control-label">开始日期</label>
                        <div class="col-sm-10" style="width: 300px;">
                            <input type="text" class="form-control" id="edit-startTime">
                        </div>
                        <label for="edit-endTime" class="col-sm-2 control-label"></label>
                        <div class="col-sm-10" style="width: 300px;">
                            <input type="text" class="form-control" id="edit-endTime">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="edit-cost" class="col-sm-2 control-label"></label>
                        <div class="col-sm-10" style="width: 300px;">
                            <input type="text" class="form-control" id="edit-cost">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="edit-describe" class="col-sm-2 control-label">描述</label>
                        <div class="col-sm-10" style="width: 81%;">
                            <textarea class="form-control" rows="3" id="edit-describe"></textarea>
                        </div>
                    </div>

                </form>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" onclick="editActivityBtn()" data-dismiss="modal">更新
                </button>
            </div>
        </div>
    </div>
</div>

<!-- 返回按钮 -->
<div style="position: relative; top: 35px; left: 10px;">
    <a href="javascript:void(0);" onclick="window.history.back();"><span class="glyphicon glyphicon-arrow-left"
                                                                         style="font-size: 20px; color: #DDDDDD"></span></a>
</div>

<!-- 大标题 -->
<div style="position: relative; left: 40px; top: -30px;">
    <div class="page-header">
        <h3>市场活动-${activity.name}
            <small>${activity.startDate} ~${activity.endDate}</small>
        </h3>
    </div>
    <div style="position: relative; height: 50px; width: 250px;  top: -72px; left: 700px;">
        <button type="button" onclick="editBtn('${activity.id}')" class="btn btn-default" data-toggle="modal"
                data-target="#editActivityModal"><span class="glyphicon glyphicon-edit"></span> 编辑
        </button>
        <button type="button" class="btn btn-danger"><span class="glyphicon glyphicon-minus"></span> 删除</button>
    </div>
</div>

<!-- 详细信息 -->
<div style="position: relative; top: -70px;">
    <div style="position: relative; left: 40px; height: 30px;">
        <div style="width: 300px; color: gray;">所有者</div>
        <div style="width: 300px;position: relative; left: 200px; top: -20px;"><b>${activity.owner}</b></div>
        <div style="width: 300px;position: relative; left: 450px; top: -40px; color: gray;">名称</div>
        <div style="width: 300px;position: relative; left: 650px; top: -60px;"><b>${activity.name}</b></div>
        <div style="height: 1px; width: 400px; background: #D5D5D5; position: relative; top: -60px;"></div>
        <div style="height: 1px; width: 400px; background: #D5D5D5; position: relative; top: -60px; left: 450px;"></div>
    </div>

    <div style="position: relative; left: 40px; height: 30px; top: 10px;">
        <div style="width: 300px; color: gray;">开始日期</div>
        <div style="width: 300px;position: relative; left: 200px; top: -20px;"><b>${activity.startDate}</b></div>
        <div style="width: 300px;position: relative; left: 450px; top: -40px; color: gray;">结束日期</div>
        <div style="width: 300px;position: relative; left: 650px; top: -60px;"><b>${activity.endDate}</b></div>
        <div style="height: 1px; width: 400px; background: #D5D5D5; position: relative; top: -60px;"></div>
        <div style="height: 1px; width: 400px; background: #D5D5D5; position: relative; top: -60px; left: 450px;"></div>
    </div>
    <div style="position: relative; left: 40px; height: 30px; top: 20px;">
        <div style="width: 300px; color: gray;">成本</div>
        <div style="width: 300px;position: relative; left: 200px; top: -20px;"><b>${activity.cost}</b></div>
        <div style="height: 1px; width: 400px; background: #D5D5D5; position: relative; top: -20px;"></div>
    </div>
    <div style="position: relative; left: 40px; height: 30px; top: 30px;">
        <div style="width: 300px; color: gray;">创建者</div>
        <div style="width: 500px;position: relative; left: 200px; top: -20px;"><b>${activity.createBy}&nbsp;&nbsp;</b>
            <small style="font-size: 10px; color: gray;">${activity.createTime}</small>
        </div>
        <div style="height: 1px; width: 550px; background: #D5D5D5; position: relative; top: -20px;"></div>
    </div>
    <div style="position: relative; left: 40px; height: 30px; top: 40px;">
        <div style="width: 300px; color: gray;">修改者</div>
        <div style="width: 500px;position: relative; left: 200px; top: -20px;"><b>${activity.editBy}&nbsp;&nbsp;</b>
            <small style="font-size: 10px; color: gray;">${activity.editTime}</small>
        </div>
        <div style="height: 1px; width: 550px; background: #D5D5D5; position: relative; top: -20px;"></div>
    </div>
    <div style="position: relative; left: 40px; height: 30px; top: 50px;">
        <div style="width: 300px; color: gray;">描述1</div>
        <div style="width: 630px;position: relative; left: 200px; top: -20px;">
            <b id="testId">
                ${activity.description}
            </b>
        </div>
        <div style="height: 1px; width: 850px; background: #D5D5D5; position: relative; top: -20px;"></div>
    </div>
</div>

<!-- 备注 -->
<div id="father" style="position: relative; top: 30px; left: 40px;">
    <div class="page-header">
        <h4>备注</h4>
    </div>
    <div id="before">
        <c:forEach items="${activity.activityRemark}" var="activityRemark">
            <!-- 备注1 -->
            <div id="div${activityRemark.id}" class="remarkDiv" style="height: 60px;">
                <img title="zhangsan" src="${pageContext.request.contextPath}/image/user-thumbnail.png"
                     style="width: 30px; height:30px;">
                <div style="position: relative; top: -40px; left: 40px;">
                    <h5 id="h5${activityRemark.id}">${activityRemark.notecontent}</h5>
                    <font color="gray">市场活动</font> <font color="gray">-</font> <b>${activity.name}</b>
                    <small style="color: gray;">${activityRemark.createtime} 由${activityRemark.createby}</small>
                    <div style="position: relative; left: 500px; top: -30px; height: 30px; width: 100px; display: none;">
                        <a class="myHref" onclick="editActivityRemark('${activityRemark.id}')" data-toggle="modal"
                           href="javascript:void(0);"><span class="glyphicon glyphicon-edit"
                                                            style="font-size: 20px; color: #E6E6E6;"></span></a>
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <a class="myHref" onclick="delActivityRemark('${activityRemark.id}')"
                           href="javascript:void(0);"><span class="glyphicon glyphicon-remove"
                                                            style="font-size: 20px; color: #E6E6E6;"></span></a>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
    <div id="remarkDiv" style="background-color: #E6E6E6; width: 870px; height: 90px;">
        <form role="form" style="position: relative;top: 10px; left: 10px;">
            <textarea id="remark" class="form-control" style="width: 850px; resize : none;" rows="2"
                      placeholder="添加备注..."></textarea>
            <p id="cancelAndSaveBtn" style="position: relative;left: 737px; top: 10px; display: none;">
                <button id="cancelBtn" type="button" class="btn btn-default">取消</button>
                <button type="button" onclick="createRemarkbeizhu()" class="btn btn-primary">保存
                </button>
            </p>
        </form>
    </div>
</div>

<div style="height: 200px;"></div>
<!-- 修改市场活动备注的模态窗口 -->
<div class="modal fade" id="editRemarkModal" role="dialog">
    <%-- 备注的id --%>
    <input type="hidden" id="remarkId">
    <div class="modal-dialog" role="document" style="width: 40%;">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">
                    <span aria-hidden="true">×</span>
                </button>
                <h4 class="modal-title" id="myModalLabel1">修改备注</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" role="form">
                    <div class="form-group">
                        <label for="edit-describe" class="col-sm-2 control-label">内容</label>
                        <div class="col-sm-10" style="width: 81%;">
                            <textarea class="form-control" rows="3" id="noteContent"></textarea>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="updateRemarkBtn">更新
                </button>
            </div>
        </div>
    </div>
</div>
</body>
</html>
<script>
    //添加备注信息
    function createRemarkbeizhu() {
        $.ajax({
            url: '${pageContext.request.contextPath}/createRemarkbeizhu',
            data: {
                'activityid': '${activity.id}',
                'notecontent': $('#remark').val()
            },
            type: 'get',
            dataType: 'json',
            success: function (data) {
                if (data.ok) {
                    alert(data.mess);
                    $('#before').before("<div id=\"div"+data.t.id+"\" class=\"remarkDiv\" style=\"height: 60px;\">\n" +
                        "                <img title=\"zhangsan\" src=\"${pageContext.request.contextPath}/image/user-thumbnail.png\"\n" +
                        "                     style=\"width: 30px; height:30px;\">\n" +
                        "                <div style=\"position: relative; top: -40px; left: 40px;\">\n" +
                        "                    <h5 id=\"h5"+data.t.id+"\">"+data.t.notecontent+ "</h5>\n" +
                        "                    <font color=\"gray\">市场活动</font> <font color=\"gray\">-</font> <b>${activity.name}</b>\n" +
                        "                    <small style=\"color: gray;\">"+data.t.createTime+" 由"+data.t.createby+"</small>\n" +
                        "                    <div style=\"position: relative; left: 500px; top: -30px; height: 30px; width: 100px; display: none;\">\n" +
                        "                        <a class=\"myHref\" onclick=\"editActivityRemark('"+data.t.id+"')\" data-target='#editRemarkModal' data-toggle=\"modal\"\n" +
                        "                           href=\"javascript:void(0);\"><span class=\"glyphicon glyphicon-edit\"\n" +
                        "                                                            style=\"font-size: 20px; color: #E6E6E6;\"></span></a>\n" +
                        "                        &nbsp;&nbsp;&nbsp;&nbsp;\n" +
                        "                        <a class=\"myHref\" onclick=\"delActivityRemark('"+data.t.id+"')\"\n" +
                        "                           href=\"javascript:void(0);\"><span class=\"glyphicon glyphicon-remove\"\n" +
                        "                                                            style=\"font-size: 20px; color: #E6E6E6;\"></span></a>\n" +
                        "                    </div>\n" +
                        "                </div>\n" +
                        "            </div>")
                    $('#remark').val("");
                    // $(".remarkDiv").mouseover(function () {
                    //     $(this).children("div").children("div").show();
                    // });
                    //
                    // $(".remarkDiv").mouseout(function () {
                    //     $(this).children("div").children("div").hide();
                    // });
                    //
                    // $(".myHref").mouseover(function () {
                    //     $(this).children("span").css("color", "red");
                    // });
                    //
                    // $(".myHref").mouseout(function () {
                    //     $(this).children("span").css("color", "#E6E6E6");
                    // });
                } else {
                    alert(data.mess);
                }

            }
        });
    }

    //点击保存，保存修改备注信息
    $('#updateRemarkBtn').click(function () {
        $.ajax({
            url: '${pageContext.request.contextPath}/editRemarkbeizhu',
            data: {
                'id': $('#remarkId').val(),
                'notecontent': $('#noteContent').val()
            },
            type: 'get',
            dataType: 'json',
            success: function (data) {
                if (data.ok) {
                    alert(data.mess);
                    //及时修改页面备注的内容
                    // alert('#h5' + data.t.id)
                    $('#h5' + data.t.id).html(data.t.notecontent);
                } else {
                    alert(data.mess);
                }
                //关闭模态窗口
                $('#editRemarkModal').modal('hide');
            }
        });
    })


    //修改备注，点击跳出模态框
    function editActivityRemark(id) {
        $('#remarkId').val(id);
        $.ajax({
            url: '${pageContext.request.contextPath}/queryByRemarkId',
            data: {'id': id},
            type: 'get',
            dataType: 'json',
            success: function (data) {
                $('#noteContent').val(data.notecontent)
                $('#editRemarkModal').modal('show')

            }
        });
    }

    //点击删除字体把id传到后台进行删除备注
    function delActivityRemark(id) {
        $.ajax({
            url: '${pageContext.request.contextPath}/delActivityBeizhu',
            data: {'id': id},
            type: 'get',
            dataType: 'json',
            success: function (data) {
                if (data.ok) {
                    alert(data.mess);
                    $('#div'+id).remove();
                } else {
                    alert(data.mess);
                }
            }
        });
    }

    function editBtn(id) {
        $.ajax({
            url: '${pageContext.request.contextPath}/queryById',
            data: {
                'id': id
            },
            type: 'get',
            dataType: 'json',
            success: function (data) {
                var owner = data.owner;
                //异步请求所有者信息
                $.ajax({
                    url: '${pageContext.request.contextPath}/queryAll',
                    type: 'get',
                    dataType: 'json',
                    success: function (data) {
                        $('#edit-marketActivityOwner').html("");
                        for (var i = 0; i < data.length; i++) {
                            $('#edit-marketActivityOwner').append("<option value=" + data[i].id + ">" + data[i].name + "</option>")
                        }
                        $('#edit-marketActivityOwner option').each(function () {
                            //每个option的value:用户的id号
                            var userId = $(this).val();
                            if (userId == owner) {
                                $(this).prop('selected', true);
                            }
                        })
                    }
                });
                //完善其他信息
                $('#edit-marketActivityName').val(data.name);
                $('#edit-startTime').val(data.startDate);
                $('#edit-endTime').val(data.endDate);
                $('#edit-cost').val(data.cost);
                $('#edit-describe').val(data.description);

                //把市场活动的id号设置到隐藏域中
                $('#activityId').val(data.id);


            }
        });
    }

    //点击更新按钮 提交更新市场模态框
    function editActivityBtn() {
        $.ajax({
            url: '${pageContext.request.contextPath}/createOrUpdateActivity',
            data: {
                'id': $('#activityId').val(),
                'owner': $('#edit-marketActivityOwner').val(),
                'name': $('#edit-marketActivityName').val(),
                'startDate': $('#edit-startTime').val(),
                'endDate': $('#edit-endTime').val(),
                'cost': $('#edit-cost').val(),
                'description': $('#edit-describe').val()
            },
            type: 'get',
            dataType: 'json',
            success: function (data) {
                if (data.ok) {
                    alert(data.mess)
                    $("#testId").text($('#edit-describe').val())
                } else {
                    alert(data.mess)
                }
                //隐藏模态窗口
                $('#editActivityModal').modal('hide');

            }
        });
    }


</script>