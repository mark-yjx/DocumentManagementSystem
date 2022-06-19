<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<title>用户管理</title>

<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta name="apple-mobile-web-app-capable" content="yes">

<link href="<%=path %>/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<link href="<%=path %>/css/bootstrap-responsive.min.css" rel="stylesheet"
	type="text/css" />

<link href="<%=path %>/css/font-awesome.css" rel="stylesheet">
<link
	href="http://fonts.googleapis.com/css?family=Open+Sans:400italic,600italic,400,600"
	rel="stylesheet">
<link href="<%=path %>/css/style.css" rel="stylesheet" type="text/css">
<link href="<%=path %>/css/pages/signin.css" rel="stylesheet" type="text/css">
</head>
<body>
<%@include file="head.jsp"%>
	<div>
		<div class="content clearfix">
			<div class="widget widget-table action-table">
				<div class="widget-header">
					<i class="icon-th-list"></i>
					<h3>用户管理</h3>
					<button class="btn btn-primary" onclick="showAddDia('myModal')">添加用户</button>
					|
					<button class="btn btn-primary"
							onclick="showSearch('bookSearch')">查找用户</button>
					|<a href="<%=path %>/queryEmployeeBypage.do">刷新</a>
				</div>
				<!-- /widget-header -->
				<div class="widget-content">
					<table class="table table-striped table-bordered">
						<thead>
							<tr>
								<th width="20%">用户编号</th>
								<th width="20%">用户名字</th>
								<th width="20%">用户邮箱</th>
								<th width="20%">用户职位</th>
								<th width="20%" class="td-actions">操作
								</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${employeeList }" var="list">
								<tr>
									<td>${list.employeeid }</td>
									<td>${list.employeename }</td>
									<td>${list.email }</td>
									<td>
										<c:if test="${list.employeerole == 0}">
											用户
										</c:if>
										<c:if test="${list.employeerole == 1}">
											管理员
										</c:if>
									</td>
									<td><a href="" role="button" class="btn"
										data-toggle="modal"
										onclick="showDia('myModal','${list.employeeid }','${list.employeeid }','${list.employeename }','${list.email }','${list.employeepass }','${list.employeerole}')">修改</a>
										|<a href="<%=path %>/deleteEmployeeByid.do?employeeid=${list.employeeid }"> 删除</a>

								</tr>
								<span style="color: red">${msg}</span>
							</c:forEach>

							<tr>
						        <td colspan="5">
									<c:if test="${page.pageNumber==1 || page.totalPage==0 }">
										<a>首页</a>
										<a>上一页 </a>
									</c:if>
									<c:if test="${page.pageNumber!=1 && page.totalPage!=0 }">
										<a href="<%=path %>/queryEmployeeBypage.do?pageNumber=1">首页</a>
										<a href="<%=path %>/queryEmployeeBypage.do?pageNumber=${page.pageNumber-1 }">上一页 </a>
									</c:if>
									<c:if test="${page.pageNumber==page.totalPage || page.totalPage==0 }">
										<a>下一页 </a>
										<a>尾页 </a>
									</c:if>
									<c:if test="${page.pageNumber!=page.totalPage && page.totalPage!=0 }">
										<a href="<%=path %>/queryEmployeeBypage.do?pageNumber=${page.pageNumber+1 }">下一页 </a>
										<a href="<%=path %>/queryEmployeeBypage.do?pageNumber=${page.totalPage }">尾页</a>
									</c:if>
								</td>
						      </tr>
						</tbody>
					</table>
				</div>
				<!-- /widget-content -->
			</div>
		</div>
		<!-- /content -->

	</div>
	<!-- Modal -->
	<div id="myModal" class="modal hide fade" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal"
				aria-hidden="true">×</button>
			<h3 id="myModalLabel">编辑</h3>
		</div>
		<div class="modal-body">
			<div class="content clearfix">
				<form action="<%=path %>/updateEmployee.do" method="post" id="updateForm">
					<table class="table table-striped table-bordered">
						<tr>
							<td>用户编号</td>
							<td><input type="text" id="bookISBN" name="employeeid"
								value="" placeholder="Id" class="login" readonly="readonly" /></td>
						</tr>
						<tr>
							<td>用户名字</td>
							<td><input type="text" id="bookBname" name="employeename"
								value="" placeholder="Name" /></td>
						</tr>
						<tr>
							<td>用户邮箱</td>
							<td><input type="text" id="email" name="email"
									   value="" placeholder="邮箱" /></td>
						</tr>
						<tr>
							<td>用户密码</td>
							<td><input type="password" id="bookCompile" name="employeepass"
								value="" placeholder="Password" /></td>
						</tr>
						<tr>
							<td>用户职位</td>
							<td><!-- <input type="text" id="bookCount" name="emp.employeeRole"
								value="" placeholder="Role" /> -->
								<select id="bookCount" name="employeerole">
									<option value="1">管理员</option>
									<option value="0">用户</option>
								</select>
								</td>
						</tr>
					</table>
				</form>
			</div>
			<!-- /content -->
		</div>
		<div class="modal-footer">
			<button class="btn" data-dismiss="modal" aria-hidden="true">关闭</button>
			<button class="btn btn-primary" onclick="submitForm('updateForm')">保存</button>
		</div>
	</div>

	<div id="bookSearch" class="modal hide fade" tabindex="-1"
		role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal"
				aria-hidden="true">×</button>
			<h3>查找用户</h3>
		</div>
		<div class="modal-body">
			<div class="content clearfix">

				<form action="<%=path %>/queryEmployeeBypage.do" method="post" id="searchForm">

					<table class="table table-striped table-bordered">
						<tr>
							<td>用户名字</td>
							<td><input type="text" id="bookName" name="employeename"
								value="" placeholder="用户名字" class="login" /></td>
						</tr>
					</table>
				</form>
			</div>
			<!-- /content -->
		</div>
		<div class="modal-footer">
			<button class="btn" data-dismiss="modal" aria-hidden="true">关闭</button>
			<button class="btn btn-primary" onclick="submitForm('searchForm')">搜索</button>
		</div>
	</div>

	<input type="hidden" id="resultMessage" value="${resultMessage}" />

	<script src="<%=path %>/js/jquery-1.7.2.min.js"></script>
	<script src="<%=path %>/js/bootstrap.js"></script>

	<script src="<%=path %>/js/signin.js"></script>

