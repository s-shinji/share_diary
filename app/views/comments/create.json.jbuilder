  json.id @comment.id
  json.text @comment.text
  json.topic_id @topic.id
  json.tweet_id @tweet.id
  json.user_id  current_user.id
  json.user_avatar  current_user.avatar.url