require 'rails_helper'

RSpec.describe 'SNSサインアップ、サインイン機能', type: :system do
  describe 'サインイン機能' do
    let!(:user) { create(:user) }
    let!(:sns_credential) { create(:sns_credential, user: user) } 

    context 'SNS認証登録済みの場合' do
      before do
        visit new_user_session_path
        click_link 'Twitterアカウントでログイン'
        OmniAuth.config.mock_auth[:twitter] = nil
        Rails.application.env_config['omniauth.auth'] = twitter_mock
      end

      it 'SNS認証ログインできる' do
        binding.pry
        expect(page).to have_content('aaaa')
      end
    end
  end
end