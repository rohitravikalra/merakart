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
	$('.form-control').on('focus',function(){
		$(this).removeClass('error-class');
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
	if(/show_product/.exec(this.location.href)){
		qty = $('#qty').val();
	}
	$.get('/add-to-cart', { data_id : id, data_qty : qty }, null, 'script')
}

function modifyCart(ele){
	var qty = 0;
	var old_qty = 1;
	if(ele.value == "+"){
		old_qty = document.getElementById("qty"+ele.attributes.data.value).value
		document.getElementById("qty"+ele.attributes.data.value).value = parseInt(document.getElementById("qty"+ele.attributes.data.value).value)+1+"";
		qty = document.getElementById("qty"+ele.attributes.data.value).value
	}
	else if(ele.value == "-"){
		if(parseInt(document.getElementById("qty"+ele.attributes.data.value).value) > 1){
			old_qty = document.getElementById("qty"+ele.attributes.data.value).value
			document.getElementById("qty"+ele.attributes.data.value).value = parseInt(document.getElementById("qty"+ele.attributes.data.value).value)-1+"";
			qty = document.getElementById("qty"+ele.attributes.data.value).value
		}
	}
	if(/cart-close/.exec(ele.className))
		$.get('/modify-cart', { id : ele.attributes.data.value, qty : qty, old_qty : old_qty, type : 'cart' }, null, 'script')
	else
		$.get('/modify-cart', { id : ele.attributes.data.value, qty : qty, old_qty : old_qty }, null, 'script')
}

function formValidation(e){
	var valuesArr = ["name", "email", "surname", "phone", "shippingAddress", "shippingAddress2", "city", "zip", "state", "country"]
	var formOk = true;
	for( var i = 0; i < valuesArr.length; i++){
		if($("#"+valuesArr[i]).val()==""){
			$('#'+valuesArr[i]).addClass('error-class');
			formOk = false;
		}
	}
	if(formOk){
		$.get('/place-order', { order : $('.shopping-cart').serialize() }, null, 'script')
	}
	else
		e.preventDefault();
}

function formValidate(e){
	var elements = $('.form-control')
	var formOk = true;
	for(var i = 0; i < elements.length; i++){
		$ele = $(elements[i])
		if(/query/.exec($ele.attr('name')) && $ele.val() == ""){
			$ele.addClass('error-class');
			formOk = false;
		}
	}
	if(!formOk)
		e.preventDefault();
}

