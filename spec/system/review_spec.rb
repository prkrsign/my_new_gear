require 'rails_helper'

RSpec.describe 'レビュー機能', type: :system do
  describe '投稿機能' do
    before do
      user = FactoryBot.create(:user)
      gear = FactoryBot.create(:gear)
    end

    context 'ログインしていない場合' do
      before do
        visit root_path
        click_link 'KATANA-AIR'
        click_link 'レビューを投稿'
      end
      it 'レビュー投稿ページに遷移できない' do
        expect(page).to have_content 'ログインしてください'
      end

      context 'ログイン画面に遷移した場合' do
        it 'ログイン後、レビュー投稿ページに遷移する' do
          fill_in 'メールアドレス', with: 'testman@yahoo.co.jp'
          fill_in 'パスワード', with: '1234567'
          click_button 'My New Gearにログイン'
          expect(page).to have_content '機材のレビューを入力'
        end
      end
    end

    context 'ログインしている場合' do
      before do
        visit new_user_session_path
        fill_in 'メールアドレス', with: 'testman@yahoo.co.jp'
        fill_in 'パスワード', with: '1234567'
        click_button 'My New Gearにログイン'
        visit root_path
        click_link 'KATANA-AIR'
        click_link 'レビューを投稿'
      end

      it 'レビュー投稿画面に遷移できる' do
        expect(page).to have_content '機材のレビューを入力'
      end

    end
  end

  describe '編集機能' do
    before do
      user = FactoryBot.create(:user)
      gear = FactoryBot.create(:gear)
    end
  end
end