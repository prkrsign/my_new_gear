require 'rails_helper'

RSpec.describe '機材機能', type: :system do

  describe '一覧表示機能' do
    let!(:user) { FactoryBot.create(:user) }
    let!(:gear) { FactoryBot.create_list(:gear, 16)}

    context 'ログインしていない場合' do
      before do
        visit root_path
      end

      it '1ページあたり12個の機材が表示される' do
        expect(page).to have_content('KATANA-AIR' , count: 12)
      end

      it 'Lastボタンが表示される' do
        expect(page).to have_link('Last')
      end

      context '次のページネーションをクリックした場合' do
        before do
          click_link '2'
        end

        it '残りの機材４つが表示される' do
          expect(page).to have_content('KATANA-AIR' , count: 4)
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
        expect(page).to have_content('KATANA-AIR' , count: 12)
      end

      it 'Lastボタンが表示される' do
        expect(page).to have_link('Last')
      end

      context '次のページネーションをクリックした場合' do
        before do
          click_link '2'
        end

        it '残りの機材４つが表示される' do
          expect(page).to have_content('KATANA-AIR' , count: 4)
        end

        it 'Firstボタンが表示される' do
          expect(page).to have_link('First')
        end
      end
    end
  end


  describe '詳細表示機能' do
    let!(:user) { FactoryBot.create(:user) }
    let!(:gear) { FactoryBot.create(:gear)}
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
          let!(:review){ FactoryBot.create(:review, user: user, gear: gear) }

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
end






  # describe '検索機能'
  #   context 'ログインしていない場合'

  #   context 'ログイングインしている場合'




    
  # describe  '投稿機能' do
  #   context 'アカウントを持たないユーザーの場合' do
  #     it 'ヘッダーに投稿リンクが表示されない' do
  #       visit root_path
  #       expect(page).to have_no_link '投稿する'
  #     end

  #     it '投稿ページに遷移しようとすると、サインインページにリダイレクトされる' do
  #       visit new_gear_path
  #       expect(current_path).to eq('/users/sign_in')
  #     end
  #   end

  #   context '既存ユーザーが新規投稿する場合' do
  #     before do
  #       user= FactoryBot.create(:user)
  #       visit new_user_session_path
  #       fill_in 'メールアドレス', with: 'testman@yahoo.co.jp'
  #       fill_in 'パスワード', with: '1234567'
  #       click_button 'My New Gearにログイン'
  #     end

  #     it 'userが投稿ページに遷移できる' do
  #       visit new_gear_path
  #       expect(page).to have_content '機材の情報を入力'
  #     end

  #     context '投稿ページで必須項目をブランクで投稿した場合' do
  #       before do
  #         visit new_gear_path
  #         attach_file "gear[image]", "#{Rails.root}/spec/files/jisaku.png", visible: false
  #         select "Overdrive", from: "gear_category_id"
  #         select "Boss", from: "gear_maker_id"
  #         fill_in 'cost_point', with: '20'
  #         fill_in 'sound_point', with: '20'
  #         fill_in 'design_point', with: '20'
  #         fill_in 'durability_point', with: '20'
  #         fill_in 'dissatisfaction_point', with: '20'
  #         fill_in 'gear_title', with: 'デラックス版「TS808DX」'
  #         fill_in 'gear_review', with: 'これまでたくさんのオーバードライブを購入しましたが、ここに結論がありました。BOSSらしいと言えばそこまでですが、これがBOSSのひとつの回答だと思います。つまみをどの位置にしても良い音がでます。ブースターとして、クランチとして、軽めのディストーションとして。オールラウンダーです。'
  #         click_button 'レビューを投稿する'
  #       end

  #       it 'バリデーションで弾かれて投稿できない' do
  #         expect(page).to have_content '投稿に失敗しました'
  #       end

  #       it '投稿ページに滞在し続ける' do
  #         expect(current_path).to eq('/gears/new')
  #       end

  #       it 'データベースに値が存在しない' do
  #         gear = Gear.last
  #         gear.nil?
  #       end
  #     end

  #     context '投稿ページで全項目を記載して投稿した場合' do
  #       before do
  #         visit new_gear_path
  #         attach_file "gear[image]", "#{Rails.root}/spec/files/jisaku.png", visible: false
  #         fill_in 'gear_gearname', with: 'Plumes'
  #         select "Overdrive", from: "gear_category_id"
  #         select "Boss", from: "gear_maker_id"
  #         fill_in 'cost_point', with: '20'
  #         fill_in 'sound_point', with: '20'
  #         fill_in 'design_point', with: '20'
  #         fill_in 'durability_point', with: '20'
  #         fill_in 'dissatisfaction_point', with: '20'
  #         fill_in 'gear_title', with: 'デラックス版「TS808DX」'
  #         fill_in 'gear_review', with: 'これまでたくさんのオーバードライブを購入しましたが、ここに結論がありました。BOSSらしいと言えばそこまでですが、これがBOSSのひとつの回答だと思います。つまみをどの位置にしても良い音がでます。ブースターとして、クランチとして、軽めのディストーションとして。オールラウンダーです。'
  #         click_button 'レビューを投稿する'
  #       end

  #       it '投稿内容が一覧ページに反映される' do
  #         expect(page).to have_content 'デラックス版「TS808DX」'
  #         expect(page).to have_content 'Plumes'
  #         expect(page).to have_content 'Overdrive'
  #         expect(page).to have_content 'Boss'
  #       end

  #       it '投稿内容がデータベースに保存される' do
  #         gear = Gear.last
  #         gear.title.eql?('デラックス版「TS808DX」')
  #       end

  #       it '投稿後、トップページに遷移する' do
  #         expect(current_path).to eq(root_path)
  #       end
  #     end
  #   end
  # end

  # describe '一覧表示' do
  #   context 'ユーザーAが投稿した時' do
  #     before do
  #       userA = FactoryBot.create(:user)
  #       FactoryBot.create(:gear, user: userA)
  #       visit new_user_session_path
  #       fill_in 'メールアドレス', with: 'testman@yahoo.co.jp'
  #       fill_in 'パスワード', with: '1234567'
  #       click_button 'My New Gearにログイン'
  #     end

  #     it '投稿一覧ページで、ユーザーAはユーザーAの投稿を見ることができる' do
  #       visit root_path
  #       expect(page).to have_content 'デラックス版「TS808DX」'
  #     end

  #     context 'ユーザーBがログインした場合' do
  #       before do
  #           click_on('マイページ')
  #           userB = FactoryBot.create(:user, email: 'testman2@yahoo.co.jp')
  #           visit new_user_session_path
  #           fill_in 'メールアドレス', with: 'testman2@yahoo.co.jp'
  #           fill_in 'パスワード', with: '1234567'
  #           click_button 'My New Gearにログイン'
  #       end

  #       it '投稿一覧ページで、ユーザーBはユーザーAの投稿を見ることができる' do
  #           expect(page).to have_content 'デラックス版「TS808DX」'
  #       end
  #     end

  #     context 'アカウントを持たないユーザーの場合' do
  #       before do
  #         click_on('マイページ')
  #       end

  #       it '投稿一覧ページで、アカウントを持たないユーザーはユーザーAの投稿を見ることができる'do
  #         expect(page).to have_content 'ログアウトしました'
  #         expect(page).to have_content 'デラックス版「TS808DX」'
  #       end
  #     end
  #   end
  # end

  # describe  '詳細表示機能' do
  #   context 'アカウントを持たないユーザーの場合' do
  #     before do
  #       gear = FactoryBot.create(:gear)
  #       visit root_path
  #     end

  #     it '一覧ページから詳細ページに遷移できる' do
  #       click_on('デラックス版「TS808DX」')
  #       expect(page).to have_content 'これまでたくさんのオーバードライブを購入しましたが、ここに結論がありました。BOSSらしいと言えばそこまでですが、これがBOSSのひとつの回答だと思います。つまみをどの位置にしても良い音がでます。ブースターとして、クランチとして、軽めのディストーションとして。オールラウンダーです。'
  #     end

  #     it '詳細ページで編集ボタン、削除ボタンが表示されない' do
  #       click_on('デラックス版「TS808DX」')
  #       expect(page).to have_no_link '編集'
  #       expect(page).to have_no_button '削除'
  #     end
  #   end

  #   context '詳細ページの投稿者と、閲覧者のアカウントが同じ場合' do
  #     before do
  #       user = FactoryBot.create(:user)
  #       gear = FactoryBot.create(:gear, user: user)
  #       visit new_user_session_path
  #       fill_in 'メールアドレス', with: 'testman@yahoo.co.jp'
  #       fill_in 'パスワード', with: '1234567'
  #       click_button 'My New Gearにログイン'
  #     end

  #     it '一覧ページから詳細ページに遷移できる' do
  #       click_on('デラックス版「TS808DX」')
  #       expect(page).to have_content 'これまでたくさんのオーバードライブを購入しましたが、ここに結論がありました。BOSSらしいと言えばそこまでですが、これがBOSSのひとつの回答だと思います。つまみをどの位置にしても良い音がでます。ブースターとして、クランチとして、軽めのディストーションとして。オールラウンダーです。'
  #     end

  #     it '詳細ページで編集ボタン、削除ボタンが表示される'do
  #       click_on('デラックス版「TS808DX」')
  #       expect(page).to have_link '編集'
  #       expect(page).to have_button '削除'
  #     end

  #     context '削除ボタンを押した時' do
  #       it 'モーダルウィンドウが表示される' do
  #         click_on('デラックス版「TS808DX」')
  #         click_on('削除')
  #         expect(page).to have_content '本当に削除してもよろしいですか？'
  #       end

  #       context 'モーダルウィンドウの削除を実行した時' do
  #         it 'rootページに遷移する' do
  #           click_on('デラックス版「TS808DX」')
  #           click_on('削除')
  #           sleep 1
  #           click_link('削除')
  #           expect(page).to have_content 'MyNewGear'
  #         end

  #         it 'データベースからレビューが削除される' do
  #           click_on('デラックス版「TS808DX」')
  #           click_on('削除')
  #           sleep 1
  #           click_link('削除')
  #           gear = Gear.find_by(title: 'デラックス版「TS808DX」')
  #           gear.nil?
  #         end
  #       end

  #       context 'モーダルウィンドウの戻るボタンを押した時' do
  #         it 'モーダルウィンドウが消える' do
  #           click_on('デラックス版「TS808DX」')
  #           click_on('削除')
  #           sleep 1
  #           click_button('戻る')
  #           sleep 1
  #           expect(page).to have_no_content '本当に削除してもよろしいですか？'
  #         end
  #       end
  #     end
  #   end

  #   context '詳細ページの投稿者と、閲覧者のアカウントが違う場合' do
  #     before do
  #       userA = FactoryBot.create(:user)
  #       userB = FactoryBot.create(:user, email: 'testB@yahoo.co.jp')
  #       gear = FactoryBot.create(:gear, user: userA)
  #       visit new_user_session_path
  #       fill_in 'メールアドレス', with: 'testB@yahoo.co.jp'
  #       fill_in 'パスワード', with: '1234567'
  #       click_button 'My New Gearにログイン'
  #     end

  #     it '一覧ページから詳細ページに遷移できる' do
  #       click_on('デラックス版「TS808DX」')
  #       expect(page).to have_content 'これまでたくさんのオーバードライブを購入しましたが、ここに結論がありました。BOSSらしいと言えばそこまでですが、これがBOSSのひとつの回答だと思います。つまみをどの位置にしても良い音がでます。ブースターとして、クランチとして、軽めのディストーションとして。オールラウンダーです。'
  #     end

  #     it '詳細ページで編集ボタン、削除ボタンが表示される'do
  #       click_on('デラックス版「TS808DX」')
  #       expect(page).to have_no_link '編集'
  #       expect(page).to have_no_button '削除'
  #     end
  #   end
  # end

  # describe  '編集機能' do
  #   before do
  #     user = FactoryBot.create(:user)
  #     gear = FactoryBot.create(:gear, user: user)
  #     visit new_user_session_path
  #     fill_in 'メールアドレス', with: 'testman@yahoo.co.jp'
  #     fill_in 'パスワード', with: '1234567'
  #     click_button 'My New Gearにログイン'
  #     click_on 'デラックス版「TS808DX」'
  #     click_link '編集'
  #   end

  #   it '編集画面に遷移できる' do
  #     gear = Gear.last
  #     expect(current_path).to eq("/gears/#{gear.id}/edit")
  #   end

  # end