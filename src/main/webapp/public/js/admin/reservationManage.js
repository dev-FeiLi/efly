$(document).ready(function(){
	
	var pathName = window.location.pathname;
	var projectName = pathName.substr(0, pathName.substr(1).indexOf('/') + 1);
	
	function getData () {
		var aadata;
		$.ajax({
			type : "post",
			url : projectName + "/adminReservation/getAllReservation",
			async : false ,
			dataType : "json",
			error : function(){
				alert("init error!");
			},
			success : function(data){
				aadata = data;
			}
		});
		return aadata;
	}
	
	var tabledata = getData();
	
	var table = $('#bookTable').DataTable({
		"bAutoWidth": false,
    	"data" : tabledata,
    	columns: [
    	    { data : 'orderId' ,"visible" : false },
    	    { data : 'userId' ,"visible" : false },
            { data : 'userName' , 'sClass' : "text-center" },
            { data : 'roomName' , 'sClass' : "text-center" },
            { data : 'subject' , 'sClass' : "text-center" },
            { data : 'time' , 'sClass' : "text-center" },
        ],
        columnDefs : [
             {
            	 "targets" : [6],
            	 'sClass' : "text-center",
            	 "render" : function(){
            		return "<input type='button' id='deletes' value='删除'>"; 
            	 }
             }
        
        ],
    });

	//select the meeting record
	$('#reservationSearch').on('click',function() {
		var start = $("#start").val();
		var end = $("#end").val();
		var room = $("#room option:selected").text();
		$.ajax({
			type:"post",
			url:projectName + "/adminReservation/getReservation",
			async:false,
			data:{
				"start" : start,
				"end" : end,
				"room" : room,
			},
			success:function(data){
				table.destroy();
				table = $('#bookTable').DataTable({
					"bAutoWidth": false,
			    	"data" : data,
			    	columns: [
			    	    { data : 'orderId' ,"visible" : false },
			    	    { data : 'userId' ,"visible" : false },
			            { data : 'userName' , 'sClass' : "text-center" },
			            { data : 'roomName' , 'sClass' : "text-center" },
			            { data : 'subject' , 'sClass' : "text-center" },
			            { data : 'time' , 'sClass' : "text-center" },
			        ],
			        columnDefs : [
			             {
			            	 "targets" : [6],
			            	 'sClass' : "text-center",
			            	 "render" : function(){
			            		return "<input type='button' id='deletes' value='删除'>"; 
			            	 }
			             }
			        
			        ],
			    });
			},
			error : function(XMLHttpRequest) {
				alert("error");
			}
		});
	});
	
	//delete the meeting record
	$('#bookTable tbody').on('click', '#deletes', function() {
		var tr = table.row($(this).parents('tr'));
		var data = tr.data();
		$.ajax({
			 type : "post",
			 url : projectName + "/adminReservation/delete",
			 async : false ,
			 dataType : "json",
			 data : {"orderId" : data.orderId,"userId" : data.userId},
			 error : function(){
				 alert("delete error!");
			 },
			 success : function(data){
				 tr.remove().draw( false );
			 }
		});
	});
	
});