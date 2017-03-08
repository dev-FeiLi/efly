
define(function(require,exports,module){
    var appointments_data = require("./indexData");
    var index_view = require("./indexView");
    var data = appointments_data.getAllAppointmentData();
    index_view.init(data);
});
