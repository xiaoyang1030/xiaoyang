<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link href="${pageContext.request.contextPath}/jquery/bootstrap_3.3.0/css/bootstrap.min.css" type="text/css" rel="stylesheet" />
<script type="text/javascript" src="${pageContext.request.contextPath}/jquery/jquery-1.11.1-min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/jquery/bootstrap_3.3.0/js/bootstrap.min.js"></script>


<link href="jquery/bootstrap-datetimepicker-master/css/bootstrap-datetimepicker.min.css" type="text/css" rel="stylesheet" />
<script type="text/javascript" src="jquery/bootstrap-datetimepicker-master/js/bootstrap-datetimepicker.js"></script>
<script type="text/javascript" src="jquery/bootstrap-datetimepicker-master/locale/bootstrap-datetimepicker.zh-CN.js"></script>

<script type="text/javascript">
	$(function(){
		$("#isCreateTransaction").click(function(){
			if(this.checked){
				$("#create-transaction2").show(200);
			}else{
				$("#create-transaction2").hide(200);
			}
		});
	});
</script>

</head>
<body>
	
	<!-- 搜索市场活动的模态窗口 -->
	<div class="modal fade" id="searchActivityModal" role="dialog" >
		<div class="modal-dialog" role="document" style="width: 90%;">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">×</span>
					</button>
					<h4 class="modal-title">搜索市场活动</h4>
				</div>
				<div class="modal-body">
					<div class="btn-group" style="position: relative; top: 18%; left: 8px;">

						  <div class="form-group has-feedback">
						    <input type="text" id="searchActivity" class="form-control" style="width: 300px;" placeholder="请输入市场活动名称，支持模糊查询">
						    <span class="glyphicon glyphicon-search form-control-feedback"></span>
						  </div>
					</div>
					<table id="activityTable" class="table table-hover" style="width: 900px; position: relative;top: 10px;">
						<thead>
							<tr style="color: #B3B3B3;">
								<td></td>
								<td>名称</td>
								<td>开始日期</td>
								<td>结束日期</td>
								<td>所有者</td>
								<td></td>
							</tr>
						</thead>
						<tbody id="tbodyActivity">

						</tbody>
					</table>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
						<button type="button" onclick="bindguanxi()" class="btn btn-primary" data-dismiss="modal">关联</button>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div id="title" class="page-header" style="position: relative; left: 20px;">
		<h4>转换线索 <small>${clue.fullname}-${clue.company}</small></h4>
	</div>
	<div id="create-customer" style="position: relative; left: 40px; height: 35px;">
		新建客户：${clue.company}
	</div>
	<div id="create-contact" style="position: relative; left: 40px; height: 35px;">
		新建联系人：${clue.fullname}${clue.company}
	</div>
	<div id="create-transaction1" style="position: relative; left: 40px; height: 35px; top: 25px;">
		<input type="checkbox" id="isCreateTransaction"/>
		为客户创建交易
	</div>
	<div id="create-transaction2" style="position: relative; left: 40px; top: 20px; width: 80%; background-color: #F7F7F7; display: none;" >
	
		<form>
			<input type="hidden" id="isTran">
		  <div class="form-group" style="width: 400px; position: relative; left: 20px;">
		    <label for="amountOfMoney">金额</label>
		    <input type="text" class="form-control" id="amountOfMoney">
		  </div>
		  <div class="form-group" style="width: 400px;position: relative; left: 20px;">
		    <label for="tradeName">交易名称</label>
		    <input type="text" class="form-control" id="tradeName" >
		  </div>
		  <div class="form-group" style="width: 400px;position: relative; left: 20px;">
		    <label for="expectedClosingDate">预计成交日期</label>
		    <input type="text" class="form-control" id="expectedClosingDate">
		  </div>
		  <div class="form-group" style="width: 400px;position: relative; left: 20px;">
		    <label for="stage">阶段</label>
		    <select id="stage"  class="form-control">
		    	<option></option>
		    	<c:forEach items="${dictionaryMap.stage}" var="cluestate">
					<option value="${cluestate.value}">${cluestate.text}</option>
				</c:forEach>
		    </select>
		  </div>
		  <div class="form-group" style="width: 400px;position: relative; left: 20px;">
			  <input type="hidden" id="activityId">
		    <label for="activity">市场活动源&nbsp;&nbsp;<a href="javascript:void(0);" data-toggle="modal" data-target="#searchActivityModal" style="text-decoration: none;"><span class="glyphicon glyphicon-search"></span></a></label>
		    <input type="text" class="form-control" id="activity" placeholder="点击上面搜索" readonly>
		  </div>
		</form>
		
	</div>
	
	<div id="owner" style="position: relative; left: 40px; height: 35px; top: 50px;">
		记录的所有者：<br>
		<b>${clue.owner}</b>
	</div>
	<div id="operation" style="position: relative; left: 40px; height: 35px; top: 100px;">
		<input class="btn btn-primary" onclick="transfer()" type="button" value="转换">
		&nbsp;&nbsp;&nbsp;&nbsp;
		<input class="btn btn-default" type="button" value="取消">
	</div>
</body>
</html>
<script>
	
	function bindguanxi() {
		//获取勾中的市场活动
		//1把狗中的市场活动名称显示在页面上给用户看
		//2把勾中的市场活动主键放在隐藏域中
		$('#activityId').val($('.son:checked')[0].value)
		$('#activity').val($($('.son:checked')[0]).parent().next().text())
	}
	function transfer(){
		if($('input[id=isCreateTransaction]').prop('checked')){
			$('#isTran').val(1);
		}else{
			//不创建交易
			$('#isTran').val(0);
		}
		//发送线索转换请求
		$.ajax({
			url : '${pageContext.request.contextPath}/clue/transfer',
			data : {
				'isTran' : $('#isTran').val(),
				'money' : $('#amountOfMoney').val(),
				'name' : $('#tradeName').val(),
				'expecteddate' : $('#expectedClosingDate').val(),
				'stage' :  $('#stage').val(),
				'activityid' : $('#activityId').val(),
				'clueid' : '${clue.id}'
			},
			type : 'get',
			dataType : 'json',
			success : function(data){
				if(data.ok){
					alert(data.mess)
					location.href="${pageContext.request.contextPath}/toView/clue/index"
				}else {
					alert(data.mess)
				}
			}
		});
	}

	$('#searchActivity').keypress(function (event) {
		if (event.keyCode == 13) {
			$.ajax({
				url: '${pageContext.request.contextPath}/clue/seacrhBindActivity',
				data: {
					'name': $('#searchActivity').val(),
					'clueid': '${clue.id}'
				},
				type: 'post',
				dataType: 'json',
				success: function (data) {
					var dataList = data.list
					$('#tbodyActivity').html("")
					for (var i = 0; i < dataList.length; i++) {
						$('#tbodyActivity').append("<tr>\n" +
								"\t\t\t\t\t\t\t\t<td><input type=\"radio\" name=\"name\" class='son' value=\""+dataList[i].id+"\"> </td>\n" +
								"\t\t\t\t\t\t\t\t<td>" + dataList[i].name + "</td>\n" +
								"\t\t\t\t\t\t\t\t<td>" + dataList[i].startDate + "</td>\n" +
								"\t\t\t\t\t\t\t\t<td>" + dataList[i].endDate + "</td>\n" +
								"\t\t\t\t\t\t\t\t<td>" + dataList[i].owner + "</td>\n" +
								"\t\t\t\t\t\t\t</tr>")
					}
				}

			});

		}
	})

	$("#expectedClosingDate").datetimepicker({
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