$(document).on('turbolinks:load', function() {
  $("#user_avatar").change(function(){
    var file = this.files[0];
    var reader = new FileReader();
    reader.readAsDataURL(file);
    reader.onload = function() {
      var src = this.result;
      $(".avatar-image").attr('src', `${src}`);
    }
  })
});