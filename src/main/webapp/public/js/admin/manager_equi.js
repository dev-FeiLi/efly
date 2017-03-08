$(function(){
	var pathName = window.location.pathname;
	var projectName = pathName.substr(0, pathName.substr(1).indexOf('/') + 1);
//	$("#multipleAddBtn").on('click',function(){
//		var multipleAddDiv = $("#multipleAdd");
//		if(document.getElementById('multipleAdd').style.display == 'none'){
//			multipleAddDiv.show();
//			$(this).text('收起')
//
//		}else{
//			multipleAddDiv.hide();
//			$(this).text('批量添加');
//		}
//	});
	
/*	$.each(list,function(i,n){
		alert($(this).text());
	});*/
	
//	if($("input[name = 'meetingRoom'] : checked").length){

	$("#btn").on("click",function(){
		
		var  selectValue= $("select option:selected")[0].id;
		var data = $("input[name='meetingRoom']:checked")[0].id;
		var isNum = /^[0-9]+$/;
		var equipment_amount=$('#selectAmount').val();
		
		if(data == "" || selectValue == ""){
			alert("please input !");
			return false;
		}
		
		if(equipment_amount.length == 0){
			alert("equipment_amount is null");
			return false;
		}else{
			if(!isNum.test(equipment_amount)){
				alert("please input num only !");
				return false;
			}
		}
		
		if($("#1").is(":checked") && $("#2").is(":checked")){
//			alert(1);
			var  selectValue= $("select option:selected")[0].id;
			
			var data = $("input[name='meetingRoom']").val();
			
			var equiInfo={};
			equiInfo.equipment_id=selectValue;
			equiInfo.equipment_amount=$('#selectAmount').val();
			equiInfo.room_id=data;
			
			
			$.ajax({
				type:"POST",
				url:projectName + "/equiInfo/updateEquiInfo",
				dataType:"json",
				async:false,
				contentType : "application/json",
				data:JSON.stringify(equiInfo),
				success:function(data){
					alert("success");
				},
				error : function(XMLHttpRequest) {
					alert("error");
				}
			});
			
		}else{
			
			var  selectValue= $("select option:selected")[0].id;
			var data = $("input[name='meetingRoom']:checked")[0].id;
			alert(data);
			var equiInfo={};
			equiInfo.equipment_id=selectValue;
			equiInfo.equipment_amount=$('#selectAmount').val();
			equiInfo.room_id=data;
			
//			equiInfo.equipment_id_101 = $("#101").val();
//			equiInfo.equipment_amount = $("#101").val();
			
			$.ajax({
				type:"POST",
				url:projectName + "/equiInfo/updateEquiInfo",
				dataType:"json",
				async:false,
				contentType : "application/json",
				data:JSON.stringify(equiInfo),
				success:function(data){
					alert("success");
				},
				error : function(XMLHttpRequest) {
					alert("error");
				}
			});
		}
	});
	
	
	$('#equipmentTable').DataTable({
		"ajax": {
            "url": projectName+"/equiInfo/getEquiInfo",
            "type": "POST"
        },
//		'dom' : 'f<"toolbar">rtp',
    	'columns': [
            { "data" : 'equipment_name'},
            { "data" : 'equipment_amount'},
            { "data" : 'room_id' }
        ]
	});
	
});