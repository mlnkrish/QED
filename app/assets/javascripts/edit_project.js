$(document).ready(
	function () {
	  	$('#project-nav a').click(function (e) {
	  		e.preventDefault();
	  		$(this).tab('show');
		})
})