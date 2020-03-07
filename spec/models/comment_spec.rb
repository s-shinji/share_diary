require 'rails_helper'
describe Comment do
  describe '#create' do
    it 'tweet_idがないと登録できないこと' do
      comment = build(:comment, tweet_id: nil)
      comment.valid?
      expect(comment.errors[:tweet]).to include()
    end
    it 'user_idがないと登録できないこと' do
      comment = build(:comment, user_id: nil)
      comment.valid?
      expect(comment.errors[:user]).to include()
    end
    it 'topic_idがないと登録できないこと' do
      comment = build(:comment, topic_id: nil)
      comment.valid?
      expect(comment.errors[:topic]).to include()
    end
  end
end