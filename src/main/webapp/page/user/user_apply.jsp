<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="username" value="${sessionScope.username}"></c:set>
<c:set var="admin" value="${sessionScope.admin}"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <title>预约管理</title>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  <link rel="stylesheet" href="<%=request.getContextPath()%>/public/lib/bootstrap/css/bootstrap-user.css" type="text/css"/>
  <link rel="stylesheet" href="<%=request.getContextPath()%>/public/css/common-nav.css" type="text/css"/>
  <link rel="stylesheet" href="<%=request.getContextPath()%>/public/lib/DataTables-1.10.10/media/css/dataTables.bootstrap.css" type="text/css" />
  <link rel="stylesheet" href="<%=request.getContextPath()%>/public/css/user/user_apply_style.css" type="text/css"/>
  <link rel="stylesheet" href="<%=request.getContextPath()%>/public/css/user/user_apply_change.css" type="text/css" />
  <script type="text/javascript" src="<%=request.getContextPath()%>/public/lib/jquery-1.12.1.js"></script>
  <script type="text/javascript" src="<%=request.getContextPath()%>/public/lib/bootstrap/js/bootstrap.min.js"></script>
  <script type="text/javascript" src="<%=request.getContextPath()%>/public/lib/DataTables-1.10.10/media/js/dataTables.bootstrap.min.js"></script>
  <style type="text/css">
    .pst{
      margin-left:150px;
    }
  </style>



</head>

<body style="height:100%">
    <header class="navbar navbar-default navbar-fixed-top" role="banner">
      <div class="container">
        <div class="navbar-header">
          <button class="navbar-toggle" type="button">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a href="javascript:;" class="navbar-brand"><span class='glyphicon glyphicon-home'></span></a>
        </div>
        <nav id="nav-link" class="collapse navbar-collapse" role="navigation">
          <ul class="nav navbar-nav">
            <li>
              <a href="/efly/user/index">首页</a>
            </li>
            <li>
              <a href="/efly/userReservation/index" >预约管理</a>
            </li>
            <li class='dropdown'>
              <a href="javascript:;" data-toggle="dropdown">个人中心 <span class='caret'></span></a>
              <ul class='dropdown-menu'>
                 <li><a href="/efly/userInfo/init">查看个人信息</a></li>
                <li><a href="/efly/userPw/init">修改密码</a></li>
              </ul>
            </li>
          </ul>

          <ul class='nav navbar-nav pull-right'>
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
              </ul>
            </li>
          </ul>
        </nav>
      </div>
    </header>
    <!-- page title -->
    <div class='container'>
      <div class="row-fluid">
        <div class="col-md-12">
          <div class='jumbotron'>
            <h1>会议室预约</h1>
            <p>This is the page to manage your reservation.You can get the information on your reservation and delete what you don't need.</p>
          </div>
        </div>
      </div>
      </div>  
    
    
          <div class="container" style="height:100%;min-height:410px;">
        <div class="col-md-10" style="min-width: 1052px; width: 100%;">
          <div class="row-fluid" >
            <div class="panel panel-default" style="z-index: 1; position: relative;">
              <div class="panel-heading" align="center" style='background-color:#4AA5CE;'>
                  <h4 class="panel-title">
                    <a id="panelTitle" style="text-decoration:none; color: #fff; font-size: 30px; padding:30px 30px;">
                      我的预约管理
                    </a>
                    </h4>
              </div> 
              <div  class='panel-body'style=''><br/>
           
                      <table  id="table_1"  class="table  table-bordered" BORDER="1" >
                                    <thead >
                                      <tr bgcolor="#EAEAEA" style="height:50px">
                                       <th width="">ID</th>
                                       <th width="">会议主题</th>
                                       <th width="">会议室</th>
                                       <th width="">会议时间</th>
                                       <th width="">会议简介</th>
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
        
    

    <footer class='bs-docs-footer' role='contentinfo' style="margin-bottom:0px;">
          <div class='container'>
             <ul class='nav nav-default nav-tabs'>
                <li><a href="#">home.f5</a></li>
                <li><a href="#">book.f5</a></li>
                <li><a href="#">qa.f5</a></li>
             </ul>
          </div>
    </footer>
  




<script type="text/javascript" src="<%=request.getContextPath()%>/public/lib/DataTables-1.10.10/media/js/dataTables.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/public/lib/DataTables-1.10.10/media/js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/public/lib/DataTables-1.10.10/media/js/DT_bootstrap.js"></script>

<script type="text/javascript" src="<%=request.getContextPath()%>/public/js/user/user_apply.js"></script>
 

</body>
</html>