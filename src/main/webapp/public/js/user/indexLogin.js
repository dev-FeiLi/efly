define(function(require,exports,module){
    var pathName = window.location.pathname;
    var projectName =pathName.substr(0,pathName.substr(1).indexOf('/')+1);
    var showMessage = function(message) {
        $("#errorMessage").append("<p><font color='red'><strong>"+ message + "</strong></font></p>").show().delay(3000);
//        $("#errorMessage").hide();
    }
    
    function clearModal(){
        $("#account").val("");
        $("#password").val("");
        $("#errorMessage").empty();
    }
    
    $('#loginModal').on('hidden.bs.modal', function (e) {
      // do something...
        clearModal();
    })
    
    
	//check user password
	$("#submit").on("click",function(){
		var account = $("#account").val();
		var password = $("#password").val();
		clearModal();
		if(account == "" || password == "") {
			showMessage("用户名或密码不能为空！");
		}else{
			$.ajax({
				type : "POST",
				url : projectName + "/login/check",
				data : "username="+account+"&password="+password,
				async : false,
				success : function(data) {
					var id = data.certification;
					if(data.status == '0'){
						showMessage(data.message);
					}else if(id == 'user'){
						window.location = "/efly/user/index";
					}else if(id == 'admin'){
						window.location = "/efly/managerAppointment/init";
					}
				},
				error : function (XMLHttpRequest) {
				}
			});
		}
	});
});
