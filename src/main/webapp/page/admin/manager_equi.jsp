<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="username" value="${sessionScope.username}"></c:set>
<c:set var="admin" value="${sessionScope.admin}"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
	<title>设备管理</title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<link rel="stylesheet" type="text/css"
		href="<%=request.getContextPath()%>/public/lib/bootstrap/css/bootstrap-admin.css">
	
	<link href="<%=request.getContextPath()%>/public/lib/DataTables-1.10.10/media/css/dataTables.bootstrap.css"
	<%-- 	rel="stylesheet" type="text/css" />
	<link href="<%=request.getContextPath()%>/public/lib/DataTables-1.10.10/media/css/jquery.dataTables.equip.css" --%>
        rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="<%=request.getContextPath()%>/public/lib/jquery-1.12.1.js"></script>
	<!--DataTable -->
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/public/lib/DataTables-1.10.10/media/js/jquery.dataTables.min.js"></script>
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/public/lib/DataTables-1.10.10/media/js/dataTables.bootstrap.min.js"></script>
	<!--bootstrap-->
	<script type="text/javascript" src="<%=request.getContextPath()%>/public/lib/bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/public/js/admin/manager_equi.js"></script>
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
            <div class="col-md-2 sidebar"
			style="min-width: 150px; width: 14.5%;">
                <ul class="nav nav-tabs" data-spy="affix"
				data-offset-top="80"
				style="background-color: #44889d; border-radius: 5px;width: 180px;margin-left:10px;">
                    <li style="width: 180px; margin-left: 0px;">
                       <a href="/efly/managerAppointment/init" style="min-height: 52px;">首页</a>
                    </li>
                    <li style="width: 180px; margin-left: 0px;">
                        <a href="manager_reservation.html"
					style="min-height: 52px;">会议室预约管理</a>
                    </li>
                    <li style="width: 180px; margin-left: 0px;"
					class='active'>
                        <a href="/efly/equiInfo/init" style="min-height: 52px;">会议室设备管理</a>
                    </li>
                    <li style="width: 180px; margin-left: 0px;">
                        <a href="/efly/manager/init"
					style="min-height: 52px;">人员管理</a>
                    </li>

                    <li style="width: 180px; margin-left: 0px;">
                        <a href="manager_notice_board.html"
					style="min-height: 52px;">公告管理</a>
                    </li>
                    
                </ul>   
               <ul class='nav navbar-nav pull-right' >
            <li class='dropdown'>
              <a href="#" data-toggle='dropdown'>
              <span id="span1" class='glyphicon glyphicon-user'>
              <c:out value="${username == null?'用户':username}"></c:out>
              </span>
              <span class='caret'></span>
              </a>
              <ul class='dropdown-menu'>
                <c:if test="${username!=null||admin!=null }">
                 <li><a href="/efly/login/logout" id="logout">退出</a></li>
                </c:if>
                <c:if test="${username ==null && admin==null }">
                 <li><a href="#" id="login"  data-toggle="modal" data-target="#loginModal">登录</a></li>
                </c:if>
              </ul>
            </li>
          </ul>
            </div>

            <div class="col-md-9"
			style='margin-left:20px; padding-right:18px;'>
                <div class="row-fluid">

                  <!-- panel 1-->
                  <div class="panel panel-primary"
					style="z-index: 1; position: relative;">
                    <div class="panel-heading" href="#collapseOne">
                        <h1 class="panel-title">
                          <a id="panelTitle">
                              新增设备
                          </a>
                        </h1>
                    </div>
                    <div class='panel-body'>
                      <label>添加设备：</label>
                      <div class='equipmentAdd'
							style='padding-left:120px;'>
                        <form action='' id='f1' name='f1'>
                          <select name='equipmentName'>
                              <option class='a' name='chair'  id="101">椅子</option>
                              <option class='a' name='cable'>网线</option>
                              <option class='a' name='table'  id="102">桌子</option>
                              <option class='a' name='TV'  id="106">电视</option>
                              <option class='a' name='remote_control'  id="107">遥控器</option>
                               <option class='a' name='projector'  id="108">投影仪</option>
                              <option class='a' name='calendar'  id="110">日历</option>
                              <option class='a' name='whiteBoard'  id="103">白板</option>
                              <option class='a' name='whitePen'  id="104">白板笔</option>
                              <option class='a' name='eraser'  id="105">白板擦</option>
                          </select>
                          数量：<input type='text' name='number' id='selectAmount'>  
                          <div>
                                                                会议室：<input type='checkbox' id="1"
										name='meetingRoom' value="room1">会议室1
                                  <input type='checkbox' id="2"
										name='meetingRoom' value="room2">会议室2
                          </div>
                          <!--批量增加div -->
                          <div id='multipleAdd'
									style='display:none;padding-top:15px;'>
                            <ul>
                              <li><label>椅 子 : <input id="101"
												type='text' size='1' placeholder='数量'></label></li>
							  <li><label>桌 子 : <input id="102"
                                                type='text' size='1' placeholder='数量'></label></li>				
                              <li><label>日 历 : <input id="110"
												type='text' size='1' placeholder='数量'></label></li>
                              <li><label>白 板 : <input id="103"
												type='text' size='1' placeholder='数量'></label>
                                  <label>白板笔 : <input id="104"
												type='text' size='1' placeholder='数量'></label>
                                  <label>白板擦 : <input id="eraser"
												type='text' size='1' placeholder='数量'></label>
                              </li>
                              <li><label>电 视 : <input id="106"
												type='text' size='1' placeholder='数量'></label>
                                  <label>遥控器 : <input id="107"
												type='text' size='1' placeholder='数量'></label>
                              </li>
                  
                              <li><label>投 影 : <input id="108"
												type='text' size='1' placeholder='数量'></label></li>
                              <li><label>网 线 : <input id="109"
												type='text' size='1' placeholder='数量'></label></li>
                            </ul>
                            
                          </div>
                          <div class='pull-right'>
                            <a href="javascript:;" id='multipleAddBtn'
										style='color:#44889d' ><span class='caret'></span></a>
                            <input type='submit' id="btn" class='btn btn-primary'
										value='添加' >
                          </div>  
                        </form>
                      </div>
                    </div>
                  </div>

                  <!-- panel 2 -->
                  <div class="panel panel-primary"
					style="z-index: 1; position: relative;">
                    <div class="panel-heading" data-toggle="collapse"
						data-toggle="collapse" data-parent="#accordion"
						href="#collapseOne">
                        <h1 class="panel-title">
                          <a id="panelTitle">
                              <font color="">设备管理</font>
                          </a>
                        </h1>
                    </div> 
                  
                    <div class='panel-body'>
                      <div style='padding-left:120px;'>
                      
                        
                        
                          <table id='equipmentTable' class="table table-striped table-bordered">
                            <thead>
                              <tr>
                                <th width='10%' id="equipment_name">设备名</th>
                                <th width='12%' id="equipment_amount">数量</th>
                                <th width='12%' id="room_id">所属会议室</th>
                              </tr>
                            </thead>
                            <tbody>
                            
                            </tbody>
						    <tfoot>
						            <tr>
						                <th>设备名</th>
						                <th>数量</th>
						                <th>所属会议室</th>
						            </tr>
						     </tfoot>                                                   
                          </table>
                      </div>
                    </div>
                  </div>  
              </div>
            </div>
        </div>
	</body>
</html>