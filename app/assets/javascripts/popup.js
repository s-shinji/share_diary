$(document).on('turbolinks:load', function() {
  $(".new-tweet").hover(function(){
    $("#popup").fadeToggle();
  });
});