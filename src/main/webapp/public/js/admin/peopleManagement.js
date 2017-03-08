$(document).ready(function() {
      

     	var table = $('#table_1').DataTable();

      	$('#table_1 tbody').on( 'mouseenter', 'td', function () {
            var colIdx = table.cell(this).index().column;
 
            $( table.cells().nodes() ).removeClass( 'highlight' );
            $( table.column( colIdx ).nodes() ).addClass( 'highlight' );
        } );
 
  	  	$('#table_1 tbody').on( 'click', 'tr', function () {
        	if ( $(this).hasClass('selected') ) {
            $(this).removeClass('selected');
        	}
        	else {
            table.$('tr.selected').removeClass('selected');
            $(this).addClass('selected');
        	}
    	});
 
    	$('#button_delete').click( function () {
        	table.row('.selected').remove().draw( false );
    	});
    });
	 
	 
	$('#exampleModal').on('show.bs.modal', function (event) {
		var button = $(event.relatedTarget) // Button that triggered the modal
		var recipient = button.data('whatever') // Extract info from data-* attributes
		// If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
		// Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
	    var modal = $(this)
		modal.find('.modal-title').text('New message to ' + recipient)
		modal.find('.modal-body input').val(recipient)
		$('#myModal').modal('show')
		})