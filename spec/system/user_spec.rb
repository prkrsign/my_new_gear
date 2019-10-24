require 'rails_helper'

RSpec.describe 'サインアップ、ログイン、ログアウト機能', type: :system do
  describe 'サインアップ機能'do
    before do 
      visit  new_user_registration_path
    end

    context '新しいメールアドレスとパスワード打ち込んだ場合' do 
      before do 
        fill_in 'ユーザー名', with: 'あいうえお'
        fill_in 'メールアドレス', with: 'testman@yahoo.co.jp'
        fill_in 'パスワード', with: 1234567
        click_button '新規会員登録'
      end

      it '新規ユーザー登録できる' do 
        expect(page).to have_content 'アカウント登録を受け付けました'
      end
    end

    context '登録済みのメールアドレスを打ち込んだ場合' do
      before do 
        user = FactoryBot.create(:user)
        fill_in 'ユーザー名', with: 'あいうえお'
        fill_in 'メールアドレス', with: 'testman@yahoo.co.jp'
        fill_in 'パスワード', with: 1234567
        click_button '新規会員登録'
      end

      it '新規ユーザー登録ができない' do
        expect(page).to have_content 'メールアドレスはすでに存在します'          
      end
    end
  end

  describe 'ログイン機能' do
    context 'ユーザー登録完了済がいる場合' do
      before do
        user= FactoryBot.create(:user)
        visit new_user_session_path
      end

      it '正しいメールアドレスとパスワードを入力した場合、ログインできる' do
        fill_in 'メールアドレス', with: 'testman@yahoo.co.jp'
        fill_in 'パスワード', with: 1234567
        click_button 'My New Gearにログイン'
        expect(page).to have_link 'ログアウト'
      end

      it '既存ユーザーが間違ったEmailを入力した場合、ログインできない' do
        fill_in 'メールアドレス', with: 'testmam@yahoo.co.jp'
        fill_in 'パスワード', with: 1234567
        click_button 'My New Gearにログイン'
        expect(page).to have_content 'My New Gearにログイン'
      end

      it '既存ユーザーが間違ったパスワードを入力した場合、ログインできない' do
        fill_in 'メールアドレス', with: 'testman@yahoo.co.jp'
        fill_in 'パスワード', with: 1234568
        click_button 'My New Gearにログイン'
        expect(page).to have_content 'My New Gearにログイン'
      end
    end

    context 'ユーザーが登録未完了の場合' do
      before do
        visit new_user_session_path
      end

      it 'DBに存在しない値を打ち込んでも、ログインできない' do
        fill_in 'メールアドレス', with: 'testman@yahoo.co.jp'
        fill_in 'パスワード', with: 1234567
        click_button 'My New Gearにログイン'
        expect(page).to have_content 'My New Gearにログイン'
      end
    end
  end

  describe 'ログアウト機能' do
    context 'ユーザーがログインしている場合' do
      before do
        user = FactoryBot.create(:user)
        visit new_user_session_path
        fill_in 'メールアドレス', with: 'testman@yahoo.co.jp'
        fill_in 'パスワード', with: 1234567
        click_button 'My New Gearにログイン'
      end

      it 'ログアウトができる' do
        visit root_path
        click_link 'ログアウト'
        expect(page).to have_content 'ログアウトしました'
      end
    end

    context 'ユーザーがログインしていない場合' do
      it 'ログアウトボタンが表示されない' do
        visit root_path
        expect(page).to have_no_content 'ログアウト'
      end
    end
  end
end