</body>
<script>
	$(document).ready(function() {
		if ($('#resultMessage').val() != "") {
			alert($('#resultMessage').val());
		}
	});
	//显示修改的对话框，传入两个参数，第一个是模态对话框的ID，另一个是书籍的ID
	function showDia(a, b, c, d, e, f, g) {
		$('#' + a).modal('show');
		$('#bookBid').val(b)
		$('#bookISBN').val(c);
		$('#bookBname').val(d);
		$('#email').val(e);
		$('#bookCompile').val(f);
		$('#bookCount').val(g);
		$('#updateForm').attr("action", "<%=path %>/updateEmployee.do");
	}

	function submitForm(a) {
		$('#' + a).submit();
	}
	//显示添加的对话框，传入对话框的ID
	function showAddDia(a) {
		var b = "";
		$('#bookBid').val(b)
		$('#bookISBN').val(b);
		$('#bookBname').val(b);
		$('#email').val(b);
		$('#bookCompile').val(b);
		$('#bookCount').val(b);

		$('#updateForm').attr("action", "<%=path %>/addEmployee.do");
		$('#' + a).modal('show');
	}
	function showAddBorrow(a, b, c) {
		$('#' + a).modal('show');
		$('#b_bookBid').val(b)
		$('#b_bookISBN').val(c);
	}
	function showSearch(a) {
		$('#' + a).modal('show');
	}
</script>
</html>
