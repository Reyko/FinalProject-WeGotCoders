jQuery(function($) {
  $('#new_user').submit(function(event) {
    var type = $("#user_type option:selected").text();
    if(type === "Seller"){
      var $sellerForm = $(this);
      console.log("got it");
      // Disable the submit button to prevent repeated clicks
      $sellerForm.find('button').prop('disabled', true);

      Stripe.bankAccount.createToken({
        country: $('.country').val(),
        routingNumber: $('.routing-number').val(),
        accountNumber: $('.account-number').val()
      }, stripeResponseHandlerSeller);

      // Prevent the sellerForm from submitting with the default action
      return false;
    };
  });
});



function stripeResponseHandlerSeller(status, response) {
  var $sellerForm = $('#new_user');

  if (response.error) {
    // Show the errors on the sellerForm
    console.log("error");
    $sellerForm.find('.seller-errors').css("display","block")
    $sellerForm.find('.seller-errors').text(response.error.message);
    $sellerForm.find('button').prop('disabled', false);
  } else {
    // response contains id and card, which contains additional card details
    var token = response.id;
    console.log(token);
    // Insert the token into the sellerForm so it gets submitted to the server
    $sellerForm.append($('<input type="hidden" name="user[stripe_token]" />').val(token));
    // and submit
    $sellerForm.get(0).submit();
  }
};