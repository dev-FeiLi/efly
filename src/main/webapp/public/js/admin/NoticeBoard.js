var pathName = window.location.pathname;
var projectName = pathName.substr(0, pathName.substr(1).indexOf('/') + 1);
$(document).ready(function () {
	MeetingRoomChange();

	$("#clearamrc").click(function() {
		MeetingRoomChange();
		
	});
	$("#button").click(function() {
		updateMeetingRoomChange();

	});

});

function updateMeetingRoomChange(){
	$.ajax({
		type : "POST",
		async:false,
		url : projectName+"/announcement_insert",
		dataType:"json",
		data : {"announcement_content" : $("#textarea").val()},
		success : function(data) {
		},
		error : function(data) {
			alert("error");
		}
	});
	alert("修改成功");
}
function MeetingRoomChange() {
	$.ajax({
		type : "POST",
		async:false,
		url :  projectName+"/NoticeBoard",
		dataType:"json",
		
		success : function(data) {
			$("#announcement_find").val(data[0].announcement);
		},
		error : function(data) {
			alert("error");
		}
	
	});
}
