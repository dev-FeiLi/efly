define(function(require,exports,module){
    exports.getAllAppointmentData = function() {
        var pathName = window.location.pathname;
        var projectName =pathName.substr(0,pathName.substr(1).indexOf('/')+1);
        var rtnData = undefined;
        $.ajax({
            type : "POST",
            url : projectName + '/user/getAllAppoinments',
            async : false,
            dataType : "json",
            success : function(data){
                rtnData = data;
            },
            error: function(XMLHttpRequest,strError,strObject){}
        });
        return rtnData;
    };
});