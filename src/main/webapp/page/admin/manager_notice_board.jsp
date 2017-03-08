<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
	<title>公告管理</title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<link rel="stylesheet" type="text/css"
		href="<%=request.getContextPath()%>/public/lib/bootstrap/css/bootstrap-admin.css">
	<link rel="stylesheet" type="text/css"
		href="<%=request.getContextPath()%>/public/css/admin/manager_notice_board.css">
	<script type="text/javascript" src="<%=request.getContextPath()%>/public/lib/jquery-1.12.1.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/public/lib/bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/public/js/admin/NoticeBoard.js"></script>
	<style type="text/css">
	header {
		background-image: url('image/000.jpg');
		background-size: 100% auto;
		background-repeat: no-repeat;
	}
	
	body {
		background-image: url('image/111.jpg');
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
			<ul class="nav nav-tabs" data-spy="affix" data-offset-top="80"
				style="background-color: #44889d; border-radius: 5px; width: 180px; margin-left: 10px;">
				<li style="width: 180px; margin-left: 0px;"><a
					href="manager_index.html" style="min-height: 52px;">首页</a>
				</li>
				<li style="width: 180px; margin-left: 0px;"><a
					href="manager_reservation.html" style="min-height: 52px;">会议室预约管理</a>
				</li>
				<li style="width: 180px; margin-left: 0px;"><a
					href="manager_equipment.html" style="min-height: 52px;">会议室设备管理</a>
				</li>
				<li style="width: 180px; margin-left: 0px;"><a
					href="manager_staff.html" style="min-height: 52px;">人员管理</a>
				</li>

				<li style="width: 180px; margin-left: 0px;" class='active'><a
					href="manager_notice_board.html" style="min-height: 52px;">公告管理</a>
				</li>
			</ul>
		</div>

	<form action="manager_notice_board.jsp" method="post" name="insertBookForm" >
		<div class="col-md-9" style='margin-left: 20px; padding-right: 18px;'>
			<div class="row-fluid">
				<div class="panel panel-primary"
					style="z-index: 1; position: relative; width: 100%; height: 100px;">
					<div class="panel-heading panel-primary" data-toggle="collapse"
						data-toggle="collapse" data-parent="#accordion"
						href="#collapseOne">
						<h1 class="panel-title">
							<a id="panelTitle"> 当前公告： </a>
						</h1>

					</div>
					
					
					<div class="form-group">
						<textarea style="width: 100%; height: 60px;" id="announcement_find" name="announcement_find"></textarea>
					</div>
					
					
				</div>
				<div class="panel panel-primary"
					style="z-index: 1; position: relative; width: 100%; height: 100%;">
					<div class="panel-heading" data-toggle="collapse"
						data-toggle="collapse" data-parent="#accordion"
						href="#collapseOne">
						<h1 class="panel-title">
							<a id="panelTitle"> 公告管理 </a>
						</h1>

					</div>
					<div class='panel-body'>
						<div style='padding-left: 120px;'>
							<div class="form-group">
								<label for="textarea">公告内容:</label>
								<textarea style="width: 100%; height: 375px;" id="textarea" name="announcement_content"></textarea>
							</div>
							<div class="form-group" id="button" align="center">
								<input type="submit" class="btn btn-primary" value="提交" /> 
								<input type="reset" class="btn btn-default" value="清空" />
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</form>
</body>
</html>