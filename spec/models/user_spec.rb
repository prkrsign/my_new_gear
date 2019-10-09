require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'ユーザー新規登録' do
    it "全ての必須項目を入れた場合、アカウント登録ができる" do
      user = FactoryBot.build(:user)
      user.valid?
      expect(user).to be_valid
    end
  end

end
