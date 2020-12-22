<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">

    <link href="${pageContext.request.contextPath}/jquery/bootstrap_3.3.0/css/bootstrap.min.css" type="text/css"
          rel="stylesheet"/>
    <link href="${pageContext.request.contextPath}/jquery/bootstrap-datetimepicker-master/css/bootstrap-datetimepicker.min.css"
          type="text/css" rel="stylesheet"/>
    <link href="${pageContext.request.contextPath}/jquery/bs_pagination/jquery.bs_pagination.min.css" type="text/css"
          rel="stylesheet"/>
    <link href="${pageContext.request.contextPath}/jquery/bootstrap-datetimepicker-master/css/bootstrap-datetimepicker.min.css"
          type="text/css" rel="stylesheet"/>

    <script type="text/javascript" src="${pageContext.request.contextPath}/jquery/jquery-1.11.1-min.js"></script>
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/jquery/bootstrap_3.3.0/js/bootstrap.min.js"></script>
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/jquery/bootstrap-datetimepicker-master/locale/bootstrap-datetimepicker.zh-CN.js"></script>
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/jquery/bootstrap-datetimepicker-master/js/bootstrap-datetimepicker.js"></script>
    <%--分页插件--%>
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/jquery/bs_pagination/jquery.bs_pagination.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/jquery/bs_pagination/en.js"></script>

    <script type="text/javascript">

        $(function () {


        });

    </script>
</head>
<body>

<!-- 创建市场活动的模态窗口 -->
<div class="modal fade" id="createActivityModal" role="dialog">
    <div class="modal-dialog" role="document" style="width: 85%;">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">
                    <span aria-hidden="true">×</span>
                </button>
                <h4 class="modal-title" id="myModalLabel1">创建市场活动</h4>
            </div>
            <div class="modal-body">

                <form class="form-horizontal" role="form" id="createActivityForm">

                    <div class="form-group">
                        <label for="create-marketActivityOwner" class="col-sm-2 control-label">所有者<span
                                style="font-size: 15px; color: red;">*</span></label>
                        <div class="col-sm-10" style="width: 300px;">
                            <select class="form-control" id="create-marketActivityOwner">
                            </select>
                        </div>
                        <label for="create-marketActivityName" class="col-sm-2 control-label">名称<span
                                style="font-size: 15px; color: red;">*</span></label>
                        <div class="col-sm-10" style="width: 300px;">
                            <input type="text" class="form-control" id="create-marketActivityName">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="create-startTime" class="col-sm-2 control-label">开始日期</label>
                        <div class="col-sm-10" style="width: 300px;">
                            <input type="text" class="form-control" id="create-startTime">
                        </div>
                        <label for="create-endTime" class="col-sm-2 control-label">结束日期</label>
                        <div class="col-sm-10" style="width: 300px;">
                            <input type="text" class="form-control" id="create-endTime">
                        </div>
                    </div>
                    <div class="form-group">

                        <label for="create-cost" class="col-sm-2 control-label">成本</label>
                        <div class="col-sm-10" style="width: 300px;">
                            <input type="text" class="form-control" id="create-cost">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="create-describe" class="col-sm-2 control-label">描述</label>
                        <div class="col-sm-10" style="width: 81%;">
                            <textarea class="form-control" rows="3" id="create-describe"></textarea>
                        </div>
                    </div>

                </form>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" onclick="createAndSaveActivity()" class="btn btn-primary" data-dismiss="modal">
                    保存
                </button>
            </div>
        </div>
    </div>
</div>

