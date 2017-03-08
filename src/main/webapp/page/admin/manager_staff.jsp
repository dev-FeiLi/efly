<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
    <title>人员管理</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <link rel="stylesheet" type="text/css"
        href="<%=request.getContextPath()%>/public/lib/bootstrap/css/bootstrap-admin.css" />
    <link
        href="<%=request.getContextPath()%>/public/lib/DataTable-1.10.10/media/css/dataTables.bootstrap.min.css" />
    <link rel="stylesheet" href="<%=request.getContextPath()%>/public/css/common-nav.css" />
    <link href="<%=request.getContextPath()%>/public/lib/DataTables-1.10.10/media/css/dataTables.bootstrap.css"
        rel="stylesheet" />
    <link href="<%=request.getContextPath()%>/public/css/admin/peopleManagement.css"
        rel="stylesheet" />
    <script type="text/javascript" src='<%=request.getContextPath()%>/public/lib/jquery-1.12.1.js'></script>
    <!--DataTable -->
    <script src="<%=request.getContextPath()%>/public/lib/DataTables-1.10.10/media/js/jquery.dataTables.min.js"></script>
    <script src="<%=request.getContextPath()%>/public/lib/DataTables-1.10.10/media/js/dataTables.bootstrap.min.js"></script>
    <!--bootstrap-->
    <script type="text/javascript" src="<%=request.getContextPath()%>/public/lib/bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/public/lib/bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/public/js/admin/peopleManagement.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/public/js/admin/manage_staff.js"></script>
    <style type="text/css">
    header {
        background-image: url("<%=request.getContextPath()%>/page/admin/image/000.jpg");
        background-size: 100% auto;
        background-repeat: no-repeat;
    }
    
    body {
        background-image: url("<%=request.getContextPath()%>/page/admin/image/111.jpg");
        background-size: 100% 120%;
    }
    
    .btn-primary {
        background-color: #037097;
    }
    </style>
</head>
<body>
      <header style="height:100px;margin-bottom:10px;">
        <div>

        </div>


      </header>

    <div class="row-fluid">
            <div class="col-md-2 sidebar" style="min-width: 150px; width: 14.5%;">
                <ul class="nav nav-tabs" data-spy="affix" data-offset-top="80" style="background-color: #44889d; border-radius: 5px;width: 180px;margin-left:10px;">
                    <li style="width: 180px; margin-left: 0px;">
                        <a href="/efly/managerAppointment/init" style="min-height: 52px;">首页</a>
                    </li>
                    <li style="width: 180px; margin-left: 0px;">
                        <a href="manager_reservation.html" style="min-height: 52px;">会议室预约管理</a>
                    </li>
                    <li style="width: 180px; margin-left: 0px;">
                        <a href="/efly/equiInfo/init" style="min-height: 52px;">会议室设备管理</a>
                    </li>
                    <li style="width: 180px; margin-left: 0px;" class='active'>
                        <a href="/efly/manager/init" style="min-height: 52px;">人员管理</a>
                    </li>

                    <li style="width: 180px; margin-left: 0px;">
                        <a href="manager_notice_board.html" style="min-height: 52px;">公告管理</a>
                    </li>
                </ul>
            </div>

        <div class="col-md-9" style='margin-left:20px; padding-right:18px;'>
            <div class="row-fluid" >                
                                  
                  <div class="panel panel-primary div1" style="z-index: 1; position: relative;">
                    <div class="panel-heading" data-toggle="collapse" data-toggle="collapse" data-parent="#accordion" href="#collapseOne">
                        <div class="row" style="margin:0px;">
                            <div class="col-xs-6" style="margin-top:6px;">
                                <h4 class="panel-title"  align="left">
                                    员工查询
                                </h4>
                            </div>
                            <div class="col-xs-6" style='float:right' align='right'>
                                <input onclick="search()" type="button" class="btn btn-primary" id="btn-select" value="查询"/>
                            </div>
                        </div>
                    </div>
                    <div class='panel-body' >
                      <div class="col-md-10" style="width: 85%;">
                        <div class="row-fluid" >
                            <div class="row" style="margin:0px;">
                                <form class="form-inline">
                                    <div class="col-xs-4">
                                        <label for="exampleInputName2">员工卡号</label>
                                        <input type="text" class="form-control" id="staffID">
                                    </div>
                                    <div class="col-xs-4">
                                    <label for="exampleInputEmail2">员工姓名</label>
                                        <input type="text" class="form-control" id="staffName">
                                    </div>
                                    <div class="col-xs-4">
                                    <label for="exampleInputEmail2">员工组别</label>
                                        <select class="form-control" style='width:100%' id="staffGroup">
                                          <option value=''>无</option>
                                          <option value='QA'>QA</option>
                                          <option value='wines'>wines</option>
                                          <option value='Unicorn'>Unicorn</option>
                                          <option value='Toto'>Toto</option>
                                          <option value='kebin'>kebin</option>
                                          <option value='Gpayment'>Gpayment</option>
                                          <option value='GCS'>GCS</option>
                                          <option value='SGP'>SGP</option>
                                        </select>
                                        
                                    </div>                                  
                                </form>                             
                                </div>  
                                <br/><br/>
                        </div>                                                                                    
                      </div>
                    </div>
                  </div>

                <div class="panel panel-primary" style="z-index: 1; position: relative;">
                    <div class="panel-heading" data-toggle="collapse" data-toggle="collapse" data-parent="#accordion" href="#collapseOne">
                        <div class="row" style="margin:0px;">
                            <div class="col-xs-6" style="margin-top:6px;">
                                <h4 class="panel-title"  align="left">
                                    员工管理
                                </h4>
                            </div>
                            <div class="col-xs-6" style='float:right' align='right'>
                                <input type="button" class="btn btn-primary" id="exampleModal" data-toggle="modal" data-target="#myModal" value="新建"/>
                            </div>
                        </div>
                    </div> 

                    <div class='panel-body' >
                      <div class="col-md-10" style="width: 100%;">
                        <div class="row-fluid" >
                            <div class="panel-default" style="z-index: 1; position: relative;"   style="float:center" align="center">
                                <div class='panel-body' align='center' style='width:85%;'><br/>
                                <table> 
                                    <tr>
                                        <td id="table">
                                            <table id="context" class="row-border hover order-column" width="100%" BORDER="1"></table>
                                        </td>
                                    </tr> 
                                </table>
                                </div>
                            </div>
                        </div>
                      </div>
                    </div>       
                </div>
            </div>
        </div>
    </div>  
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header" style="background-color: #44889d;">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="exampleModalLabel">新建人员信息</h4>
      </div>
