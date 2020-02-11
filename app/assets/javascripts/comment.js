$(document).on('turbolinks:load', function() {
  function buildHTML(comment) {
    if (comment.text) {
      var html = `<div class="comment" data-comment-id="${comment.id}">
                    <div class="comment-bar__avatar" id="right-side">
                      <div class="comment-set">
                        <a class="avatar" href="/topics/${comment.topic_id}/tweets/${comment.tweet_id}/users/${comment.user_id}">
                          <img class="avatar" src="${comment.user_avatar}">
                        </a>
                        <span class="comment-set__text">
                          <p>${comment.text}</p>
                        </span>
                        <a class="comment-btn" data-remote="true" rel="nofollow" data-method="delete" href="/topics/${comment.topic_id}/tweets/${comment.tweet_id}/comments/${comment.id}">削除
                        </a>
                      </div>
                    </div>
                  </div>`
      return html;

    };
  };
  $('#new_comment').on('submit', function(e){
    e.preventDefault();
    var formData = new FormData(this);
    var url = $(this).attr('action');
    $.ajax({
      url: url,
      type: "POST",
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(data){
      var html = buildHTML(data);
      $('.comment-bar').append(html);
      $('.comment-bar').animate({ scrollTop: $('.comment-bar')[0].scrollHeight});
      $("#new_comment")[0].reset();
      $(".submit").prop("disabled", false);   
    })
    .fail(function() {
      alert("メッセージ送信に失敗しました");
      $(".submit").prop("disabled", false);
    });
  }); 
});
  
  