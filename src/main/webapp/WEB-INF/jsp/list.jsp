<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>list</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<link
	href="https://cdn.bootcss.com/x-editable/1.5.1/bootstrap3-editable/css/bootstrap-editable.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
<script
	src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link
	href="https://cdn.bootcss.com/bootstrap-table/1.11.1/bootstrap-table.min.css"
	rel="stylesheet">
<script
	src="https://cdn.bootcss.com/bootstrap-table/1.11.1/bootstrap-table.min.js"></script>
<script
	src="https://cdn.bootcss.com/bootstrap-table/1.11.1/locale/bootstrap-table-zh-CN.min.js"></script>
<script
	src="https://cdn.bootcss.com/bootstrap-table/1.11.1/extensions/editable/bootstrap-table-editable.min.js"></script>
<script
	src="https://cdn.bootcss.com/x-editable/1.5.1/bootstrap3-editable/js/bootstrap-editable.js"></script>
<script type="text/javascript"
	src="https://cdn.bootcss.com/canvas-nest.js/1.0.1/canvas-nest.min.js"></script>
</head>
<body>
	<nav class="navbar navbar-inverse" role="navigation">
	<div class="container-fluid">
		<div class="navbar-header">
			<a class="navbar-brand" href="#">测试站点</a>
		</div>
		<div>
			<ul class="nav navbar-nav">
				<li class="active"><a href="#">链接1</a></li>
				<li><a href="#">链接2</a></li>
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown"> 链接3 <b class="caret"></b>
				</a>
					<ul class="dropdown-menu">
						<li><a href="#">jmeter</a></li>
						<li><a href="#">EJB</a></li>
						<li><a href="#">Jasper Report</a></li>
						<li class="divider"></li>
						<li><a href="#">分离的链接</a></li>
						<li class="divider"></li>
						<li><a href="#">另一个分离的链接</a></li>
					</ul></li>
			</ul>
		</div>
	</div>
	</nav>

	<!--      <table class="table table-hover table-bordered table-condensed">
  <caption>悬停表格布局</caption>
  <thead>
    <tr>
      <th>姓名</th>
      <th>年龄</th>
      <th>编辑</th>
    </tr>
  </thead>
  <tbody>
  <c:forEach items="${requestScope.uList}" var="u" >
       <tr>
       <td>${u.name}</td>
       <td>${u.age}</td>
       <td><a href="user/del?id=${u.id}">删除</a>&nbsp<a href="#">修改</a></td> 
       </tr>              
    </c:forEach>
  </tbody>
