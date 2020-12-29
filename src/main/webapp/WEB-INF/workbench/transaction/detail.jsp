<%@ taglib prefix="cc" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">

    <link href="${pageContext.request.contextPath}/jquery/bootstrap_3.3.0/css/bootstrap.min.css" type="text/css"
          rel="stylesheet"/>

    <style type="text/css">
        .mystage {
            font-size: 20px;
            vertical-align: middle;
            cursor: pointer;
        }

        .closingDate {
            font-size: 15px;
            cursor: pointer;
            vertical-align: middle;
        }
    </style>

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

            $(".remarkDiv").mouseover(function () {
                $(this).children("div").children("div").show();
            });

            $(".remarkDiv").mouseout(function () {
                $(this).children("div").children("div").hide();
            });

            $(".myHref").mouseover(function () {
                $(this).children("span").css("color", "red");
            });

            $(".myHref").mouseout(function () {
                $(this).children("span").css("color", "#E6E6E6");
            });


            //阶段提示框
            $(".mystage").popover({
                trigger: 'manual',
                placement: 'bottom',
                html: 'true',
                animation: false
            }).on("mouseenter", function () {
                var _this = this;
                $(this).popover("show");
                $(this).siblings(".popover").on("mouseleave", function () {
                    $(_this).popover('hide');
                });
            }).on("mouseleave", function () {
                var _this = this;
                setTimeout(function () {
                    if (!$(".popover:hover").length) {
                        $(_this).popover("hide")
                    }
                }, 100);
            });
        });


    </script>

</head>
<body>

<!-- 返回按钮 -->
<div style="position: relative; top: 35px; left: 10px;">
    <a href="javascript:void(0);" onclick="window.history.back();"><span class="glyphicon glyphicon-arrow-left"
                                                                         style="font-size: 20px; color: #DDDDDD"></span></a>
</div>

<!-- 大标题 -->
<div style="position: relative; left: 40px; top: -30px;">
    <div class="page-header">
        <h3>动力节点-交易01
            <small>￥5,000</small>
        </h3>
    </div>
    <div style="position: relative; height: 50px; width: 250px;  top: -72px; left: 700px;">
        <button type="button" class="btn btn-default" onclick="window.location.href='edit.jsp';"><span
                class="glyphicon glyphicon-edit"></span> 编辑
        </button>
        <button type="button" class="btn btn-danger"><span class="glyphicon glyphicon-minus"></span> 删除</button>
    </div>
</div>

<!-- 阶段状态 -->
<div id="stages" style="position: relative; left: 40px; top: -50px;">
    阶段&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

</div>