<!-- 修改市场活动的模态窗口 -->
<div class="modal fade" id="editActivityModal" role="dialog">
    <div class="modal-dialog" role="document" style="width: 85%;">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">
                    <span aria-hidden="true">×</span>
                </button>
                <h4 class="modal-title" id="myModalLabel2">修改市场活动</h4>
            </div>
            <div class="modal-body">

                <form class="form-horizontal" role="form" id="editActivityForm">

                    <input type="hidden" id="activityId">
                    <div class="form-group">
                        <label for="edit-marketActivityOwner" class="col-sm-2 control-label">所有者<span
                                style="font-size: 15px; color: red;">*</span></label>
                        <div class="col-sm-10" style="width: 300px;">
                            <select class="form-control" id="edit-marketActivityOwner">

                            </select>
                        </div>
                        <label for="edit-marketActivityName" class="col-sm-2 control-label">名称<span
                                style="font-size: 15px; color: red;">*</span></label>
                        <div class="col-sm-10" style="width: 300px;">
                            <input type="text" class="form-control" id="edit-marketActivityName" value="发传单">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="edit-startTime" class="col-sm-2 control-label">开始日期</label>
                        <div class="col-sm-10" style="width: 300px;">
                            <input type="text" class="form-control" id="edit-startTime" value="2020-10-10">
                        </div>
                        <label for="edit-endTime" class="col-sm-2 control-label">结束日期</label>
                        <div class="col-sm-10" style="width: 300px;">
                            <input type="text" class="form-control" id="edit-endTime" value="2020-10-20">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="edit-cost" class="col-sm-2 control-label">成本</label>
                        <div class="col-sm-10" style="width: 300px;">
                            <input type="text" class="form-control" id="edit-cost" value="5,000">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="edit-describe" class="col-sm-2 control-label">描述</label>
                        <div class="col-sm-10" style="width: 81%;">
                            <textarea class="form-control" rows="3" id="edit-describe">市场活动Marketing，是指品牌主办或参与的展览会议与公关市场活动，包括自行主办的各类研讨会、客户交流会、演示会、新产品发布会、体验会、答谢会、年会和出席参加并布展或演讲的展览会、研讨会、行业交流会、颁奖典礼等</textarea>
                        </div>
                    </div>

                </form>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button onclick="editActivityBtn()" type="button" class="btn btn-primary" data-dismiss="modal">更新
                </button>
            </div>
        </div>
    </div>
</div>


<div>
    <div style="position: relative; left: 10px; top: -10px;">
        <div class="page-header">
            <h3>市场活动列表</h3>
        </div>
    </div>
</div>
<div style="position: relative; top: -20px; left: 0px; width: 100%; height: 100%;">
    <div style="width: 100%; position: absolute;top: 5px; left: 10px;">

        <div class="btn-toolbar" role="toolbar" style="height: 80px;">
            <form class="form-inline" role="form" style="position: relative;top: 8%; left: 5px;">

                <div class="form-group">
                    <div class="input-group">
                        <div class="input-group-addon">名称</div>
                        <input class="form-control" type="text" name="name">
                    </div>
                </div>

                <div class="form-group">
                    <div class="input-group">
                        <div class="input-group-addon">所有者</div>
                        <input class="form-control" type="text" name="owner">
                    </div>
                </div>


                <div class="form-group">
                    <div class="input-group">
                        <div class="input-group-addon">开始日期</div>
                        <input class="form-control" type="text" id="startTime"/>
                    </div>
                </div>
                <div class="form-group">
                    <div class="input-group">
                        <div class="input-group-addon">结束日期</div>
                        <input class="form-control" type="text" id="endTime">
                    </div>
                </div>

                <button type="button" id="activityQueryBtn" class="btn btn-default">查询</button>

            </form>
        </div>
        <div class="btn-toolbar" role="toolbar"
             style="background-color: #F7F7F7; height: 50px; position: relative;top: 5px;">
            <div class="btn-group" style="position: relative; top: 18%;">
                <button onclick="queryAllUser()" type="button" class="btn btn-primary" data-toggle="modal"
                        data-target="#createActivityModal">
                    <span class="glyphicon glyphicon-plus"></span> 创建
                </button>
                <button onclick="editActivitybutton()" type="button" class="btn btn-default" data-toggle="modal"><span
                        class="glyphicon glyphicon-pencil"></span> 修改
                </button>
                <button type="button" onclick="delBatch()" class="btn btn-danger"><span
                        class="glyphicon glyphicon-minus"></span> 删除
                </button>
            </div>

        </div>
        <div style="position: relative;top: 10px;">
            <table class="table table-hover">
                <thead>
                <form>
                    <tr style="color: #B3B3B3;">
                        <td><input class="chooseAll" type="checkbox"/></td>
                        <td>名称</td>
                        <td>所有者</td>
                        <td>开始日期</td>
                        <td>结束日期</td>
                    </tr>
                </form>
                </thead>
                <tbody id="activityBody">

                </tbody>
            </table>
        </div>

        <%--分页插件--%>
        <div style="height: 50px; position: relative;top: 30px;">
            <div id="activityPage"></div>
        </div>

    </div>