<form action="/efly/manager/add" method="post">
      <div class="modal-body">  
          <div class="form-group">
            <label for="recipient-name" class="control-label col-sm-2">员工卡号:</label>
            <input type="text" class="form-control" name="user_id" style='width:80%'>
          </div>
          <br/>
          <div class="form-group">
            <label for="recipient-name" class="control-label col-sm-2">员工姓名:</label>
            <input type="text" class="form-control" name="user_name" style='width:80%'>
          </div>
          <br/>
          <div class="form-group">
            <label for="recipient-name" class="control-label col-sm-2">联系电话:</label>
            <input type="text" class="form-control" name="phone_number" style='width:80%'>
          </div>
          <br/>
          <div class="form-group">
            <label for="recipient-name" class="control-label col-sm-2">Email:</label>
            <input type="text" class="form-control" name="email" style='width:80%'>
          </div>
          <br/>
          <div class="form-group">
            <label for="recipient-name" class="control-label col-sm-2">所在组别:</label>
            <select class="form-control" style='width:80%' name="group_name">
                  <option value=''>无</option>
                  <option value='QA'>QA</option>
                  <option value='wines'>wines</option>
                  <option value='Unicorn'>Unicorn</option>
                  <option value='Toto'>Toto</option>
                  <option value='kebin'>kebin</option>
                  <option value='Gpayment'>Gpayment</option>
                  <option value='GCS'>GCS</option>
                  <option value='SGP'>SGP</option>
            </select>
          </div>          
      </div>
      <div class="modal-footer" style="background-color: #44889d;">
        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <button type="submit">保存</button>
      </div>
 </form>
    </div>
  </div>
</div>
    <script type="text/javascript" src="<%=request.getContextPath()%>/public/lib/DataTables-1.10.10/media/js/dataTables.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/public/lib/DataTables-1.10.10/media/js/jquery.dataTables.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/public/lib/DataTables-1.10.10/media/js/DT_bootstrap.js"></script>
</body>
</html>