<!-- 详细信息 -->
<div style="position: relative; top: 0px;">
    <div style="position: relative; left: 40px; height: 30px;">
        <div style="width: 300px; color: gray;">所有者</div>
        <div style="width: 300px;position: relative; left: 200px; top: -20px;"><b>${tran.owner}</b></div>
        <div style="width: 300px;position: relative; left: 450px; top: -40px; color: gray;">金额</div>
        <div style="width: 300px;position: relative; left: 650px; top: -60px;"><b>${tran.money}</b></div>
        <div style="height: 1px; width: 400px; background: #D5D5D5; position: relative; top: -60px;"></div>
        <div style="height: 1px; width: 400px; background: #D5D5D5; position: relative; top: -60px; left: 450px;"></div>
    </div>
    <div style="position: relative; left: 40px; height: 30px; top: 10px;">
        <div style="width: 300px; color: gray;">名称</div>
        <div style="width: 300px;position: relative; left: 200px; top: -20px;"><b>${tran.name}</b></div>
        <div style="width: 300px;position: relative; left: 450px; top: -40px; color: gray;">预计成交日期</div>
        <div style="width: 300px;position: relative; left: 650px; top: -60px;"><b>${tran.expecteddate}</b></div>
        <div style="height: 1px; width: 400px; background: #D5D5D5; position: relative; top: -60px;"></div>
        <div style="height: 1px; width: 400px; background: #D5D5D5; position: relative; top: -60px; left: 450px;"></div>
    </div>
    <div style="position: relative; left: 40px; height: 30px; top: 20px;">
        <div style="width: 300px; color: gray;">客户名称</div>
        <div style="width: 300px;position: relative; left: 200px; top: -20px;"><b>${tran.customerid}</b></div>
        <div style="width: 300px;position: relative; left: 450px; top: -40px; color: gray;">阶段</div>
        <div style="width: 300px;position: relative; left: 650px; top: -60px;" ><b id="stageB">${tran.stage}</b></div>
        <div style="height: 1px; width: 400px; background: #D5D5D5; position: relative; top: -60px;"></div>
        <div style="height: 1px; width: 400px; background: #D5D5D5; position: relative; top: -60px; left: 450px;"></div>
    </div>
    <div style="position: relative; left: 40px; height: 30px; top: 30px;">
        <div style="width: 300px; color: gray;">类型</div>
        <div style="width: 300px;position: relative; left: 200px; top: -20px;"><b>${tran.type}</b></div>
        <div style="width: 300px;position: relative; left: 450px; top: -40px; color: gray;">可能性</div>
        <div style="width: 300px;position: relative; left: 650px; top: -60px;" ><b id="posibilityB">${tran.possibitility}</b></div>
        <div style="height: 1px; width: 400px; background: #D5D5D5; position: relative; top: -60px;"></div>
        <div style="height: 1px; width: 400px; background: #D5D5D5; position: relative; top: -60px; left: 450px;"></div>
    </div>
    <div style="position: relative; left: 40px; height: 30px; top: 40px;">
        <div style="width: 300px; color: gray;">来源</div>
        <div style="width: 300px;position: relative; left: 200px; top: -20px;"><b>${tran.source}</b></div>
        <div style="width: 300px;position: relative; left: 450px; top: -40px; color: gray;">市场活动源</div>
        <div style="width: 300px;position: relative; left: 650px; top: -60px;"><b>${tran.activityid}</b></div>
        <div style="height: 1px; width: 400px; background: #D5D5D5; position: relative; top: -60px;"></div>
        <div style="height: 1px; width: 400px; background: #D5D5D5; position: relative; top: -60px; left: 450px;"></div>
    </div>
    <div style="position: relative; left: 40px; height: 30px; top: 50px;">
        <div style="width: 300px; color: gray;">联系人名称</div>
        <div style="width: 500px;position: relative; left: 200px; top: -20px;"><b>${tran.contactsid}</b></div>
        <div style="height: 1px; width: 550px; background: #D5D5D5; position: relative; top: -20px;"></div>
    </div>
    <div style="position: relative; left: 40px; height: 30px; top: 60px;">
        <div style="width: 300px; color: gray;">创建者</div>
        <div style="width: 500px;position: relative; left: 200px; top: -20px;"><b>${tran.createby}&nbsp;&nbsp;</b>
            <small style="font-size: 10px; color: gray;">${tran.createtime}</small>
        </div>
        <div style="height: 1px; width: 550px; background: #D5D5D5; position: relative; top: -20px;"></div>
    </div>
    <div style="position: relative; left: 40px; height: 30px; top: 70px;">
        <div style="width: 300px; color: gray;">修改者</div>
        <div style="width: 500px;position: relative; left: 200px; top: -20px;"><b id="editByB">${tran.editby}&nbsp;&nbsp;</b>
            <small style="font-size: 10px; color: gray;" id="editTimeS">${tran.edittime}</small>
        </div>
        <div style="height: 1px; width: 550px; background: #D5D5D5; position: relative; top: -20px;"></div>
    </div>
    <div style="position: relative; left: 40px; height: 30px; top: 80px;">
        <div style="width: 300px; color: gray;">描述</div>
        <div style="width: 630px;position: relative; left: 200px; top: -20px;">
            <b>
                ${tran.description}
            </b>
        </div>
        <div style="height: 1px; width: 850px; background: #D5D5D5; position: relative; top: -20px;"></div>
    </div>
    <div style="position: relative; left: 40px; height: 30px; top: 90px;">
        <div style="width: 300px; color: gray;">联系纪要</div>
        <div style="width: 630px;position: relative; left: 200px; top: -20px;">
            <b>
                ${tran.contactsummary}
            </b>
        </div>
        <div style="height: 1px; width: 850px; background: #D5D5D5; position: relative; top: -20px;"></div>
    </div>
    <div style="position: relative; left: 40px; height: 30px; top: 100px;">
        <div style="width: 300px; color: gray;">下次联系时间</div>
        <div style="width: 500px;position: relative; left: 200px; top: -20px;"><b>${tran.nextcontacttime}</b></div>
        <div style="height: 1px; width: 400px; background: #D5D5D5; position: relative; top: -20px;"></div>
    </div>
