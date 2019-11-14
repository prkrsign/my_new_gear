require 'rails_helper'

RSpec.describe Like, type: :model do
  describe 'いいね機能' do
    let(:gear) { create(:gear) }
    let(:user) { create(:user) }
    let(:review) { create(:review, user: user, gear: gear) }
    let(:review2) { create(:review, user: user, gear: gear) }

    it '存在するユーザーIDとレビューIDの場合、有効である' do
      like = build(:like, user: user, review: review)
      expect(like).to be_valid
    end

    it 'ユーザーIDがない場合、無効である' do
      like = build(:like, user: nil, review: review)
      like.valid?
      expect(like.errors[:user]).to include('を入力してください')
    end

    it 'レビューIDがない場合、無効である' do
      like = build(:like, user: user, review: nil)
      like.valid?
      expect(like.errors[:review]).to include('を入力してください')
    end

    it '任意のユーザーIDが複数のレビューIDを持つ場合、有効である' do
      like1 = create(:like, user: user, review: review)
      expect(like1).to be_valid
      like2 = build(:like, user: user, review: review2)
      expect(like2).to be_valid
    end

    it 'ユーザーIDとレビューIDが重複する場合、無効である' do
      like1 = create(:like, user: user, review: review)
      expect(like1).to be_valid
      like2 = build(:like, user: user, review: review)
      like2.valid?
      expect(like2.errors[:review_id]).to include('はすでに存在します')
    end
  end
end
