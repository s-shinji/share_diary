$(document).on('turbolinks:load', function() {
  function selectedTopic(topic) {
    var html = `
      <div>
        <a class="topics" href=  "/topics/${topic.id}/tweets">${topic.name}</a>
      </div>`;
    $("#search-result").append(html);
  }

  function noTopic() {
    var html = `
      <div>
        <p>トピックが見つかりません</p>
      </div>`;
    $("#search-result").append(html);
  }

  $('#search-topics').on('keyup', function(){
    var input = $('#search-topics').val();
    $.ajax({
      type: "GET",
      url: "/topics",
      data: { keyword: input },
      dataType: "json"
    })
    .done(function(topics){
      $("#search-result").empty();
      if (topics.length !== 0) {
        topics.forEach(function(topic) {
          selectedTopic(topic);
        });
      } else if (input.length == 0) {
        return false;
      } else {
        noTopic();
      }
    })
    .fail (function() {
      alert('error');
    }); 
  });
});
