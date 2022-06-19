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
<title>文档管理</title>

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

					<h3>文档管理</h3>
					<button class="btn btn-primary" onclick="showAddDia('myModal')">添加文档</button>
					|
					<button class="btn btn-primary"
							onclick="showSearch('bookSearch')">查找文档</button>
					|<a href="/TradeManage/queryDocBypage.do">刷新</a>
				</div>
				<!-- /widget-header -->
				<div class="widget-content">
					<table class="table table-striped table-bordered">
						<thead>
							<tr>
								<th width="10%">文档编号</th>
								<th width="20%">文档名称</th>
								<th width="10%">文档内容</th>
								<th width="20%">创建者</th>
								<th width="20%">分类</th>
								<th width="20%" class="td-actions">操作

								</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${docList }" var="list">
								<tr>
									<td>${list.id }</td>
									<td>${list.name }</td>
									<td>${list.remark }</td>
									<td>${list.uname }</td>
									<td>${list.type.name }</td>
									<td><a href="" role="button" class="btn"
										data-toggle="modal"
										onclick="showDia('myModal','${list.id }','${list.name }','${list.remark }','${list.uname }','${list.tid }','${list.type.name }')">修改</a>
										|<a href="<%=path %>/deleteDocByid.do?id=${list.id }"> 删除</a>

								</tr>
								<span style="color: red">${msg}</span>
							</c:forEach>

							<tr>
						        <td colspan="6">
									<c:if test="${page.pageNumber==1 || page.totalPage==0 }">
										<a>首页</a>
										<a>上一页 </a>
									</c:if>
									<c:if test="${page.pageNumber!=1 && page.totalPage!=0 }">
										<a href="<%=path %>/queryDocBypage.do?pageNumber=1">首页</a>
										<a href="<%=path %>/queryDocBypage.do?pageNumber=${page.pageNumber-1 }">上一页 </a>
									</c:if>
									<c:if test="${page.pageNumber==page.totalPage || page.totalPage==0 }">
										<a>下一页 </a>
										<a>尾页 </a>
									</c:if>
									<c:if test="${page.pageNumber!=page.totalPage && page.totalPage!=0 }">
										<a href="<%=path %>/queryDocBypage.do?pageNumber=${page.pageNumber+1 }">下一页 </a>
										<a href="<%=path %>/queryDocBypage.do?pageNumber=${page.totalPage }">尾页</a>
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

				<form action="<%=path %>/updateType.do" method="post" id="updateForm">

					<table class="table table-striped table-bordered">

						<tr>
							<td>文档编号</td>
							<td><input type="text" id="id" name="id"
								value="" placeholder="Id" class="login" readonly="readonly" /></td>
						</tr>
						<tr>
							<td>文档名称</td>
							<td><input type="text" id="name" name="name"
								value="" placeholder="文档名称" /></td>
						</tr>
						<tr>
							<td>文档内容</td>
							<td><input type="text" id="remark" name="remark"
								value="" placeholder="文档内容" /></td>
						</tr>
						<tr>
							<td>创建人</td>
							<td><input type="text" id="uname" name="uname"
								value="" placeholder="创建人" /></td>
						</tr>
						<tr>
							<td>分类</td>
							<td>
								<select name="tid" id="tid">
									<c:forEach items="${typeList }" var="type">
										<option value="${type.id }">${type.name }</option>
									</c:forEach>
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

	<!-- 查找书籍Model -->
	<div id="bookSearch" class="modal hide fade" tabindex="-1"
		role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal"
				aria-hidden="true">×</button>
			<h3>查找文档</h3>
		</div>
		<div class="modal-body">
			<div class="content clearfix">

				<form action="<%=path %>/queryDocBypage.do" method="post" id="searchForm">

					<table class="table table-striped table-bordered">
						<tr>
							<td>文档名称</td>
							<td><input type="text" id="dname" name="name"
								value="" placeholder="文档名称" class="login" /></td>
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

	<!-- model结束 -->
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
		$('#id').val(b)
		$('#name').val(c);
		$('#remark').val(d);
		$('#uname').val(e);
		$('#tid').val(f);
		$('#updateForm').attr("action", "<%=path %>/updateDoc.do");
	}

	function submitForm(a) {
		$('#' + a).submit();
	}
	//显示添加的对话框，传入对话框的ID
	function showAddDia(a) {
		var b = "";
		$('#id').val(b)
		$('#name').val(b);
		$('#remark').val(b);
		$('#uname').val(b);
		// $('#bookCount').val(b);

		$('#updateForm').attr("action", "<%=path %>/addDoc.do");
		$('#' + a).modal('show');
	}
	function showAddBorrow(a, b, c) {
		$('#' + a).modal('show');
		$('#b_bookBid').val(b)
		$('#suproductId').val(c);
	}
	function showSearch(a) {
		$('#' + a).modal('show');
	}
	function validate(){
		var sum = $("#aa").val();
		var t=/^\d+(\.\d+)?$/;
		var r= /^[+-]?[1-9]?[0-9]*\.[0-9]*$/;
		if(t.test(sum) && sum > 0 && !r.test(sum)){
			return true;
		}else{
			alert("只能输入不为0的正整数");
			return false;
		}
	}
</script>
</html>
