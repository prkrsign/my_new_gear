require 'rails_helper'

RSpec.describe 'ユーザーログイン機能', type: :system do

    describe  'ユーザーをDBにセット' do
        before do
            user_a = FactoryBot.create(:user)
        end

        it '既存ユーザーがログインページに遷移し、ログインできる' do
            visit new_user_session_path
            fill_in 'Email', with: 'testman@yahoo.co.jp'
            fill_in 'Password', with: 1234567
            click_button 'Log in'
            expect(page).to have_content 'ログアウト'
        end

        it '既存ユーザーが間違ったEmailを入力した場合、ログインできない' do
            visit new_user_session_path
            fill_in 'Email', with: 'testmam@yahoo.co.jp'
            fill_in 'Password', with: 1234567
            click_button 'Log in'
            expect(page).to have_content 'Log in'
        end

    end
end