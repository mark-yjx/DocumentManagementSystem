<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="navbar navbar-fixed-top">
	<div class="navbar-inner">
		<div class="container">
			<a class="btn btn-navbar" data-toggle="collapse"
				data-target=".nav-collapse"> <span class="icon-bar"></span> <span
				class="icon-bar"></span> <span class="icon-bar"></span>
			</a> <a class="brand" href="/TradeManage/jsp/main.jsp"> 文档管理系统 </a>
			<div class="nav-collapse">
				<ul class="nav pull-right">
					<li class=""><a href="#" > <i class="icon-user"></i>
							<c:if test="${sessionScope.emp != null}">
								${sessionScope.emp.employeename },欢迎你
							</c:if>
					</a></li>
					<li class=""><a href="/TradeManage/logout.do" class="">退出
					</a></li>
				</ul>
			</div>
			<!--/.nav-collapse -->
		</div>
		<!-- /container -->
	</div>
	<!-- /navbar-inner -->
</div>
<!-- /navbar -->

<!-- /navbar -->
<div class="subnavbar">
	<div class="subnavbar-inner">
		<div class="container">
			<ul class="mainnav">
				<li><a href="/TradeManage/jsp/main.jsp"><span>首页</span></a></li>
				<li><a href="/TradeManage/queryTypeBypage.do">分类管理</span> </a></li>
				<li><a href="/TradeManage/queryDocBypage.do"><span>文档管理</span> </a></li>
				<li><a href="/TradeManage/queryEmployeeBypage.do"><span>用户管理</span> </a></li>
				<li><a href="/TradeManage/queryRecordBypage.do"><span>操作记录</span> </a></li>
			</ul>
		</div>
		<!-- /container -->
	</div>
	<!-- /subnavbar-inner -->
</div>
