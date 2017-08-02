$(document).ready(function () {
    $('.expand-button').click(function (e) {
        e.preventDefault();
        e.stopPropagation();
        
        $(e.currentTarget).parents('tr').toggleClass('expanded');
        
    });
    
    $('.upload-table').on('click', '.upload-remover', function (e) {
        e.preventDefault();
        e.stopPropagation();
        
        var n = $('tr').index($(e.target).parents('#upload-table-body .file'));
        
        file_queue.splice(n - 1, 1);
        Output();
    });
    
    $('#package-submit').click(function (e) {
        e.preventDefault();
        e.stopPropagation();
        
        var num_items = $('.package-table tbody tr').length;
        
        var today = new Date();
        var y = today.getFullYear();
        var m = today.getMonth() + 1;
        var d = today.getDate();
        
        for (var i = 0; i < file_queue.length; i++) {
            $('.package-table tbody').append('<tr><td>' + (num_items + i + 1) + '</td>' + 
                                        '<td>' + file_queue[i].name + '</td>' + 
                                        '<td>-</td>' + 
                                        '<td>-</td>' + 
                                        '<td>-</td>' + 
                                        '<td>-</td>' + 
                                        '<td>-</td>' + 
                                        '<td>' + m + '/' + d + '/' + y + '</td>' + 
                                        '<td>-</td>' + 
                                        '<td><span class="progress-status">Uploading</span><div class="progress">' + 
                                        '<div class="progress-bar progress-bar-primary progress-bar-striped active" role="progressbar" aria-valuenow="82" aria-valuemin="0" aria-valuemax="100" style="width: 82%;">' + 
                                        '<span class="sr-only">82% Complete</span>' + 
                                        '</div></div></td>' + 
                                        '<td><a class="package-info"><span class="action-button info-button"><i class="md md-info"></i></span></a><a class="delete-job"><span class="action-button delete-button"><i class="ti-trash"></i></span></a></td>' +
                                        '</tr>' 
                                       );
        }
        
        $('.upload-package-modal').modal('hide');
    });
    
    $('.pane-title').click(function (e) {
        e.preventDefault();
        e.stopPropagation();
        
        var pane = $(e.target).parents('.row').find('.pane-content');
        pane.toggleClass('active');
        $('.indicator .fa').toggleClass('hide');
    });
    
    $('.job-details-closer').click(function (e) {
        $(e.currentTarget).parents('tr').removeClass('expanded');
    });
    
    /** Jobs individual menu **/
    //$('.popover-content').html('<span class="fa fa-download"></span><span class="md md-pause"></span>');
    //console.log('popovver-content: ' + $('.popover-content').length);
    
    if ($('.job-chart').length > 0) {
        $('.job-chart').sparkline([0, 23, 43, 35, 44, 45, 56, 37, 40], {
            type: 'line',
            width: '165',
            height: '165',
            chartRangeMax: 50,
            lineColor: '#3bafda',
            fillColor: 'rgba(59,175,218,0.3)',
            highlightLineColor: 'rgba(0,0,0,.1)',
            highlightSpotColor: 'rgba(0,0,0,.2)',
        });

        $('.job-chart').sparkline([25, 23, 26, 24, 25, 32, 30, 24, 19], {
            type: 'line',
            width: '165',
            height: '165',
            chartRangeMax: 40,
            lineColor: '#5d9cec',
            fillColor: 'rgba(93, 156, 236, 0.3)',
            composite: true,
            highlightLineColor: 'rgba(0,0,0,.1)',
            highlightSpotColor: 'rgba(0,0,0,.2)',
        });
    }
    
    /*$('.upload-table').on('click', '.upload-remover', function (e) {
        e.preventDefault();
        e.stopPropagation();
        
        console.log('target: ' + $('tr').index(e.target.parents('tr')));
    });*/
});

var file_queue = [];
var markup = '';
//
// output information
function Output() {
    markup = '';
    
    for (var i = 0; i < file_queue.length; i++) {
        ParseFile(file_queue[i], i);
    }
    
	var m = $('#upload-table-body');
	//m.innerHTML = m.innerHTML + msg;
    m.html(markup);
}
// call initialization file
if (window.File && window.FileList && window.FileReader && $('.package-table').length > 0) {
	Init();
}

//
// initialize
function Init() {

	var fileselect = $('#fileselect'),
		filedrag = $('#filedrag'),
		submitbutton = $('#package-submit');

	// file select
	fileselect[0].addEventListener('change', FileSelectHandler, false);

	// is XHR2 available?
	var xhr = new XMLHttpRequest();
	if (xhr.upload) {
	
		// file drop
		filedrag[0].addEventListener('dragover', FileDragHover, false);
		filedrag[0].addEventListener('dragleave', FileDragHover, false);
		filedrag[0].addEventListener('drop', FileSelectHandler, false);
		
		// remove submit button
		//submitbutton.style.display = "none";
	}

}

// file drag hover
function FileDragHover(e) {
	e.stopPropagation();
	e.preventDefault();
	//e.target.className = (e.type == "dragover" ? "hover" : "");
    e.type == 'dragover' ? $(e.target).addClass('hover') : $(e.target).removeClass('hover');
}

// file selection
function FileSelectHandler(e) {

	// cancel event and hover styling
	FileDragHover(e);

	// fetch FileList object
	var files = e.target.files || e.dataTransfer.files;

	// process all File objects
    //markup = '';
	for (var i = 0, f; f = files[i]; i++) {
        file_queue.push(f);
		//ParseFile(f, i);
	}
    
    Output();

}

function ParseFile(file, index) {

	/*Output(
		"<p>File information: <strong>" + file.name +
		"</strong> type: <strong>" + file.type +
		"</strong> size: <strong>" + file.size +
		"</strong> bytes</p>"
        );*/
        markup += '<tr class="file"><td>' + (index + 1) + '</td><td>' + file.name + '</td><td>' + file.name + '</td><td><a class="delete-package upload-remover"><span class="action-button delete-button"><i class="ti-trash"></i></span></a></td></tr>';
	
}

function removeFile(i) {
    file_queue = file_queue.splice(i, 1);
    
    Output();
}

