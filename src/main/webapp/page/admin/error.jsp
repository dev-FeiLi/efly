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
<div style='float:center' align='center'>
    <span style='color:red;'>系统错误，请联系管理员。</span>
    <br />
    <a href="/efly/manager/index" style="color:blue">返回首页</a>
</div>
    <script type="text/javascript" src="<%=request.getContextPath()%>/public/lib/DataTables-1.10.10/media/js/dataTables.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/public/lib/DataTables-1.10.10/media/js/jquery.dataTables.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/public/lib/DataTables-1.10.10/media/js/DT_bootstrap.js"></script>
</body>
</html>
