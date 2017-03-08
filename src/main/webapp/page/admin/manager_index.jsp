<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="admin" value="${sessionScope.adminName}"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<title>首页</title>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<link href="<%=request.getContextPath()%>/public/lib/bootstrap/css/bootstrap-admin.css"
			rel="stylesheet" type="text/css">
		<link href="<%=request.getContextPath()%>/public/lib/jqwidgets/styles/jqx.base.css"
			rel="stylesheet" type="text/css" />
		<link href="<%=request.getContextPath()%>/public/css/admin/manager_index.css"
			rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="<%=request.getContextPath()%>/public/lib/jquery-1.12.1.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/public/lib/bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/public/lib/jqwidgets/jqxcore.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/public/lib/jqwidgets/jqxbuttons.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/public/lib/jqwidgets/jqxscrollbar.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/public/lib/jqwidgets/jqxdata.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/public/lib/jqwidgets/jqxdate.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/public/lib/jqwidgets/jqxscheduler.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/public/lib/jqwidgets/jqxscheduler.api.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/public/lib/jqwidgets/jqxdatetimeinput.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/public/lib/jqwidgets/jqxmenu.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/public/lib/jqwidgets/jqxcalendar.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/public/lib/jqwidgets/jqxtooltip.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/public/lib/jqwidgets/jqxwindow.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/public/lib/jqwidgets/jqxcheckbox.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/public/lib/jqwidgets/jqxlistbox.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/public/lib/jqwidgets/jqxdropdownlist.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/public/lib/jqwidgets/jqxnumberinput.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/public/lib/jqwidgets/jqxradiobutton.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/public/lib/jqwidgets/jqxinput.js"></script>
		
		
		
		<style type="text/css">
    header {
        background-image: url('<%=request.getContextPath()%>/page/admin/image/000.jpg');
        background-size: 100% auto;
        background-repeat: no-repeat;
    }
    
    body {
        background-image: url('<%=request.getContextPath()%>/page/admin/image/111.jpg');
        background-size: 100% 120%;
    }
    
    .btn-primary {
        background-color: #037097;
    }
    </style>
	</head>
	<body>
		<header style="height:100px;margin-bottom:10px;"> <li class='dropdown' style="margin-left:1800px;">
              <a href="#" data-toggle='dropdown'>
              <span id="span1" class='glyphicon glyphicon-user'>
              <c:out value="${admin == null?'用户':admin}"></c:out>
              </span>
              <span class='caret'></span>
              </a>
              <ul class='dropdown-menu'>
                <c:if test="${admin!=null }">
                 <li><a href="/efly/login/logout" id="logout">退出</a></li>
                </c:if>
              </ul>
            </li> </header>
		
		<div class="row-fluid">
			<div class="col-md-2 sidebar" style="min-width: 150px; width: 14.5%;">
				<ul class="nav nav-tabs" data-spy="affix" data-offset-top="80"
					style="background-color: #44889d; border-radius: 5px; width: 180px; margin-left: 10px;">
					<li style="width: 180px; margin-left: 0px;" class='active'>
						<a href="/efly/managerAppointment/init" style="min-height: 52px;">首页</a>
					</li>
					<li style="width: 180px; margin-left: 0px;">
						<a href="manager_reservation.html" style="min-height: 52px;">会议室预约管理</a>
					</li>
					<li style="width: 180px; margin-left: 0px;">
						<a href="/efly/equiInfo/init" style="min-height: 52px;">会议室设备管理</a>
					</li>
					<li style="width: 180px; margin-left: 0px;">
						<a href="/efly/manager/init" style="min-height: 52px;">人员管理</a>
					</li>
					<li style="width: 180px; margin-left: 0px;">
						<a href="manager_notice_board.html" style="min-height: 52px;">公告管理</a>
					</li>
				</ul>
				 
			</div>
	
			<div class="col-md-9" style='margin-left: 20px; padding-right: 18px;'>
				<div class="row-fluid" style='padding-right:30px;'>
					<div class="panel panel-primary" style="z-index: 1; position: relative;">
						<div class="panel-heading" data-toggle="collapse"
							data-toggle="collapse" data-parent="#accordion"
							href="#collapseOne">
							<h1 class="panel-title">
								首页
							</h1>
						</div>
						<div class='panel-body'>
							<div style='padding-left: 120px;'>
								<div class="row-fluid">
									<div class="col-md-12" align='center'>
										
										<div id="scheduler" class='scheduler'></div>
										<form action="/efly/managerAppointment/init">
										</form>
									</div>
								</div>
							</div>
						</div>
	
					</div>
				</div>
			</div>
		</div>
	</body>
	<script type="text/javascript" src="<%=request.getContextPath()%>/public/js/admin/manager_index.js"></script>
</html>
