require 'rails_helper'
describe Topic do
  describe '#create' do
    context '保存可能' do
      it '25文字を超えないトピック名は有効' do
        topic = build(:topic, name:"aiueokakikukekosasisuseso")
        expect(topic).to be_valid
      end 
    end

    context '保存不可' do
      it '25文字を超えるトピック名は無効' do
        topic = build(:topic, name:"aiueokakikukekosasisusesota")
        topic.valid?
        expect(topic.errors[:name]).to include("は25文字以内で入力してください")
      end 
    end
  end
end