//	Nicer than alerts, the inbuilt js_error message
function js_error(msg)
{
	$('.js_error span.js_error_text').html( msg );
	$('.js_error').slideToggle().delay(6000).slideToggle();
	return true;
}

$(function ()
{
	//	Toggle states of sideboxes
	$('.toggle').click(function(){
	
		//	Get current state and box_id
		var id		=	$(this).parent().parent().attr('id');	// i.e. 'box_dashboard'
		var state	=	$(this).html();
		var new_state, new_button_value;
		if ( state === 'open')
		{
			new_state = 'open';
			new_button_value = 'close';
		}
		else
		{
			new_state = 'close';
			new_button_value = 'open';
		}
		//	Hide with a wee slide
		$(this).parent().next('.container').slideToggle();
		//	Change content
		$(this).html(new_button_value);
		//	Update local storage
		if (typeof(localStorage) === 'undefined' ) {
			js_error("You are using a non HTML5 browser. If you want me to remember your preferences, upgrade to Chrome, Safari or Firefox!");
		} else {
			//	Get and set order of current sideboxes
			try {
				localStorage.setItem(id, new_state); //saves to the database, "key", "value"
			} catch (e) {
				js_error('Sorry, there was a problem storing the state of the sideboxes. It may be that you are out of memory.');
			}
			//	Now, silence!
			//	GET: localStorage.getItem(id);
		}
		//	Prevent default action
		return false;
		
	});
	
	//	Get the stored sidebox variables and set their states
	$('.box').each(function(index) {
		var id = $(this).attr('id');
		var state = localStorage.getItem(id);
		if( state === 'close' )
		{
			$(this).find('.container').hide();
			$(this).find('.toggle').html('open');
		}
	});
	
	//	Toggle state of the header
	$('.toggle-header').click(function(){
		
		var state = $(this).find('img').attr('class');
		var new_state;
		if (state === 'up')
		{
			$('.header').slideUp();
			$(this).find('img').attr('class', 'down');
			$(this).find('img').attr('src', window.NAILS_URL + 'img/admin/head_slide_down.png');
			new_state = 'down';
		}else{
			$('.header').slideDown();
			$(this).find('img').attr('class', 'up');
			$(this).find('img').attr('src', window.NAILS_URL + 'img/admin/head_slide_up.png');
			new_state = 'up';
		}
		
		if (typeof(localStorage) === 'undefined' ) {
			js_error("You are using a non HTML5 browser. If you want me to remember your display preferences, upgrade to Chrome, Safari or Firefox!");
		} else {
			//	Get and set order of current sideboxes
			try {
				localStorage.setItem('header', new_state); //saves to the database, "key", "value"
			} catch (e) {
				js_error('Sorry, there was a problem storing the state of the header. It may be that you are out of memory.');
			}
			//	Now, silence!
			//	GET: localStorage.getItem(id);
		}
		//	Prevent default action
		return false;
		
	});
	
	//	Get the stored varible for the header state
	$('.toggle-header').each(function(index) {
		var state = localStorage.getItem('header');
		if( state === 'down' )
		{
			$('.header').hide();
			$(this).find('img').attr('class', 'down');
			$(this).find('img').attr('src', window.NAILS_URL + 'img/admin/head_slide_down.png');
		}
	});
	
	//	Generic tipsy
	$( '*[rel=tooltip]' ).tipsy({
		fade: true
	});
	$( '*[rel=tooltip-n]' ).tipsy({
		fade: true,
		gravity: 'e'
	});
	$( '*[rel=tooltip-t]' ).tipsy({
		fade: true,
		gravity: 's'
	});
	$( '*[rel=tooltip-b]' ).tipsy({
		fade: true,
		gravity: 'n'
	});
	$( '*[rel=tooltip-r]' ).tipsy({
		fade: true,
		gravity: 'w'
	});
	$( '*[rel=tooltip-l]' ).tipsy({
		fade: true,
		gravity: 'e'
	});
	$( '*[rel=tooltip-t-html]' ).tipsy({
		fade: true,
		gravity: 's',
		html: true
	});
	$( '*[rel=tooltip-b-html]' ).tipsy({
		fade: true,
		gravity: 'n',
		html: true
	});
	
	//	Filter boxes
	
	if ( $( '.filter-box input[type=text]' ).val() )
	{
		//	There is content so specify the long width
		$( '.filter-box input[type=text]' ).css( 'width', '89%' );
	}
	
	$( '.filter-box input[type=text]' ).focus(
	function()
	{
		$(this).stop().animate({ width: '89%'}, 250);
	}).blur(
	function()
	{
		//	Only hide the element if there's no data
		if ( ! $(this).val() )
		{
			$(this).stop().delay(1000).animate({ width: 125}, 250);
		}
	});
	
});