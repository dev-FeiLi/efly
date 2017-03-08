<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="username" value="${sessionScope.username}"></c:set>
<c:set var="admin" value="${sessionScope.admin}"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>个人信息</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/public/lib/bootstrap/css/bootstrap-user.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/public/css/common-nav.css" type="text/css"/>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/public/css/user/user_information.css"/>
    <script type="text/javascript" src="<%=request.getContextPath()%>/public/lib/jquery-1.12.1.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/public/lib/bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/public/lib/DataTables-1.10.10/media/js/json2.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/public/js/user/user_info.js"></script>
</head>    
<body>
    <header class="navbar navbar-default navbar-fixed-top" role="banner">
      <div class="container">
        <div class="navbar-header">
          <button class="navbar-toggle" type="button" data-target="#nav-link" data-toggle="collapse">
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
              <a href="#" data-toggle="dropdown">个人中心 <span class='caret'></span></a>
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
    <body>
    <!-- page title -->
    <div class='container'>
      <div class="row-fluid">
        <div class="col-md-12">
          <div class='jumbotron'>
            <h1>会议室预约</h1>
            <p>This is the page to chang your personnal information.Please check carefully over and over again! </p>
          </div>
        </div>
      </div>
    </div>
    
    
        <div class="container">
            <div class="col-md-10" style="min-width: 1052px; width: 100%">
                <div class="row-fluid" >
                <div class="panel panel-default" style="z-index: 1; position: relative;">
                    <div class="panel-heading" align="center" data-toggle="collapse" data-toggle="collapse" data-parent="#accordion" href="#collapseOne">
                        <h4 class="panel-title">
                            <a id="panelTitle" style="text-decoration:none; color: #000; font-size: 30px; padding:30px 30px;">
                              个人信息
                            </a>
                        </h4>
                       
                    </div> 

                    <div class='panel-body position'style='width:400px;height:600px;' >
                        <div class="form-group">
                            <p><label for="group">员工卡号：</label><input id="user_id" type="text"  class="form-control" name="userId" disabled></p>
                        </div>

                        <div class="form-group">
                            <p><label for="user">姓名：</label><input id="user_name" class="form-control" type="text" name="user"  disabled></p>
                        </div>

                       <!--  <div class="form-group">
                            <p><label for="tel">联系电话：<span id="phone_number" class="spnInit"></span></label><input id="txtTel" type="text" name="tel" class="form-control" ></p>

                        </div> -->
                        <div class="form-group">
                            <p><label for="group">联系电话： <span id="spnTip" class="spnInit"></span> </label><input id="phone_number" class="form-control" type="text" name="group" ></p>
                        </div>
                         <div class="form-group">
                            <p><label for="group">项目组：</label><input id="group_name" class="form-control" type="text" name="group" value=""></p>
                        </div>

                        <div class="form-group divInit"id="email" >
                            <p><label for="txtEmail">Email：</label><input id="email" class="form-control txtInit" type="text" name="email" disabled ></p>
                        </div>
                        <br>

                    <div class="row form-group">
                            <div class="col-md-2"></div>

                            <div class="col-md-2">
                                    <input type="submit" class="btn btn-primary btn-lg" id="updateUserInfo" name="login" value="修改">
                            </div>

                            <div class="col-md-2"></div>

                            <div class="col-md-2">
                                    <input type="reset" class="btn btn-default btn-lg" name="resetUserInfo" value="取消">
                            </div>

                            <div class="col-md-3"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
            </div>
        </div>
    </div>

    <footer class='bs-docs-footer' role='contentinfo'>
          <div class='container'>
             <ul class='nav nav-default nav-tabs'>
                <li><a href="#">home.f5</a></li>
                <li><a href="#">book.f5</a></li>
                <li><a href="#">qa.f5</a></li>
             </ul>
          </div>
    </footer>
  
</body>
</html>