</div>

<!-- 备注 -->
<div style="position: relative; top: 100px; left: 40px;">
    <div class="page-header">
        <h4>备注</h4>
    </div>
    <c:forEach items="${tran.tranRemarks}" var="transactionRemark">
        <div class="remarkDiv" style="height: 60px;">
            <img title="zhangsan" src="/crm/image/user-thumbnail.png" style="width: 30px; height:30px;">
            <div style="position: relative; top: -40px; left: 40px;">
                <h5>${transactionRemark.notecontent}</h5>
                <font color="gray">交易</font> <font color="gray">-</font> <b>${tran.name}</b>
                <small style="color: gray;"> ${tran.createtime} 由${tran.owner}</small>
                <div style="position: relative; left: 500px; top: -30px; height: 30px; width: 100px; display: none;">
                    <a class="myHref" href="javascript:void(0);"><span class="glyphicon glyphicon-edit"
                                                                       style="font-size: 20px; color: #E6E6E6;"></span></a>
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    <a class="myHref" href="javascript:void(0);"><span class="glyphicon glyphicon-remove"
                                                                       style="font-size: 20px; color: #E6E6E6;"></span></a>
                </div>
            </div>
        </div>
    </c:forEach>
    <div id="remarkDiv" style="background-color: #E6E6E6; width: 870px; height: 90px;">
        <form role="form" style="position: relative;top: 10px; left: 10px;">
            <textarea id="remark" class="form-control" style="width: 850px; resize : none;" rows="2"
                      placeholder="添加备注..."></textarea>
            <p id="cancelAndSaveBtn" style="position: relative;left: 737px; top: 10px; display: none;">
                <button id="cancelBtn" type="button" class="btn btn-default">取消</button>
                <button type="button" class="btn btn-primary">保存</button>
            </p>
        </form>
    </div>
</div>

<!-- 阶段历史 -->
<div>
    <div style="position: relative; top: 100px; left: 40px;">
        <div class="page-header">
            <h4>阶段历史</h4>
        </div>
        <div style="position: relative;top: 0px;">
            <table id="activityTable" class="table table-hover" style="width: 900px;">
                <thead>
                <tr style="color: #B3B3B3;">
                    <td>阶段</td>
                    <td>金额</td>
                    <td>可能性</td>
                    <td>预计成交日期</td>
                    <td>创建时间</td>
                    <td>创建人</td>
                </tr>
                </thead>
                <tbody id="transactionHistoryBody">
                <c:forEach var="tranHistory" items="${tran.tranHistories}">
                    <tr>
                        <td>${tranHistory.stage}</td>
                        <td>${tranHistory.money}</td>
                        <td>${tranHistory.possibility}</td>
                        <td>${tranHistory.expecteddate}</td>
                        <td>${tranHistory.createtime}</td>
                        <td>${tranHistory.createby}</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>

    </div>
</div>

<div style="height: 200px;"></div>
</body>
</html>


