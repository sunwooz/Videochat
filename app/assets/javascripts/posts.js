$('.delete_post').bind('ajax:success', function(e) {
	e.preventDefault();
	$('#thispost').fadeOut();
});