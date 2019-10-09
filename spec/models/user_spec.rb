require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'ユーザー新規登録' do
    it "全ての必須項目を入れた場合、アカウント登録ができる" do
      user = FactoryBot.build(:user)
      user.valid?
      expect(user).to be_valid
    end



    describe 'ユーザー新規登録(usernameの妥当性確認)' do
      it "usernameが1文字の場合、アカウント登録ができる" do
        user = FactoryBot.build(:user, username: 'あ')
        user.valid?
        expect(user).to be_valid
      end

      it "usernameが15文字の場合、アカウント登録ができる" do
        user = FactoryBot.build(:user, username: 'あああああいいいいいううううう')
        user.valid?
        expect(user).to be_valid
      end

      it "usernameがnilの場合、アカウント登録ができない" do
        user = FactoryBot.build(:user,username: nil)
        user.valid?
        expect(user.errors[:username]).to include("を入力してください")
      end

      it "usernameが16文字以上の場合、アカウント登録ができない" do
        user = FactoryBot.build(:user,username: 'あああああいいいいいうううううえ')
        user.valid?
        expect(user.errors[:username]).to include("は15文字以内で入力してください")
      end
    end



    describe 'ユーザー新規登録(emailの妥当性確認)' do
      it "emailがnilの場合、アカウント登録ができない" do
        user = FactoryBot.build(:user, email: nil)
        user.valid?
        expect(user.errors[:email]).to include("を入力してください")
      end

      it "emailが重複しているの場合、アカウント登録ができない" do
        user_a = FactoryBot.create(:user)
        user_b = FactoryBot.build(:user)
        user_b.valid?
        expect(user_b.errors[:email]).to include("はすでに存在します")
      end

      it "emailがフォーマットに準拠していない場合、アカウント登録ができない" do
        user = FactoryBot.build(:user, email: 'aaaa')
        user.valid?
        expect(user.errors[:email]).to include("は不正な値です")
      end

      it "@より前に値がない場合、アカウント登録ができない" do
        user = FactoryBot.build(:user, email: '@aaaa')
        user.valid?
        expect(user.errors[:email]).to include("は不正な値です")
      end

      it "@より後に値がない場合、アカウント登録ができない" do
        user = FactoryBot.build(:user, email: 'aaaa@')
        user.valid?
        expect(user.errors[:email]).to include("は不正な値です")
      end

      it "emailにカナ文字が含まれる場合、アカウント登録できない" do
        user = build(:user, email: "aaあa@aaa")
        user.valid?
        expect(user.errors[:email]).to include("は不正な値です")
      end
    end


    describe 'ユーザー新規登録(favoriteの妥当性確認)' do
      it "favoriteがnilの場合、アカウント登録できない" do
        user = build(:user, favorite: nil)
        user.valid?
        expect(user.errors[:favorite]).to include("を入力してください")
      end
    end

    describe 'ユーザー新規登録(profileの妥当性確認)' do
      
    end


  end

end
