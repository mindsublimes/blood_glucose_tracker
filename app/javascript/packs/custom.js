$(document).on('turbolinks:load', function() {
	$('body').on('change', '#filter', function(){
		if ($(this).val() == "date_range") {
			$("#date").removeClass("hide")
		} else {
			$("#date").addClass("hide")
		}
	});
});