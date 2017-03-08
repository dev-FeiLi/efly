$(function(){
	
	var pathName = window.location.pathname;
	var projectName = pathName.substr(0, pathName.substr(1).indexOf('/') + 1);
	
	$("#phone_number").focus(function(){
	$("#spnTip").html("please input phone_number");
	})
	/*
	function chkEmail(strEmail){
		if(^(0[0-9]{2,3}\-)?([2-9]{6,7})+(\-[0-9]{1,4})?$)|(^((\(\d{3}\))?(1[358]\d{9}$)/
		.test(strEmail)){
		return false;
		}else{
		return true;
		}
	}*/
	
	
	$.ajax({
		type : "GET",
		url : projectName+"/userInfo/getUserInfo",
		dataType : "json",
		contentType : "application/json",
		async : false,
		success : function(data) {
			if(data.status == 2){
				$('#user_id').val(data.data.user_id);
				$('#user_name').val(data.data.user_name);
				$('#phone_number').val(data.data.phone_number);
				$('#group_name').val(data.data.group_name);
				$('#email').val(data.email);
				
			}else{
				if(data.status == null){
//					window.location.href="/efly/login/logout";
					alert("session have losed, please try again");
					
				}else{
					alert("unkonw error");
				}
			}
		},
		error : function(XMLHttpRequest) {
			alert("error");
		}
	});
	
	/*
	 * update event
	 */
	
	$("#updateUserInfo").click(function(){
		
		var reg = /^(13[0-9]|14(5|7)|15(0|1|2|3|5|6|7|8|9)|18[0-9])\d{8}$/;
		var phone_number = $('#phone_number').val();
		if(phone_number.length == 0){
			alert( "phone_number is null !");
			return false;
			}else{
				if(!reg.test(phone_number)){
					alert("phone_number is invalid ，please check and input again ");
					return false;
				}
			}
		
		var update_status="";
		var userInfo={};
		
		userInfo.user_id=$('#user_id').val();
		userInfo.user_name=$('#user_name').val();
		userInfo.phone_number=$('#phone_number').val();
		userInfo.group_name=$('#group_name').val();
		userInfo.email=$('#email').val();
		
		$.ajax({
			
			type:"POST",
			url	:projectName+"/userInfo/updateUserInfo",
			dateType:"jason",
			async:false,
			contentType : "application/json",
			data:JSON.stringify(userInfo),
			success : function(data) {
				status=data.status;
				if(status == 2){
					
					alert("update success");
				}
				else{
					if(status == 0){
						
						alert("please call admin to resolve this problem");
					}else{
						
						alert("unknow error has happened");
					}
				}
			},
			error : function(XMLHttpRequest) {
				alert("error");
			}
		});
	});
})
	