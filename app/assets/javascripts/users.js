$(document).ready(function(){
  Stripe.setPublishableKey($('meta[name="stripe-key"]').attr('content'));
  //Watch for a form submission:
  $('#form-submit-btn').click(function(event){
    event.preventDefault();
    $('input[type=submit]').prop('disable', true);
    var error = false;
    var ccNum = $('#card_number').val();
    var cvcNum = $('#card_code').val();
    var expMonth = $('#card_month').val();
    var expYear = $('#card_year').val();
   
    if (!error){
      // Get the stripe token:
      Stripe.createToken({
        number: ccNum,
        cvc: cvcNum,
        exp_month: expMonth,
        exp_year: expYear
      }, stripeResponseHandler);
    }
    return false;
  });//form submission
  
   function stripeResponseHandler(status, response){
     //get reference to the from:
     var f = $('#new_user');
     
     //get the token from the response
     var token = response.id;
     
     //add the token to the form
     f.append('<input type="hidden" name="user[stripe_card_value]" value="' + token + '" />');
     
     //submit the form:
     f.get(0).submit();
   }
});