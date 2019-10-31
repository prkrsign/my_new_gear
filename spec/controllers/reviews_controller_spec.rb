require 'rails_helper'

RSpec.describe ReviewsController, type: :controller do
  describe 'newアクション' do
    let(:user) { create(:user) }
    let(:gear) { create(:gear) }
    let(:gear_id) do
      { params: { gear_id: gear.id } }
    end

    context 'ログインしている場合' do
      before do
        sign_in user
        get :new, gear_id
      end

      it 'レビュー投稿画面に遷移できる' do
        expect(response).to render_template :new
      end

      it '@gearが正しく定義されている' do
        expect(assigns(:gear)).to eq gear
      end
    end

    context 'ログインしていない場合' do
      before do
        get :new, gear_id
      end

      it 'サインイン画面に遷移する' do
        expect(response).to redirect_to new_user_session_path
      end
    end
  end
end
