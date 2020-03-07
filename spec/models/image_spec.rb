require 'rails_helper'
describe Image do
  describe '#create' do
    it 'tweet_idがなければ登録できないこと' do
      image = build(:image, tweet_id:nil)
      image.valid?
      expect(image.errors[:tweet]).to include()
    end
  end
end