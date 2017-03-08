$(function(){
	
	var pathName = window.location.pathname;
	var projectName = pathName.substr(0, pathName.substr(1).indexOf('/') + 1);

	/*
	 * update event
	 */
	
	$("#updateUserPw").click(function(){
		
		
		var userPw={};
		
		userPw.user_id=$('#user_id').val();
		userPw.password=$('#password').val();
		userPw.password1=$('#password1').val();
		
		var pw = $('#password').val();
		var pw1= $('#password1').val();
		
		if(pw !== "" && pw !== null){
			
			if(pw==pw1){
				
				$.ajax({
					
					type:"POST",
					url	:projectName+"/userPw/updateUserPw",
					dateType:"json",
					async:false,
					contentType : "application/json",
					data:JSON.stringify(userPw),
					success : function(data) {
						if(data.status == 2){
							alert("success");
						}else{
							if(data.status == 0){
								alert("please call admin");
							}else{
								alert("unkonw error");
							}
						}
					},
					error : function(XMLHttpRequest) {
						alert("error");
					}
				});
			}else{
				alert("两次输入的密码不一致");
			}
		}
		else{
			alert("密码不能为空");
		}
		
		
	});
	


})
	