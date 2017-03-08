<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>管理员预约管理</title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<link rel="stylesheet" type="text/css"
		href="<%=request.getContextPath()%>/public/lib/bootstrap/css/bootstrap-admin.css">
	<link rel="stylesheet" href="<%=request.getContextPath()%>/public/lib/DataTables-1.10.10/media/css/dataTables.bootstrap.min.css" type="text/css" />
	<link rel="stylesheet" type="text/css"
		href="<%=request.getContextPath()%>/public/css/admin/reservationManage.css">
	<script type="text/javascript" src="<%=request.getContextPath()%>/public/lib/jquery-1.12.1.js"></script>
	<!--DataTable -->
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/public/lib/DataTables-1.10.10/media/js/jquery.dataTables.min.js"></script>
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/public/lib/DataTables-1.10.10/media/js/dataTables.bootstrap.min.js"></script>
	<!--bootstrap-->
	<script type="text/javascript" src="<%=request.getContextPath()%>/public/lib/bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/public/js/admin/reservationManage.js"></script>
	
	<link rel="stylesheet" href="<%=request.getContextPath()%>/public/lib/jqwidgets/styles/jqx.base.css" type="text/css" />
    <script type="text/javascript" src="<%=request.getContextPath()%>/public/lib/demos.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/public/lib/jqwidgets/jqxcore.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/public/lib/jqwidgets/jqxdatetimeinput.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/public/lib/jqwidgets/jqxcalendar.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/public/lib/jqwidgets/jqxtooltip.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/public/lib/jqwidgets/globalization/globalize.js"></script>
    
    <script type="text/javascript">
            $(document).ready(function () {                
                // Create a jqxDateTimeInput
                $("#start").jqxDateTimeInput({ width: '250px', height: '25px'});
                // Focus the jqxDateTimeInput
                $("#start").jqxDateTimeInput('focus');
                
                $("#end").jqxDateTimeInput({ width: '250px', height: '25px'});
                // Focus the jqxDateTimeInput
                $("#end").jqxDateTimeInput('focus');
            });
    </script>
        
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
	<header style="height:100px;margin-bottom:10px;"> </header>

	<div class="row-fluid">
		<div class="col-md-2 sidebar" style="min-width: 150px; width: 14.5%;">
			<ul class="nav nav-tabs" style="background-color: #44889d; border-radius: 5px; width: 180px; margin-left: 10px;">
				<li style="width: 180px; margin-left: 0px;"><a
					href="manager_index.html" style="min-height: 52px;">首页</a>
				</li>
				<li style="width: 180px; margin-left: 0px;" class='active'><a
					href="manager_reservation.html" style="min-height: 52px;">会议室预约管理</a>
				</li>
				<li style="width: 180px; margin-left: 0px;"><a
					href="manager_equipment.html" style="min-height: 52px;">会议室设备管理</a>
				</li>
				<li style="width: 180px; margin-left: 0px;"><a
					href="manager_staff.html" style="min-height: 52px;">人员管理</a>
				</li>

				<li style="width: 180px; margin-left: 0px;"><a
					href="manager_notice_board.html" style="min-height: 52px;">公告管理</a>
				</li>
			</ul>
		</div>

		<div class="col-md-9" style='margin-left: 20px; padding-right: 18px;'>
			<div class="row-fluid">
				<div class="panel panel-primary"
					style="z-index: 1; position: relative;">
					<div class="panel-heading">
						<h1 class="panel-title" style="width:40%">
							 预约信息查询
						</h1>
						<input type="button" id="reservationSearch" style="float:right;margin-top:-20px;" value="查询"/>
					</div>
					<div class='panel-body'>
						
						<div id="advance-search-div" style="padding-top:10px;padding-bottom:15px;">
							<div class="row">
								<div id="bookTimeDiv" class="col-md-12">
									<div id="" class="col-md-1" style="width:10%">时间：</div>
									<div id="" class="col-md-3" style="width:30%"><div id='start'></div></div>
									<div id="" class="col-md-3" style="width:30%"><div id='end'></div></div>
									<div id="room" class="col-md-3" style="width:30%">会议室
										<select style="height:25px;">
											<option value="1">Room1</option>
											<option value="2">Room2</option>
											<option value="1">Room3</option>
											<option value="2">Room4</option>
										</select>
									</div>
								</div>
								
							</div>
						</div>					
						
					</div>
				</div>


				<div class="panel panel-primary">
					<div class="panel-heading">
						<h1 class="panel-title">
							<a id="panelTitle"> <font color="">预约管理</font>
							</a>
						</h1>
					</div>

					<div class='panel-body'>
						
							<table id='bookTable' class="table  table-bordered" BORDER="1">
								<thead>
									<tr>
										<th>orderId</th>
										<th>userId</th>
										<th>预约者</th>
										<th>会议室</th>
										<th>会议主题</th>
										<th>会议时间</th>
										<!-- <th>操作</th> -->
										<th style="text-align:center;">删除</th>
									</tr>
								</thead>
								<tbody>
								</tbody>
							</table>
						
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>