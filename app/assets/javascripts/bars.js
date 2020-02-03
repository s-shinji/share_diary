$(document).on('turbolinks:load', function() {
  $(".bars-show").click(
    function(){
      $(".bars-list").fadeToggle();
    }
  );

  $(".list").click(function(){
    var $list__item = $(this).find(".list__item")
    if($list__item.hasClass("open")) {
      $list__item.removeClass("open");
      $list__item.slideUp();
      $(this).find('span').text('+');
    } else {
      $list__item.addClass("open");
      $list__item.slideDown();
      $(this).find('span').text('-')

    };
  });
});