jQuery(function($){
	$.datepicker.regional['en'] = {clearText: 'Clear', clearStatus: '',
		closeText: 'Close', closeStatus: 'Close without modification',
		prevText: '&lt;Prev', prevStatus: 'See previous month',
		nextText: 'Next&gt;', nextStatus: 'See following month',
		currentText: 'Current', currentStatus: 'See current month',
		monthNames: ['January','February','March','April','May','June',
		'July','August','September','October','November','December'],
		monthNamesShort: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
		'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'],
		monthStatus: 'Select another month', yearStatus: 'Select another year',
		weekHeader: 'Wk', weekStatus: '',
		dayNames: ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday'],
		dayNamesShort: ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'],
		dayNamesMin: ['Su','Mo','Tu','We','Th','Fr','Sa'],
		dayStatus: 'Use DD as first day of the week', dateStatus: 'Choose MM, DD d',
		dateFormat: 'mm/dd/yy', firstDay: 0, 
		initStatus: 'Pick a date', isRTL: false};
	$.datepicker.setDefaults($.datepicker.regional['en']);
});