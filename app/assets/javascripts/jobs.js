//# Place all the behaviors and hooks related to the matching controller here.
//# All this logic will automatically be available in application.js.
//# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready(function() {

	$("#selectcity").change(function(e){

		$("#jobsearchresults").empty();
		e.preventDefault();
		var search = $("#selectcity").val();
		console.log(search);
		$.ajax({
			url: "/student/" + studentId + "/jobs/city/" + search,
			dataType: 'json',
			success: function(data){
				data.forEach(function(e){
						$("#jobsearchresults").append(createHTML(e));
				});
					
					
			}
		});

	});


});

function createHTML(response) {
		return 	"<li class='media' id='eachcompany'><a class='pull-left logo' > image_tag "+ response['avatar'] +
			"</a><div class='media-body'><h3 class='media-heading'>" + response['name'] + " </h3>" +
		    "<h5 class='media-heading'>" + response['brief'] + "</h5><div class='tab-content faq-cat-content'>" +
			"<div class='tab-pane active in fade' id='faq-cat-1'><div class='panel-group' id='accordion-cat-1'>" +
		    "<div class='panel panel-default panel-faq'> " 
		    response['jobs'].forEach(function(job) {
			"<div class='panel-heading'><a data-toggle='collapse' data-parent='#accordion-cat-1' href='#faq-cat-1-sub-"+ job.id + "'>"+
		    "<h4 class='panel-title'>Position:<b> "+ job.role +"</b><span class='pull-right'><i class='glyphicon glyphicon-plus'></i></span>"+
		    "</h4></a></div><div id='faq-cat-1-sub-"+ job.id +"' class='panel-collapse collapse'><div class='panel-body'>" +
		    "Description:<b>"+ job.description + "</b><br>Compensation:<b>"+ job.compensation +"</b>"+
		    //"<%  unless Application.where({job_id: job.id, student_id: @student.id}).exists? %>" + 
		    "<button data-no-turbolink data-toggle= 'modal' data-target='#"+ job.id +"mo' type='button' class='btn btn-primary navbar-btn pull-right"+
		    "pull-bottom applybtn'>Apply</button></div></div><div id='"+job.id+"mo' class='modal fade' tabindex='-1'>"+
			"<div class='modal-dialog'><div class='modal-content'><div class='modal-header'><button type='button' class='close' data-dismiss='modal' aria-hidden='true'>×</button>"+
			"<h4 class='modal-title'>New Application</h4></div><div class='modal-body'><form method='post' action='/student/ @student.id/applications'>"+
			"<%= form_for [@student, @apps] do |f| %><% flash.each do |name, msg| -%><%= content_tag :div, msg, class: name %><% end -%><div class='form-group'>"+
			"<label class=' col-sm-12 col-md-12 col-lg-12 col-xl-12 control-label' for=''><h3>Body<span></span></h3></label><%= f.text_field :body, placeholder: 'Body', class: 'form-control input-lg' %>"+
			"</div><%= f.hidden_field :student_id, :value => @student.id %><%= f.hidden_field :job_id, :value =>"+ job.id +"%><button type='submit' class='btn btn-primary'>Add Post</button>"+
            "<% end %></form></div><div class='modal-footer'></div></div></div></div><% end %></div></div></div></div></div></li>";
});
}



