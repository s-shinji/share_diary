# share_diary

## * 概要:日々の出来事を写真やテキストで日記に記録し、共通の趣味を持つ人たちと繋がれるSNS

## 機能、使用技術一覧

* 日記投稿機能
* コメント機能
* トピック登録機能
* トピックお気に入り機能
* いいね機能
* フォロー機能

* ruby 2.5.1p57, Rails 5.2.4.1,haml,sass,jQuery
* インフラ:AWS
* DB:MySQL

## アプリ内容

# 本アプリは日々の出来事を日記形式で記録することで、人々との交流を促進する。
# 使用用途は共通の趣味を持つ人たちとの出会い、学習、ビジネス展開など多岐にわたる。

# share_diary DB設計
## usersテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false, unique: true|
|email|string|null: false, unique: true,default: ""|
|password|string|null: false, unique: true,default: ""|
|avatar|string|
|introduce|string|

### Association
- has_many :tweets
- has_many :comments
- has_many :likes
- has_many :favorites
- has_many :relationships
- has_many :followings, through: :relationships, source: :follow
- has_many :reverse_of_relationships, class_name: 'Relationship', foreign_key: 'follow_id'
- has_many :followers, through: :reverse_of_relationships, source: :user

## topicsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|index: true|
|favorites_count|integer|

### Association
- has_many :tweets
- has_many :comments
- has_many :favorites

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
|title|string|null:false|
|content|text|null:false|
|likes_count|integer|
|user_id|references|null: false, foreign_key: true|
|topic_id|references|null: false, foreign_key: true|

### Association
- has_many :comments
- belongs_to :user
- belongs_to :topic
- has_many :images
- has_many :likes

## imagesテーブル
|Column|Type|Options|
|------|----|-------|
|src|string||
|tweet_id|references|null: false, foreign_key: true|

### Association
- belongs_to :tweet

## likesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references||
|tweet_id|references||

### Association
- belongs_to :user
- belongs_to :tweet

## favoritesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references||
|topic_id|references||

### Association
- belongs_to :user
- belongs_to :topic

## relationshipsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references||
|follow_id|references||

### Association
- belongs_to :user
- belongs_to :follow, class_name: 'User'


