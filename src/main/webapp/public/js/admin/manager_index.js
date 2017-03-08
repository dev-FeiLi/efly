$(document).ready(function () {    

//    var data = [{ 
//    "id": "1",
//    "username": "rgd",
//    "description": "gfhdgfh", 
//    "theme": "hsgh",
//    "subject": "gfhdgfh",
//    "calendar": "Room1",
//    "start": "2016-03-30 09:30:00",
//    "end": "2016-03-30 11:00:00"
//    }];
    
    var jqxDate = new $.jqx.date();
    //Converts the Date jqx object to Javascript Date object
     var pathName = window.location.pathname;
     var projectName =pathName.substr(0,pathName.substr(1).indexOf('/')+1);
     var rtnData = undefined;
     $.ajax({
         type : "POST",
         url : projectName + '/managerAppointment/getAppointment',
        async : false,
        dataType : "json",
        success : function(data){
                    rtnData = data;
                     },     
         error: function(XMLHttpRequest,strError,strObject){}     
     }); 
    
     var data = rtnData;
    
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
                 ],id: 'id',
        localData: appointments
       
    };
    var adapter = new $.jqx.dataAdapter(source);
    $("#scheduler").jqxScheduler({
        date: new $.jqx.date(),
        width: '100%',
        height: 700,
        source: adapter,
        view: 1,
        showLegend: true,
        enableHover: false,
        ready: function () 
                {
                    $("#scheduler").jqxScheduler('setAppointmentProperty', 'id1', 'resizable', false);
                    $("#scheduler").jqxScheduler('setAppointmentProperty', 'id1', 'draggable', false);
                    $("#scheduler").jqxScheduler('setAppointmentProperty', 'id2', 'resizable', false);
                    $("#scheduler").jqxScheduler('setAppointmentProperty', 'id2', 'draggable', false);
                },

        contextMenuCreate: function(menu, settings)
                {
                    var source = settings.source;
                    source.push({ id: "delete", label: "Delete Appointment" });
                },
        

        contextMenuItemClick: function (menu, appointment, event)
                {
                    var args = event.args;
                    switch (args.id) {
                        case "delete":
                        	if(confirm("是否删除此会议记录?")){
                        		deleteAppointment(appointment.id);
                        	}else{
                        		throw error("this is to abort js code");
                        	}
                            $("#scheduler").jqxScheduler('deleteAppointment', appointment.id);
                            
                           return true;
                    }
                },
                
        contextMenuOpen: function (menu, appointment, event)
                {

                    if (!appointment) {
                        menu.hide();
                    }
                    else {
                        menu.jqxMenu('hideItem', 'editAppointment');
                        menu.jqxMenu('hideItem', 'createAppointment');    
                    }
                },

         editDialogCreate: function (dialog, fields, editAppointment) 
                 {
                    
                    
                    
                    // hide status option
                    fields.statusContainer.hide();
                    
                    // hide color option
                    fields.colorContainer.hide();

                    fields.subjectLabel.html("appointment");
                    
                    fields.locationLabel.html("User");
                    
                    fields.resourceLabel.html("room");
                    
                    
                  
                   
                },
                
               
                /**
                 * called when the dialog is closed.
                 * @param {Object} dialog - jqxWindow's jQuery object.
                 * @param {Object} fields - Object with all widgets inside the dialog.
                 * @param {Object} the selected appointment instance or NULL when the dialog is opened from cells selection.
                 */
                editDialogClose: function (dialog, fields, editAppointment) {
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
 
        resources:
        {
            colorScheme: "scheme05",
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
        view: 'weekView',
                views:
                [
                    { type: "dayView", showWeekends: false, timeRuler: { scaleStartHour: 8, scaleEndHour: 18} },
                    { type: "weekView", showWeekends: false,timeRuler: { scaleStartHour: 8, scaleEndHour: 18} },
                    { type: "monthView", showWeekends: false }
                ]
    });
    function deleteAppointment(data) {
       var status = 0;
    	$.ajax({
            type: "POST",
            url: projectName + '/managerAppointment/deleteAppointment',
            async: false,
            data: "id="+data,
            success: function(data) {
            	status = 1;
            },
            error: function(XMLHttpRequest,strError,strObject){
            	alert("请联系Our develop team");
            	throw error("this is to abor js code");
            }
        });
       return status;
    }
});
