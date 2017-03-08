$(document).ready(function() {

	var pathName = window.location.pathname;
	var projectName = pathName.substr(0, pathName.substr(1).indexOf('/') + 1);
	
	function getData () {
		var aadata;
		$.ajax({
			type : "post",
			url : projectName + "/userReservation/getReservation",
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
	
	var table = $('#table_1').DataTable({
		"bAutoWidth": false,
    	"data" : tabledata,
    	columns: [
            { data : 'orderId' ,"visible" : false },
            { data : 'meetingThemeName', 'sClass' : "text-center" },
            { data : 'roomName' , 'sClass' : "text-center" },
            { data : 'time' , 'sClass' : "text-center" },
            { data : 'description' , 'sClass' : "text-center" },
        ],
        columnDefs : [
             {
            	 "targets" : [5],
            	 "data" : "操作",
            	 "render" : function(oderId){
            		 return "<a href='javascript:void(0)' id='deletes'>删除</a>";
            		 
            	 }
             }
        
        ],
    });
	
	$('#table_1 tbody').on( 'click', 'tr', function () {
        if ( $(this).hasClass('selected') ) {
            $(this).removeClass('selected');
        }
        else {
            table.$('tr.selected').removeClass('selected');
            $(this).addClass('selected');
        }
      } );
    
	$('#table_1 tbody').on('click', '#deletes', function() {
		var tr = table.row($(this).parents('tr'));
		var data = tr.data();
		$.ajax({
			 type : "post",
			 url : projectName + "/userReservation/delete",
			 async : false ,
			 dataType : "json",
			 data : {"orderId" : data.orderId},
			 error : function(){
				 alert("delete error!");
			 },
			 success : function(data){
				 tr.remove().draw( false );
			 }
		});
	});

});