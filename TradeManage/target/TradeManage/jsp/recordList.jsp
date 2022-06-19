<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>操作记录管理</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <link href="<%=path %>/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="<%=path %>/css/bootstrap-responsive.min.css" rel="stylesheet" type="text/css" />
    <link href="<%=path %>/css/font-awesome.css" rel="stylesheet">
    <link href="http://fonts.googleapis.com/css?family=Open+Sans:400italic,600italic,400,600" rel="stylesheet">
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
                <h3>操作记录管理</h3>
<%--                <button class="btn btn-primary" onclick="showAddDia('myModal')">添加分类</button>--%>
<%--                |--%>
                <button class="btn btn-primary"
                        onclick="showSearch('bookSearch')">操作记录查询</button>
                |<a href="<%=path %>/queryRecordBypage.do">刷新</a>
            </div>
            <!-- /widget-header -->
            <div class="widget-content">
                <table class="table table-striped table-bordered">
                    <thead>
                    <tr>
                        <th width="10%">操作记录编号</th>
                        <th width="20%">用户名称</th>
                        <th width="40%">操作记录</th>
                        <th width="20%">操作时间</th>
                        <th width="10%" class="td-actions">操作

                        </th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${logList }" var="list">
                        <tr>
                            <td>${list.id }</td>
                            <td>${list.name }</td>
                            <td>${list.record }</td>
                            <td><fmt:formatDate value="${list.createtime }" pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate></td>
                            <td><a href="<%=path %>/deleteLogByid.do?id=${list.id }"> 删除</a></td>
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
                                <a href="<%=path %>/queryRecordBypage.do?pageNumber=1">首页</a>
                                <a href="<%=path %>/queryRecordBypage.do?pageNumber=${page.pageNumber-1 }">上一页 </a>
                            </c:if>
                            <c:if test="${page.pageNumber==page.totalPage || page.totalPage==0 }">
                                <a>下一页 </a>
                                <a>尾页 </a>
                            </c:if>
                            <c:if test="${page.pageNumber!=page.totalPage && page.totalPage!=0 }">
                                <a href="<%=path %>/queryRecordBypage.do?pageNumber=${page.pageNumber+1 }">下一页 </a>
                                <a href="<%=path %>/queryRecordBypage.do?pageNumber=${page.totalPage }">尾页</a>
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

            <form action="<%=path %>/updateCustom.do" method="post" id="updateForm">

                <table class="table table-striped table-bordered">

                    <tr>
                        <td>分类编号</td>
                        <td><input type="text" id="id" name="id"
                                   value="" placeholder="ID" class="login" readonly="readonly" /></td>
                    </tr>
                    <tr>
                        <td>分类名称</td>
                        <td><input type="text" id="name" name="name"
                                   value="" placeholder="请输入分类名称" /></td>
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
        <h3>操作查询</h3>
    </div>
    <div class="modal-body">
        <div class="content clearfix">

            <form action="<%=path %>/queryRecordBypage.do" method="post" id="searchForm">

                <table class="table table-striped table-bordered">
                    <tr>
                        <td>用户名称</td>
                        <td><input type="text" id="opContent" name="name"
                            value="" placeholder="请输入需要查询的用户名称" class="login" /></td>
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
    function submitForm(a) {
        $('#' + a).submit();
    }
    function showSearch(a) {
        $('#' + a).modal('show');
    }
    // 编辑
    function showDia(a, b, c) {
        $('#' + a).modal('show');
        $('#id').val(b)
        $('#name').val(c)
        $('#updateForm').attr("action", "<%=path %>/updateType.do");
    }

    //显示添加的对话框，传入对话框的ID
    function showAddDia(a) {
        var b = "";
        $('#bookBid').val(b)
        $('#bookISBN').val(b);
        $('#bookBname').val(b);
        $('#bookCompile').val(b);
        $('#bookCount').val(b);
        $('#bookPress').val(b);
        $('#updateForm').attr("action", "<%=path %>/addType.do");
        $('#' + a).modal('show');
    }
</script>
</html>
