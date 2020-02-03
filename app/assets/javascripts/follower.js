$(document).on('turbolinks:load', function() {
  $(".follower-list").click(function(){
    var $item = $(this).find(".follower-list__item")
    if($item.hasClass("open")) {
      $item.removeClass("open");
      $item.slideUp();
      $(this).find('span').text('+');
    } else {
      $item.addClass("open");
      $item.slideDown();
      $(this).find('span').text('-')

    };
  });
});