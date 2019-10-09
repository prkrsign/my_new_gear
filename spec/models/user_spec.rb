require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'ユーザー新規登録' do

    it "全ての必須項目を入れた場合、アカウント登録ができる" do
      user = FactoryBot.build(:user)
      user.valid?
      expect(user).to be_valid
    end

    describe 'ユーザー新規登録(usernameの妥当性確認)' do

      it "usernameがnilの場合、アカウント登録ができない" do
        user = FactoryBot.build(:user,username: 'aaaaabbbbbccccc')
        user.valid?
        expect(user.errors[:username]).to include("can't be blank")
      end




    end
  end

end
