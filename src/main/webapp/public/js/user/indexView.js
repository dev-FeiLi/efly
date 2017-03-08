define(function(require,exports,module){
    require('./indexLogin');
    var pathName = window.location.pathname;
    var projectName = pathName.substr(0, pathName.substr(1).indexOf('/') + 1);
    
    function checkBeforeAdd(startDate,endDate,room){
    	var status = undefined;
    	var appointment = {};
    	appointment.start = startDate;
    	appointment.end = endDate;
    	appointment.calendar = room;
    	$.ajax({
    		type : "POST",
    		url : projectName + '/user/checkBeforeAdd',
    		async : false,
    		data : appointment,
    		dateType : "json",
    		success : function(data){
    			status = data.checkStatus;
    		}
    	});
    	return status;
    }
    
    function addSingleAppointment(personalAppointment){
        var rtnData = undefined;
    	$.ajax({
            type : "POST",
            url : projectName + '/user/addSingleAppointment',
            async : false,
            data : JSON.stringify(personalAppointment),
            contentType : 'application/json',
            dataType : "json",
            success : function(data){
                rtnData = data.status;
                parent.location.reload();
            },
            error: function(XMLHttpRequest,strError,strObject){}
        });
    	
    	return rtnData;
    }
    
    //init method
    exports.init = function (data) {
    	
    	
    	
    	var jqxDate = new $.jqx.date();
        //Converts the Date jqx object to Javascript Date object
        var dd = jqxDate.toDate('China Standard Time');
        var appointments = new Array();
        appointments=data;

        // prepare the data
        var source =
        {
            dataType: "array",
            dataFields: [
                { name: 'id', type: 'string' },
                { name: 'location', type: 'string'},
                { name: 'description', type: 'string' },
                { name: 'subject', type: 'string' },
                { name: 'calendar', type: 'string' },
                { name: 'start', type: 'date' },
                { name: 'end', type: 'date' },
                { name: 'readOnly',type:'boolean'},
                { name: 'draggable',type:'boolean'},
                { name: 'resizable',type:'boolean'}
            ],
            id: 'id',
            localData: appointments
        };
        var adapter = new $.jqx.dataAdapter(source);
        $("#scheduler").jqxScheduler({
            date: new $.jqx.date(dd),
            toolBarRangeFormat: 'yyyy年MM月dd日',
            width: '100%',
            height: 800,
    		rowsHeight: 20,
            source: adapter,
            view: 1,
            showLegend: true,
    		editDialogCreate: function (dialog, fields, editAppointment) {
    					//remove unusable fields
    					
                        
    		},
    				
                   
                    /**
                     * called when the dialog is closed.
                     * @param {Object} dialog - jqxWindow's jQuery object.
                     * @param {Object} fields - Object with all widgets inside the dialog.
                     * @param {Object} the selected appointment instance or NULL when the dialog is opened from cells selection.
                     */
            contextMenuCreate: function (dialog, fields, editAppointment) {
                   
            },
                    /**
                    * called when a key is pressed while the dialog is on focus. Returning true or false as a result disables the built-in keyDown handler.
                    * @param {Object} dialog - jqxWindow's jQuery object.
                    * @param {Object} fields - Object with all widgets inside the dialog.
                    * @param {Object} the selected appointment instance or NULL when the dialog is opened from cells selection.
                    * @param {jQuery.Event Object} the keyDown event.
                    */
            editDialogKeyDown: function (dialog, fields, editAppointment, event) {

            },
            ready: function () {
            },
            resources:
            {
                colorScheme: "scheme02",
                dataField: "calendar",
    			orientation: "horizontal",
                source: new $.jqx.dataAdapter(source)
            },
            appointmentDataFields:
            {
                from: "start",
                to: "end",
                id: "id",
                location: "location",
                description: "description",
                subject: "subject",
                resourceId: "calendar",
                resizable: "resizable",
                readOnly: "readOnly",
                draggable:"draggable",
            },
            views:
            [
    			{ type: "dayView", showWeekends: false, timeRuler: { scaleStartHour: 8, scaleEndHour: 17.5} },
                { type: "weekView", showWeekends: false, timeRuler: { scaleStartHour: 8, scaleEndHour: 17.5} },
                { type: "monthView", showWeekends: false }
            ]
        });
        $("#maskDiv").hide();
        
        
        $("#scheduler").on('appointmentAdd',function(event){
        	if($("#user").val() == 'null'||$("#user").val() == ''){
        		alert("请先登录");
        		throw new Error('This is not an error. This is just to abort javascript');
        	}
        	
        	var args = event.args;
        	var appointment = args.appointment;
        	
        	appointment.draggable = false;
        	
        	//check
	         var room = appointment.resourceId;
	         var from = appointment.from.toString();
	         var to = appointment.to.toString();
	         var check_status = checkBeforeAdd(from,to,room);
	         if(check_status == '0'){
	        	 alert("该时间已经被预约，请另行预约");
	        	 throw new Error('This is not an error. This is just to abort javascript');
	         }
        	
        	
        	var personalAppointment = {};
        	personalAppointment.description = appointment.description;
        	personalAppointment.subject = appointment.subject;
        	personalAppointment.start = appointment.from.toString();
        	personalAppointment.end = appointment.to.toString();
        	personalAppointment.calendar = appointment.resourceId;
        	var status = addSingleAppointment(personalAppointment);
//        	if(false){
////	        	throw new Error('This is not an error. This is just to abort javascript');
//        	}
        });

        
        $("#scheduler").on('editDialogCreate',function(event){
        	var args = event.args;
        	var dialog = args.dialog;
        	var fields = args.fields;
        	var appointment = args.appointment;
            var a1 = fields.from[0].children[0].children[1];
            var a2 = fields.from[0].children[0].children[2];
            var $a2 = $(a2);
            var $a1 = $(a1);
            var b1 = fields.to[0].children[0].children[1];
            var b2 = fields.to[0].children[0].children[2];
            var $b2 = $(b2);
            var $b1 = $(b1);
            fields.deleteButton.remove();
            fields.locationContainer.remove();
            fields.statusContainer.remove();
            fields.timeZoneContainer.remove();
            fields.colorContainer.remove();
            fields.allDayContainer.remove();
            fields.repeatContainer.remove();
            $a2.remove();
            $a1.remove();
            $b1.remove();
            $b2.remove();
            $(".jqx-input-content").attr('disabled','disabled');
			fields.subjectLabel.html("Appointment");
        
        });
        
        
    };
});
