require 'rails_helper'
describe User do
  describe '#create' do
    context '保存可能' do
      it "nameとemail、passwordとpassword_confirmationが存在すれば登録できること" do
        user = build(:user)
        expect(user).to be_valid
      end
      it "passwordが6文字以上であれば登録できること" do
        user = build(:user, password: "000000", password_confirmation: "000000")
        user.valid?
        expect(user).to be_valid
      end
      
      
    end
    context '保存不可' do
      it "nameが空では登録できないこと" do
        user = build(:user, name: nil)
        user.valid?
        expect(user.errors[:name]).to include("を入力してください")
      end
      it "emailが空では登録できないこと" do
        user = build(:user, email: nil)
        user.valid?
        expect(user.errors[:email]).to include("を入力してください")
      end
      it "passwordが空では登録できないこと" do
        user = build(:user, password: nil)
        user.valid?
        expect(user.errors[:password]).to include("を入力してください")
      end
      it "passwordが存在してもpassword_confirmationが空では登録できないこと" do
        user = build(:user, password_confirmation: nil)
        user.valid?
        expect(user.errors[:password_confirmation]).to include()
      end
      it "重複したemailが存在する場合登録できないこと" do
        user = create(:user)
        another_user = build(:user, email: user.email)
        another_user.valid?
        expect(another_user.errors[:email]).to include("はすでに存在します")
      end
      it "passwordが5文字以下であれば登録できないこと" do
        user = build(:user, password: "00000", password_confirmation: "00000")
        user.valid?
        expect(user.errors[:password]).to include("は6文字以上で入力してください")
      end
    end
  end
end