</table>  -->
	<div class="col-*-12"></div>
	<div class="col-sm-2">
	<div class="input-group">
            <input type="text" class="form-control" id="search">
            <span class="input-group-addon" onClick="res()">刷新</span>
           
        </div>
	
	</div>
	<div class="col-sm-8"></div>
	<div class="col-sm-2">
	<div class="btn btn-default" data-toggle="modal"
				data-target="#addModal">添加记录</div>
			<div class="btn btn-default" data-method="remove-data"
				id="remove-data">批量删除</div>
    </div>
	<table id="mytab" class="table table-hover"></table>

	<div class="modal fade" id="addModal" tabindex="-1" role="dialog"
		aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">添加记录</h4>
				</div>
				<div class="modal-body">
					<form role="form" id="form1">
						<div class="form-group">
							<input type="text" class="form-control" id="name"
								placeholder="请输入名称">
						</div>
						<div class="form-group">
							<input type="text" class="form-control" id="age"
								placeholder="请输入年龄">
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
					<button type="button" class="btn btn-primary" id="addRecord">提交</button>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
        function res(){
        $('#mytab').bootstrapTable('refresh');
        }	
	
		function onRemove(id) {
			$("#mytab").bootstrapTable('remove', {
				field : 'id',
				values : [ id ]
			});
		}
		function getIdSelections() {
			return $.map($table.bootstrapTable('getSelections'), function(row) {
				return row.id;
			});
		}
		function delAll() {
			var ids = $("#mytab").bootstrapTable('getSelections');
			//alert(ids);
			$("#mytab").bootstrapTable('remove', {
				field : 'id',
				values : ids
			});
			$remove.prop('disabled', true);
		}
		function tableHeight() {
			return $(window).height() - 50;
		}
		/**
		 * 列的格式化函数 在数据从服务端返回装载前进行处理
		 * @param  {[type]} value [description]
		 * @param  {[type]} row   [description]
		 * @param  {[type]} index [description]
		 * @return {[type]}       [description]
		 */
		function infoFormatter(value, row, index) {
			return "id:" + row.id + " name:" + row.name + " age:" + row.age;
		}
	</script>
	<script type="text/javascript">
		$(function() {
			/*     //根据窗口调整表格高度
			    $(window).resize(function() {
			        $('#mytab').bootstrapTable('resetView', {
			            height: tableHeight()
			        })
			    })  */
	
			$('#mytab').bootstrapTable({
				url : "user/get", //数据源
				dataField : "rows", //服务端返回数据键值 就是说记录放的键值是rows，分页时使用总记录数的键值为total
				height : 500, //高度调整
				//search : true, //是否搜索
				idField : "id",
				clickToSelect : true, //在点击行时，自动选择rediobox 和 checkbox
				pagination : true, //是否分页
				pageSize : 10, //单页记录数
				pageList : [ 5, 10, 20, 50 ], //分页步进值
				sidePagination : "server", //服务端分页
				//contentType: "application/x-www-form-urlencoded",//请求数据内容格式 默认是 application/json 自己根据格式自行服务端处理
				dataType : "json", //期待返回数据类型
				method : "post", //请求方式
				//searchAlign : "left", //查询框对齐方式
				//searchText: '',
				queryParamsType : "limit", //查询参数组织方式
		        queryParams : function getParams(params) {
					//params obj
					params.search = $("#search").val();
					return params;
				}, 
				searchOnEnterKey : false, //回车搜索
				//showRefresh : true, //刷新按钮
				//showColumns : true, //列选择按钮
				//buttonsAlign : "right", //按钮对齐方式                                 
				//toolbar : "#toolbar", //指定工具栏                                         
				//toolbarAlign : "right", //工具栏对齐方式                          
				columns : [
					{
						title : "全选",
						field : "select",
						checkbox : true,
						width : 15, //宽度
						align : "center", //水平
						valign : "middle" //垂直
					},
					{
						title : "ID", //标题
						field : "id", //键名
						sortable : true, //是否可排序
						order : "desc" //默认排序方式
					},
					{
						field : "name",
						title : "姓名",
						sortable : true,
						titleTooltip : "this is name",
						editable : true
					},
					{
						field : "age",
						title : "年龄",
						editable : {
							type : 'text',
							title : '年龄',
							//mode : 'inline',
							validate : function(v) {
								if (isNaN(v)) return '年龄必须是数字';
								var age = parseInt(v);
								if (age <= 0) return '年龄必须是正整数';
							}
						}
					},
					{
						field : "info",
						title : "信息",
						formatter : 'infoFormatter', //对本列数据做格式化
					},
					{
						field : "operate",
						title : "操作",
						formatter : function(value, row, index) {
							var r = '<a href="user/del?id=' + row.id + '\" class="glyphicon glyphicon-remove" onClick="onRemove(\'' + row.id + '\')"></a>';
							return r;
						}
					}
				],
	
				/* onClickRow: function(row, $element) {
				    //$element是当前tr的jquery对象
				    $element.css("background-color", "green");
				},//单击row事件 */
				/* 	locale : "zh-CN", //中文支持,
					detailView : false, //是否显示详情折叠
					detailFormatter : function(index, row, element) {
						var html = '';
						$.each(row, function(key, val) {
							html += "<p>" + key + ":" + val + "</p>"
						});
						return html;
					}, */
				onEditableSave : function(field, row, oldValue, $el) {
					//$("#mytab").bootstrapTable('resetView');
					//row = dataWarp(row, field);
					$.ajax({
						type : "post",
						url : "user/update",
						data : JSON.stringify(row), //行内修改后的数据
						dataType : "json",
						contentType : "application/json",
						success : function(data, status) {
							if (status == "success") {
								Modal.alert({
									msg : "编辑成功！"
								});
							}
						},
						error : function() {
							Modal.alert({
								msg : "编辑失败！"
							});
							$('#mytab').bootstrapTable('refresh'); // 数据加载成功后刷新
	
						},
						complete : function() {}
					})
				}
			})
			$("#addRecord").click(function() {
				var obj = {
					"name" : $("#name").val(),
					"age" : $("#age").val()
				};
				$.ajax({
					type : "post",
					url : "user/add",
					cache : false,
					data : JSON.stringify(obj),
					dataType : 'script',
					contentType : "application/json;charset=UTF-8",
					success : function() {
						$('#mytab').bootstrapTable('refresh');
					},
					error : function() {
						//alert("55555");
					}
				});
			})
	
			$('#remove-data').click(function() {
				var selects = $("#mytab").bootstrapTable('getSelections');
				var ids = $.map(selects, function(row) {
					return row.id;
				});
				// alert(ids);
				$("#mytab").bootstrapTable('remove', {
					field : 'id',
					values : ids
				});
				//var array=ids;
				$.ajax({
					type : "post",
					url : "user/dels",
					data : JSON.stringify(ids),
					dataType : 'script',
					contentType : "application/json;charset=UTF-8",
					success : function() {
						$('#mytab').bootstrapTable('refresh');
					},
					error : function() {
						//alert("55555");
					}
				});
			});
		})
	</script>
</body>
</html>
