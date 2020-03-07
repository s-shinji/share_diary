$(document).on('turbolinks:load', function() {
  $('#call-modal').click(function(){
    $('#new-modal').fadeIn();
  });
  
  $('.close-modal').click(function(){
    $('#new-modal').fadeOut();
  });
  
  
});
