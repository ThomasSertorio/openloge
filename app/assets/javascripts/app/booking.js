var new_price = function() {
  console.log("higi");
  var duration = parseInt($('#booking_duration').val());
  var price_u = parseInt($('#data-price').data('price'));
  var price = duration * price_u;
  console.log(price);
  $('#price').html(price);
}

