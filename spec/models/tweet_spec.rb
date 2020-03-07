require 'rails_helper'
describe Tweet do
  describe '#create' do

    context '保存可能' do
      it "タイトルとコンテンツがある場合有効" do
        tweet = build(:tweet)
        expect(tweet).to be_valid 
      end
      it "20文字を超えないタイトルは有効" do
        tweet = build(:tweet, title:"aiueoaiueoaiueo")
        expect(tweet).to be_valid
      end
    end

    context '保存不可' do
      it "タイトル無しは無効" do
        tweet = build(:tweet, title: nil)
        tweet.valid?
        expect(tweet.errors[:title]).to include("を入力してください")
      end
      it "コンテンツ無しは無効" do
        tweet = build(:tweet, content: nil)
        tweet.valid?
        expect(tweet.errors[:content]).to include("を入力してください")
      end
      it "user_id無しは無効" do
        tweet = build(:tweet, user_id: nil)
        tweet.valid?
        expect(tweet.errors[:user]).to include()
      end
      it "topic_id無しは無効" do
        tweet = build(:tweet, topic_id: nil)
        tweet.valid?
        expect(tweet.errors[:topic]).to include()
      end
      it "20文字を超えるタイトルは無効" do
        tweet = build(:tweet, title:"aiueoaiueoaiueoaiueoa")
        tweet.valid?
        expect(tweet.errors[:title]).to include("は20文字以内で入力してください")
      end
    end
    
  end
end