</div>
</body>
</html>
<script>

    //点击删除按钮删除数据
    function delBatch() {
        var cids = [];
        if ($('[name="ids"]:checked').length > 0) {
            if (confirm("你确定删除吗？")) {
                $('[name="ids"]:checked').each(function () {
                        cids.push($(this).val())
                });
                $.ajax({
                    url: '${pageContext.request.contextPath}/delBatch',
                    data: {'id':cids.join("-") },
                    type: 'get',
                    dataType: 'json',
                    success: function (data) {
                        if (data.ok) {
                            alert(data.mess);
                        } else {
                            alert(data.mess);
                        }
                        //刷新数据
                        refresh(1, 3);
                    }
                });

            }
        } else {
            alert("你他妈倒是选一个啊！！！")
        }
    }

    //点击修改按钮，js判断选取个数
    function editActivitybutton() {
        var length = $('input[class=son]:checked').length
        if (length == 0) {
            alert("你他妈倒是选一条啊")
            return;
        } else if (length > 1) {
            alert("选他妈这么多条，你是想起飞啊！")
        } else {
            $('#editActivityModal').modal('show');
            var id = $('input[class=son]:checked')[0].value;
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

                } else {
                    alert(data.mess)
                }
                //隐藏模态窗口
                $('#editActivityModal').modal('hide');
                //重置表单reset
                document.getElementById('editActivityForm').reset();
                refresh(1, 3)
            }
        });
    }


    //点击新建按钮，异步查询
    function queryAllUser() {
        $.ajax({
            url: '${pageContext.request.contextPath}/queryAll',
            type: 'get',
            dataType: 'json',
            success: function (data) {
                for (var i = 0; i < data.length; i++) {
                    $('#create-marketActivityOwner').append("<option value=" + data[i].id + ">" + data[i].name + "</option>")
                }
            }
        });
    }

    //异步提交创建市场模态框
    function createAndSaveActivity() {
        $.ajax({
            url: '${pageContext.request.contextPath}/createOrUpdateActivity',
            data: {
                'owner': $('#create-marketActivityOwner').val(),
                'name': $('#create-marketActivityName').val(),
                'startDate': $('#create-startTime').val(),
                'endDate': $('#create-endTime').val(),
                'cost': $('#create-cost').val(),
                'description': $('#create-describe').val()
            },
            type: 'get',
            dataType: 'json',
            success: function (data) {
                if (data.ok) {
                    alert(data.mess)

                } else {
                    alert(data.mess)
                }
                //隐藏模态窗口
                $('#createActivityModal').modal('hide');
                //重置表单reset
                document.getElementById('createActivityForm').reset();
                refresh(1, 3)
            }
        });
    }


    //点击查询按钮，查询数据
    $('#activityQueryBtn').click(function () {
        refresh(1, 3);
    });

    //第一次进入到列表页面，要查询第一页数据
    refresh(1, 3);

    //刷新页面的方法
    function refresh(page, pageSize) {
        //异步查询所有市场活动信息
        $.ajax({
            url: '${pageContext.request.contextPath}/workbench/activity/list',
            data: {
                'page': page,
                'pageSize': pageSize,
                'name': $('input[name=name]').val(),
                'owner': $('input[name=owner]').val(),
                'startDate': $('#startTime').val(),
                'endDate': $('#endTime').val()
            },
            type: 'get',
            dataType: 'json',
            success: function (data) {//data:resultVo
                //清空上一次的动态拼接的内容
                $('#activityBody').html("");
                var dataList = data.pageInfo.list;
                for (var i = 0; i < dataList.length; i++) {
                    $('#activityBody').append("<tr class='active'>\n" +
                        "\t\t\t\t\t\t\t<td><input type=\"checkbox\" name=ids class='son' value=" + dataList[i].id + " /></td>\n" +
                        "\t\t\t\t\t\t\t<td><a style=\"text-decoration: none; cursor: pointer;\" onclick=\"window.location.href='${pageContext.request.contextPath}/toDetail?id="+dataList[i].id+"';\"> " + dataList[i].name + "</a></td>\n" +
                        "                            <td>" + dataList[i].owner + "</td>\n" +
                        "\t\t\t\t\t\t\t<td>" + dataList[i].startDate + "</td>\n" +
                        "\t\t\t\t\t\t\t<td>" + dataList[i].endDate + "</td>\n" +
                        "\t\t\t\t\t\t</tr>");
                }

                //利用分页插件查询第一页数据
                $("#activityPage").bs_pagination({
                    currentPage: data.pageInfo.pageNum, // 当前页码
                    rowsPerPage: data.pageInfo.pageSize, // 每页显示的记录条数
                    totalPages: data.pageInfo.pages, // 总页数
                    totalRows: data.pageInfo.total, // 总记录条数
                    visiblePageLinks: 5, // 显示几个卡片
                    showGoToPage: true,
                    showRowsPerPage: true,
                    showRowsInfo: true,
                    showRowsDefaultInfo: true,
                    //回调函数，用户每次点击分页插件进行翻页的时候就会触发该函数
                    onChangePage: function (event, obj) {
                        //console.log(obj);
                        //alert(obj.currentPage);
                        //刷新页面，obj.currentPage:当前点击的页码
                        refresh(obj.currentPage, obj.rowsPerPage);
                    }
                });
            }
        });
    }

    //条件查询日历插件
    //开始时间
    $("#startTime").datetimepicker({
        language: "zh-CN",
        format: "yyyy-mm-dd",//显示格式
        minView: "month",//设置只显示到月份
        initialDate: new Date(),//初始化当前日期
        autoclose: true,//选中自动关闭
        todayBtn: true, //显示今日按钮
        clearBtn: true,
        pickerPosition: "bottom-left"
    });

    //结束时间
    $("#endTime").datetimepicker({
        language: "zh-CN",
        format: "yyyy-mm-dd",//显示格式
        minView: "month",//设置只显示到月份
        initialDate: new Date(),//初始化当前日期
        autoclose: true,//选中自动关闭
        todayBtn: true, //显示今日按钮
        clearBtn: true,
        pickerPosition: "bottom-left"
    });
    //创建市场活动模态窗口的日历插件
    $("#create-startTime").datetimepicker({
        language: "zh-CN",
        format: "yyyy-mm-dd",//显示格式
        minView: "month",//设置只显示到月份
        initialDate: new Date(),//初始化当前日期
        autoclose: true,//选中自动关闭
        todayBtn: true, //显示今日按钮
        clearBtn: true,
        pickerPosition: "bottom-left"
    });

    //结束时间
    $("#create-endTime").datetimepicker({
        language: "zh-CN",
        format: "yyyy-mm-dd",//显示格式
        minView: "month",//设置只显示到月份
        initialDate: new Date(),//初始化当前日期
        autoclose: true,//选中自动关闭
        todayBtn: true, //显示今日按钮
        clearBtn: true,
        pickerPosition: "bottom-left"
    });

</script>