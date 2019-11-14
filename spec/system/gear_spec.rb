require 'rails_helper'

RSpec.describe '機材機能', type: :system, js: true do
  describe '一覧表示機能' do
    let!(:user) { create(:user) }
    let!(:gear) { create_list(:gear, 16) }

    context 'ログインしていない場合' do
      before do
        visit root_path
      end

      it '1ページあたり12個の機材が表示される' do
        expect(page).to have_content('KATANA-AIR', count: 12)
      end

      it 'Lastボタンが表示される' do
        expect(page).to have_link('Last')
      end

      context '次のページネーションをクリックした場合' do
        before do
          click_link '2'
        end

        it '残りの機材４つが表示される' do
          expect(page).to have_content('KATANA-AIR', count: 4)
        end

        it 'Firstボタンが表示される' do
          expect(page).to have_link('First')
        end
      end
    end

    context 'ログインしている場合' do
      before do
        sign_in user
        visit root_path
      end

      it '1ページあたり12個の機材が表示される' do
        expect(page).to have_content('KATANA-AIR', count: 12)
      end

      it 'Lastボタンが表示される' do
        expect(page).to have_link('Last')
      end

      context '次のページネーションをクリックした場合' do
        before do
          click_link '2'
        end

        it '残りの機材４つが表示される' do
          expect(page).to have_content('KATANA-AIR', count: 4)
        end

        it 'Firstボタンが表示される' do
          expect(page).to have_link('First')
        end
      end
    end
  end

  describe '詳細表示機能' do
    let!(:user) { create(:user) }
    let!(:gear) { create(:gear) }
    context 'ログインしていない場合' do
      before do
        visit root_path
      end

      it '詳細表示画面に遷移できる' do
        click_link 'KATANA-AIR'
        expect(current_path).to eq("/gears/#{gear.id}")
      end
    end

    context 'ログインしている場合' do
      before do
        sign_in user
        visit root_path
      end

      it '詳細表示画面に遷移できる' do
        click_link 'KATANA-AIR'
        expect(current_path).to eq("/gears/#{gear.id}")
      end

      context '詳細表示画面に遷移した場合' do
        before do
          click_link 'KATANA-AIR'
        end

        it '詳細表示画面に画像が表示される' do
          expect(page).to have_selector("img[src$='#{gear.image}']")
        end

        context 'レビューが投稿されていない場合' do
          it 'No Image画像を表示する' do
            expect(page).to have_selector("img[src$='/nodata.png']")
          end

          it 'レビューの投稿がないことを表示する' do
            expect(page).to have_content 'まだレビューが存在しません'
          end
        end

        context 'レビューが投稿されている場合' do
          let!(:review) { create(:review, user: user, gear: gear) }

          it 'レーダーチャートが表示される' do
            expect(page).to have_selector 'canvas'
          end

          it 'レビュー内容を閲覧できる' do
            expect(page).to have_content 'Bluetoothとワイヤレスシステムを唯一搭載している'
          end
        end
      end
    end
  end

  describe '検索機能' do
    let!(:user) { create(:user) }
    let!(:gear) { create_list(:gear, 16) }

    context '検索にヒットした場合' do
      before do
        visit root_path
        fill_in 'q[gearname_or_maker_or_category_cont]', with: 'KATANA-AIR'
        find('#q_gearname_or_maker_or_category_cont').send_keys(:enter)
      end

      it '結果画面に機材が12個表示される' do
        expect(page).to have_content('KATANA-AIR', count: 12)
      end

      it 'Lastボタンが表示される' do
        expect(page).to have_link('Last')
      end

      context '次のページネーションをクリックした場合' do
        before do
          click_link '2'
        end

        it '残りの機材４つが表示される' do
          expect(page).to have_content('KATANA-AIR', count: 4)
        end

        it 'Firstボタンが表示される' do
          expect(page).to have_link('First')
        end
      end
    end

    context '検索にヒットしない場合' do
      before do
        visit root_path
        fill_in 'q[gearname_or_maker_or_category_cont]', with: 'testtest'
        find('#q_gearname_or_maker_or_category_cont').send_keys(:enter)
      end

      it '結果画面に何も表示されない' do
        expect(page).to have_no_content('KATANA-AIR', count: 12)
      end
    end
  end
end
