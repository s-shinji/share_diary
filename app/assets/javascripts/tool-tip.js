$(document).on('turbolinks:load', function() {
  $("#search-topics").keyup(function() {
    $(".tool-tip").css('display','none');
  });
}); 