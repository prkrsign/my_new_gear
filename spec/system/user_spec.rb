require 'rails_helper'

RSpec.describe 'ユーザーログイン機能', type: :system do

    describe  'ユーザーが新規登録済みの場合' do
        before do
            user= FactoryBot.create(:user)
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

        it '既存ユーザーが間違ったパスワードを入力した場合、ログインできない' do
            visit new_user_session_path
            fill_in 'Email', with: 'testman@yahoo.co.jp'
            fill_in 'Password', with: 1234568
            click_button 'Log in'
            expect(page).to have_content 'Log in'
        end
    end

    describe  'ユーザーが新規登録未完了の場合' do
        it 'ユーザーがログインページに遷移してDBに存在しない値を打ち込んでも、ログインできない' do
            visit new_user_session_path
            fill_in 'Email', with: 'testman@yahoo.co.jp'
            fill_in 'Password', with: 1234567
            click_button 'Log in'
            expect(page).to have_content 'Log in'
        end
    end
end