require 'rails_helper'

RSpec.describe 'レビュー機能', type: :system do

  describe  '投稿機能' do
    context '既存ユーザーが新規投稿する場合' do
      before do
        user= FactoryBot.create(:user)
        visit new_user_session_path
        fill_in 'メールアドレス', with: 'testman@yahoo.co.jp'
        fill_in 'パスワード', with: '1234567'
        click_button 'My New Gearにログイン'
      end

      it 'userが投稿ページに遷移できる' do
        visit new_gear_path
        expect(page).to have_content '機材の情報を入力'
      end

      it '投稿ページで全項目を記載した場合に、投稿内容が一覧ページに反映される' do
        visit new_gear_path
        attach_file "gear[image]", "#{Rails.root}/spec/files/jisaku.png", visible: false
        fill_in 'gear_gearname', with: 'Plumes'
        select "Overdrive", from: "gear_category_id"
        select "Boss", from: "gear_maker_id"
        fill_in 'cost_point', with: '20'
        fill_in 'sound_point', with: '20'
        fill_in 'design_point', with: '20'
        fill_in 'durability_point', with: '20'
        fill_in 'dissatisfaction_point', with: '20'
        fill_in 'gear_title', with: 'デラックス版「TS808DX」'
        fill_in 'gear_review', with: 'これまでたくさんのオーバードライブを購入しましたが、ここに結論がありました。BOSSらしいと言えばそこまでですが、これがBOSSのひとつの回答だと思います。つまみをどの位置にしても良い音がでます。ブースターとして、クランチとして、軽めのディストーションとして。オールラウンダーです。'
        click_button 'レビューを投稿する'
        expect(page).to have_content 'デラックス版「TS808DX」'
      end
    end
  end

  describe '一覧表示' do
    context 'ユーザーAが投稿した時' do
      before do
        userA = FactoryBot.create(:user)
        FactoryBot.create(:gear, user: userA)
        visit new_user_session_path
        fill_in 'メールアドレス', with: 'testman@yahoo.co.jp'
        fill_in 'パスワード', with: '1234567'
        click_button 'My New Gearにログイン'
      end

      it '投稿一覧ページで、ユーザーAはユーザーAの投稿を見ることができる' do
        visit root_path
        expect(page).to have_content 'デラックス版「TS808DX」'
      end

      context 'ユーザーBがログインした場合' do
        before do
            click_on('マイページ')
            userB = FactoryBot.create(:user, email: 'testman2@yahoo.co.jp')
            visit new_user_session_path
            fill_in 'メールアドレス', with: 'testman2@yahoo.co.jp'
            fill_in 'パスワード', with: '1234567'
            click_button 'My New Gearにログイン'
        end

        it '投稿一覧ページで、ユーザーBはユーザーAの投稿を見ることができる' do
            expect(page).to have_content 'デラックス版「TS808DX」'
        end
      end

      context 'アカウントを持たないユーザーの場合' do
        before do
          click_on('マイページ')
        end

        it '投稿一覧ページで、アカウントを持たないユーザーはユーザーAの投稿を見ることができる'do
          expect(page).to have_content 'ログアウトしました'
          expect(page).to have_content 'デラックス版「TS808DX」'
        end
      end
    end
  end

  describe  '詳細表示機能' do
    context 'アカウントを持たないユーザーの場合' do
      before do
        gear = FactoryBot.create(:gear)
        visit root_path
      end

      it '一覧ページから詳細ページに遷移できる' do
        click_on('デラックス版「TS808DX」')
        expect(page).to have_content 'これまでたくさんのオーバードライブを購入しましたが、ここに結論がありました。BOSSらしいと言えばそこまでですが、これがBOSSのひとつの回答だと思います。つまみをどの位置にしても良い音がでます。ブースターとして、クランチとして、軽めのディストーションとして。オールラウンダーです。'
      end

      it '詳細ページで編集ボタン、削除ボタンが表示されない' do
        click_on('デラックス版「TS808DX」')
        expect(page).to have_no_link '編集'
        expect(page).to have_no_button '削除'
      end
    end

    context '詳細ページの投稿者と、閲覧者のアカウントが同じ場合' do
      before do
        user = FactoryBot.create(:user)
        gear = FactoryBot.create(:gear, user: user)
        visit new_user_session_path
        fill_in 'メールアドレス', with: 'testman@yahoo.co.jp'
        fill_in 'パスワード', with: '1234567'
        click_button 'My New Gearにログイン'
      end

      it '一覧ページから詳細ページに遷移できる' do
        click_on('デラックス版「TS808DX」')
        expect(page).to have_content 'これまでたくさんのオーバードライブを購入しましたが、ここに結論がありました。BOSSらしいと言えばそこまでですが、これがBOSSのひとつの回答だと思います。つまみをどの位置にしても良い音がでます。ブースターとして、クランチとして、軽めのディストーションとして。オールラウンダーです。'
      end

      it '詳細ページで編集ボタン、削除ボタンが表示される'do
        click_on('デラックス版「TS808DX」')
        expect(page).to have_link '編集'
        expect(page).to have_button '削除'
      end
    end

    context '詳細ページの投稿者と、閲覧者のアカウントが違う場合' do
      before do
        userA = FactoryBot.create(:user)
        userB = FactoryBot.create(:user, email: 'testB@yahoo.co.jp')
        gear = FactoryBot.create(:gear, user: userA)
        visit new_user_session_path
        fill_in 'メールアドレス', with: 'testB@yahoo.co.jp'
        fill_in 'パスワード', with: '1234567'
        click_button 'My New Gearにログイン'
      end

      it '一覧ページから詳細ページに遷移できる' do
        click_on('デラックス版「TS808DX」')
        expect(page).to have_content 'これまでたくさんのオーバードライブを購入しましたが、ここに結論がありました。BOSSらしいと言えばそこまでですが、これがBOSSのひとつの回答だと思います。つまみをどの位置にしても良い音がでます。ブースターとして、クランチとして、軽めのディストーションとして。オールラウンダーです。'
      end

      it '詳細ページで編集ボタン、削除ボタンが表示される'do
        click_on('デラックス版「TS808DX」')
        expect(page).to have_no_link '編集'
        expect(page).to have_no_button '削除'
      end

    end
  end
end