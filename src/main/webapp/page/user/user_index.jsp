<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:set var="username" value="${sessionScope.username}"></c:set>
<c:set var="admin" value="${sessionScope.admin}"></c:set>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>首页</title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<link rel="stylesheet" href="<%=request.getContextPath()%>/public/lib/bootstrap/css/bootstrap-user.css" type="text/css"/>
	<link rel="stylesheet" href="<%=request.getContextPath()%>/public/lib/jqwidgets/styles/jqx.base.css" type="text/css" />
	<link rel="stylesheet" href="<%=request.getContextPath()%>/public/css/common-nav.css" type="text/css"/>
	<link rel="stylesheet" href="<%=request.getContextPath()%>/public/css/user/user_index.css" type="text/css"/>
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
          <label href="javascript:;" class="navbar-brand"><span class='glyphicon glyphicon-home'></span></label>
        </div>
        <nav id="nav-link" class="collapse navbar-collapse" role="navigation">
          <ul class="nav navbar-nav">
            <li>
            <c:if test=""></c:if>
              <a href="user_index.html">首页</a>
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
         <!--  -->
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

        </nav>
      </div>
    </header>


    <!-- page title -->
   <div class='container'>
      <div class="row-fluid">
        <div class="col-md-12">
          <div class='jumbotron'>
            <h1>会议室预约</h1>
            <marquee scrollAmount=2 width=970 height=50 direction=left  behavior='alternate' scrollamount='30'>
            <p class="text-danger"><label><b>公告：</b></label>12312313213213213213213213213213213213212313212312313213</p>
            </marquee>
          </div>
        </div>
      </div>

   	 <div class="row-fluid">
       <div class="col-md-12">
         <div id="maskDiv" style="z-index:900; position:fixed!important; position:absolute; left:0px; top:0px; width:100%; height:100%;  background:#FFF; filter: alpha(opacity=90); opacity: 0.8; -moz-opacity: 0.8; -khtml-opacity: 0.8; text-align: center;">
            <img src="../page/admin/image/master_loading.png" style="margin-top: 30%;"/>
         </div>
         <div id="scheduler" class='scheduler'></div>
       </div>
      </div>
      
     <!-- login modal --> 
    <div class="modal fade" id="loginModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document" id="loginDialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">login</h4>
                </div>
                <div class="modal-body">
                    <div>
                        <fieldset>
                          <br>
                          <div class="col-md-6 col-md-offset-3">
	                           <form>
		                          <p><label for="account" class="control-label">Account：</label><input type="text" id="account" placeholder="account" class=" form-control"></p>
		                          <p><label for="password" class="control-label">Password：</label><input type="password" id="password" placeholder="password" class="form-control"></p>
		                          <p class="pull-right"><a href="#">Forget Password</a></p>
		                          <div style="display:none" id="errorMessage"></div> 
	                           </form>
                           </div>
                          </fieldset>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="submit" id="submit" class="btn btn-primary">login</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">close</button>
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
 
	<input type="hidden" id="user" value="<%=session.getAttribute("username") %>">
	<input type="hidden" id="admin" value="<%=session.getAttribute("admin") %>">
</body>
<script src="<%=request.getContextPath()%>/public/lib/json2.js"></script>
<script src="<%=request.getContextPath()%>/public/lib/sea.js" data-main="<%=request.getContextPath()%>/public/js/user/indexInit.js"></script> 
</html>
