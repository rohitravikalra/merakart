/* Write here your custom javascript codes */
$(function(){
	setActivePage();
});

function setActivePage(){
	if(/about_us/.exec(window.location.href)){
		$('.dropdown.active').removeClass('active');
		$('.about-us').addClass('active');
	}
}