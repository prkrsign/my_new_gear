require 'rails_helper'

RSpec.describe 'レビュー機能', type: :system do
  let!(:user) { create(:user) }
  let!(:gear) { create(:gear) }

  describe '投稿機能' do
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
        before do
          fill_in 'メールアドレス', with: 'testman@yahoo.co.jp'
          fill_in 'パスワード', with: '1234567'
          click_button 'My New Gearにログイン'
        end

        it 'ログイン後、レビュー投稿ページに遷移する' do
          expect(page).to have_content '機材のレビューを入力'
        end

        it 'クリックした機材と対応したURLに遷移する' do
          expect(current_path).to eq("/gears/#{gear.id}/reviews/new")
        end
      end
    end

    context 'ログインしている場合' do
      before do
        sign_in user
        visit root_path
        click_link 'KATANA-AIR'
        click_link 'レビューを投稿'
      end

      it 'レビュー投稿画面に遷移できる' do
        expect(page).to have_content '機材のレビューを入力'
      end

      it 'クリックした機材と対応したURLに遷移する' do
        expect(current_path).to eq("/gears/#{gear.id}/reviews/new")
      end

      context 'レビュー投稿画面にて、必須項目を全て埋めた場合' do
        before do
          select '1', from: 'review[cost_performance]'
          select '2', from: 'review[sound]'
          select '3', from: 'review[design]'
          select '4', from: 'review[durability]'
          select '5', from: 'review[satisfaction_level]'
          fill_in 'review_title', with: 'Bluetoothとワイヤレスシステムを唯一搭載している'
          fill_in 'review_detail', with: 'タイトルの通り、Bluetoothスピーカーとワイヤレスシステムを搭載している現在のところ唯一のアンプだと思いましたので購入しました。 電源コードひとつでギター演奏と外部音源を鳴らせるのは部屋がすっきりして良いです。 フロントパネルの見た目は好きではないので、フロント部分を下方向に向け、コントロールツマミ部分を正面に向け、アルミラックの上段に置いて使用しています。'
          click_button 'レビューを投稿する'
        end

        it 'レビューの投稿ができる' do
          review = Review.last
          expect(review.title).to eq 'Bluetoothとワイヤレスシステムを唯一搭載している'
        end

        it 'トップページにレビュー数が反映される' do
          visit root_path
          expect(page).to have_content '現在のレビュー数:1'
        end

        it '機材詳細ページに遷移する' do
          review = Review.last
          expect(current_path).to eq("/gears/#{review.gear_id}")
        end

        it '機材詳細ページに、レビューと投稿者が反映される' do
          visit root_path
          click_link 'KATANA-AIR'
          expect(page).to have_content 'Bluetoothとワイヤレスシステムを唯一搭載している'
          expect(page).to have_content 'タイトルの通り、Bluetoothスピーカーとワイヤレスシステムを搭載している現在のところ唯一のアンプだと思いましたので購入しました。 電源コードひとつでギター演奏と外部音源を鳴らせるのは部屋がすっきりして良いです。 フロントパネルの見た目は好きではないので、フロント部分を下方向に向け、コントロールツマミ部分を正面に向け、アルミラックの上段に置いて使用しています。'
          expect(page).to have_content 'テストマン'
        end

        context '別のユーザーでログインした場合' do
          let!(:user2) { create(:user, email: 'testman2@yahoo.co.jp') }
          before do
            sign_out user
            sign_in user2
            visit root_path
            click_link 'KATANA-AIR'
          end

          it '投稿されたレビューを見ることができる' do
            expect(page).to have_content 'Bluetoothとワイヤレスシステムを唯一搭載している'
          end

          it '編集、および削除ボタンが表示されない' do
            expect(page).to have_no_link '編集'
            expect(page).to have_no_button '削除'
          end
        end

        context 'ログインしていないユーザーの場合' do
          before do
            sign_out user
            visit root_path
            click_link 'KATANA-AIR'
          end

          it '投稿されたレビューを見ることができる' do
            expect(page).to have_content 'Bluetoothとワイヤレスシステムを唯一搭載している'
          end

          it '編集、および削除ボタンが表示されない' do
            expect(page).to have_no_link '編集'
            expect(page).to have_no_button '削除'
          end
        end
      end

      context 'レビュー投稿画面にて、必須項目を埋めていない場合' do
        before do
          select '1', from: 'review[cost_performance]'
          select '2', from: 'review[sound]'
          select '3', from: 'review[design]'
          select '4', from: 'review[durability]'
          select '5', from: 'review[satisfaction_level]'
          fill_in 'review_title', with: 'Bluetoothとワイヤレスシステムを唯一搭載している'
          click_button 'レビューを投稿する'
        end

        it 'レビューの投稿ができない' do
          expect(page).to have_content 'レビューの投稿に失敗しました'
        end
      end
    end
  end

  describe '編集、削除機能' do
    let!(:review) { create(:review, user: user, gear: gear) }

    context 'レビューを投稿したユーザーと、閲覧するユーザーが同じ場合' do
      before do
        sign_in user
        visit root_path
        click_link 'KATANA-AIR'
      end

      it '編集ボタンおよび削除ボタンが存在する' do
        expect(page).to have_link '編集'
        expect(page).to have_button '削除'
      end

      context '編集ボタンを押した場合' do
        before do
          click_link '編集'
        end

        it '編集画面に遷移できる' do
          expect(page).to have_content '機材のレビューを編集'
        end

        it 'クリックしたレビューと対応したURLに遷移する' do
          expect(current_path).to eq("/gears/#{gear.id}/reviews/#{review.id}/edit")
        end

        context '既存の値を適切に編集した場合' do
          before do
            # 元々の値は1
            select '5', from: 'review[cost_performance]'
            # 元々のタイトルは'Bluetoothとワイヤレスシステムを唯一搭載している'
            fill_in 'review_title', with: 'テストチェック'
            click_button 'レビューを編集する'
          end

          it 'レビューの編集ができる' do
            review = Review.last
            expect(review.cost_performance).to eq 5
            expect(review.title).to eq 'テストチェック'
          end

          it '機材詳細画面に遷移する' do
            expect(current_path).to eq("/gears/#{gear.id}")
            expect(page).to have_content 'テストチェック'
          end
        end

        context '既存の値をnilにした場合' do
          before do
            fill_in 'review_title', with: nil
            click_button 'レビューを編集する'
          end

          it 'レビューの編集に失敗する' do
            expect(page).to have_content 'レビューの更新に失敗しました'
          end

          it 'レビュー編集画面にリダイレクトされる' do
            expect(current_path).to eq("/gears/#{gear.id}/reviews/#{review.id}/edit")
          end
        end
      end

      context '削除ボタンを押した場合' do
        before do
          click_button '削除'
        end

        it 'モーダルウィンドウが表示される' do
          expect(page).to have_content '本当に削除してもよろしいですか？'
        end

        context 'モーダルウィンドウの削除ボタンをクリックした場合' do
          before do
            click_link '削除'
          end

          it '機材詳細ページに遷移する' do
            expect(current_path).to eq("/gears/#{gear.id}")
          end

          it 'レビューが削除される' do
            expect(page).to have_content 'まだレビューが存在しません'
          end
        end
      end
    end
  end
end
