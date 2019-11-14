require 'rails_helper'

RSpec.describe 'SNSサインアップ、サインイン機能', type: :system do
  describe 'サインアップ機能' do
    context 'SNS認証未登録の場合' do
      before do
        visit new_user_registration_path
        click_link 'Twitterアカウントで登録'
      end
      
      it 'サインアップ画面に遷移する' 

      it 'フォームにSNSのユーザーネームが登録されている'
    end
  end
end