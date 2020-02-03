# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# share_diary DB設計
## usersテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false, unique: true|
|email|string|null: false, unique: true,default: ""|
|password|string|null: false, unique: true,default: ""|

### Association
-has_many :user_topics
-has_many :topics, through: :user_topics
-has_many :tweets
-has_many :comments

## topicsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|index: true|

### Association
- has_many :user_topics
- has_many :users, through: :user_topics
- has_many :tweets
- has_many :comments

## user_topicsテーブル

|Column|Type|Options|
|------|----|-------|
|topic_id|references|null: false, foreign_key: true|
|user_id|references|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :topic

## commentsテーブル

|Column|Type|Options|
|------|----|-------|
|text|text|
|user_id|references|null: false, foreign_key: true|
|tweet_id|references|null: false, foreign_key: true|
|topic_id|references|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :tweet
- belongs_to :topic

## tweetsテーブル
|Column|Type|Options|
|------|----|-------|
|content|text|
|image|string|
|user_id|references|null: false, foreign_key: true|
|topic_id|references|null: false, foreign_key: true|


### Association
- has_many :comments
- belongs_to :user
- belongs_to :topic

