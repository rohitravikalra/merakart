/* Write here your custom javascript codes */
$(function(){
	setActivePage();
	$('#submit_review').click(function(e){
		name = $('#name').val();
		email = $('#email').val();
		review = $('#message').val();
		if($('.stars-ratings input:checked').length>0)
			rating = $('.stars-ratings input:checked')[0].id.split('-')[2];
		else
			rating = 0
		id = e.currentTarget.baseURI.split('=')[1]
		$.get('/review',{id:id,name:name,email:email,review:review,rating:rating}, null, 'script'); 
	});
});

function setActivePage(){
	if(/about_us/.exec(window.location.href)){
		$('.dropdown.active').removeClass('active');
		$('.about-us').addClass('active');
	}
}

function addToCart(ele){
	var id = ele.attributes.data.value
	var qty = 1;
	if(/product_show/.exec(this.location.href)){
		qty = $('#qty').val();
	}
	$.get('/add-to-cart', { data_id : id, data_qty : qty }, null, 'script')
}

function modifyCart(ele){
	debugger
}