<script>
    //改变交易阶段
    function changeStage(data) {
        $('#stages').html("");
        var content = "阶段&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;";
        for (var i = 0; i < data.length; i++) {
            if (data[i].type == "绿圈") {
                content += "<span index=" + data[i].index + " class=\"glyphicon glyphicon-ok-circle mystage\" data-toggle=\"popover\" data-placement=\"bottom\" data-content=\"" + data[i].stage + "\ " + data[i].posibility + "\" style=\"color: #90F790;\"></span>"
            } else if (data[i].type == "锚点") {
                content += "<span index=" + data[i].index + " class=\"glyphicon glyphicon-map-marker mystage\" data-toggle=\"popover\" data-placement=\"bottom\" data-content=\"" + data[i].stage + "\ " + data[i].posibility + "\" style=\"color: #90F790;\"></span>";
            } else if (data[i].type == "黑圈") {
                content += "<span index=" + data[i].index + " class=\"glyphicon glyphicon-record mystage\" data-toggle=\"popover\" data-placement=\"bottom\" data-content=\"" + data[i].stage + "\ " + data[i].posibility + "\"></span>";
            } else if (data[i].type == "黑x") {
                content += "<span index=" + data[i].index + " class=\"glyphicon glyphicon glyphicon-remove mystage\" data-toggle=\"popover\" data-placement=\"bottom\" data-content=\"" + data[i].stage + "\ " + data[i].posibility + "\"></span>";
            } else if (data[i].type == "红x") {
                content += "<span index=" + data[i].index + " class=\"glyphicon glyphicon glyphicon-remove mystage\" data-toggle=\"popover\" data-placement=\"bottom\" data-content=\"" + data[i].stage + "\ " + data[i].posibility + "\" style=\"color: red;\"></span>";
            }
            content += "-----------";
        }
        content += "<span class=\"closingDate\">${tran.expecteddate}</span>";
        $('#stages').html(content);

        //阶段提示框
        $(".mystage").popover({
            trigger: 'manual',
            placement: 'bottom',
            html: 'true',
            animation: false
        }).on("mouseenter", function () {
            var _this = this;
            $(this).popover("show");
            $(this).siblings(".popover").on("mouseleave", function () {
                $(_this).popover('hide');
            });
        }).on("mouseleave", function () {
            var _this = this;
            setTimeout(function () {
                if (!$(".popover:hover").length) {
                    $(_this).popover("hide")
                }
            }, 100);
        });
    }

    //异步查询当前交易的交易阶段图标
    $.ajax({
        url: '${pageContext.request.contextPath}/transaction/queryStage',
        data: {
            'id': '${tran.id}'
        },
        type: 'post',
        dataType: 'json',
        success: function (data) {
            changeStage(data);
        }
    });

    //把每个阶段的图标的点击事件委托到父元素$('#stages')中，动态生成的js失效
    $('#stages').on('click', 'span', function () {
        //attr:处理自定义属性 prop:固有属性
        //发送点击交易图标修改交易阶段的请求
        $.ajax({
            url: '${pageContext.request.contextPath}/transaction/queryStage',
            data: {
                'index': $(this).attr('index'),
                'id': '${tran.id}'
            },
            type: 'get',
            dataType: 'json',
            success: function (data) {
                changeStage(data);
                //修改当前页面的其他信息
                $('#stageB').text(data[0].tran.stage);
                $('#posibilityB').text(data[0].tran.possibitility);
                $('#editByB').text(data[0].tran.editby);
                $('#editTimeS').text(data[0].tran.editbime);

                //更新交易历史信息
                $('#transactionHistoryBody').html("");
                var transactionHistories = data[0].tranHistories;
                for (var i = 0; i < transactionHistories.length; i++) {
                    $('#transactionHistoryBody').append("<tr>\n" +
                        "\t\t\t\t\t\t\t\t<td>" + transactionHistories[i].stage + "</td>\n" +
                        "\t\t\t\t\t\t\t\t<td>" + transactionHistories[i].money + "</td>\n" +
                        "\t\t\t\t\t\t\t\t<td>" + transactionHistories[i].possibility + "</td>\n" +
                        "\t\t\t\t\t\t\t\t<td>" + transactionHistories[i].expecteddate + "</td>\n" +
                        "\t\t\t\t\t\t\t\t<td>" + transactionHistories[i].createtime + "</td>\n" +
                        "\t\t\t\t\t\t\t\t<td>" + transactionHistories[i].createby + "</td>\n" +
                        "\t\t\t\t\t\t\t</tr>");
                }
            }
        });
    });
</script>