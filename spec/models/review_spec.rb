require 'rails_helper'

RSpec.describe Review, type: :model do
  describe 'レビュー投稿機能' do
    it "全ての必須項目を入れた場合、レビューの投稿ができる" do
      user = FactoryBot.build(:user)
      gear = FactoryBot.build(:gear)
      review = FactoryBot.build(:review, user: user, gear: gear)
      review.valid?
      expect(review).to be_valid
    end

    describe 'titleの妥当性確認' do
      it 'titleがnilの場合、投稿ができない' do
        user = FactoryBot.build(:user)
        gear = FactoryBot.build(:gear)
        review = FactoryBot.build(:review, title: nil, user: user, gear: gear)
        review.valid?
        expect(review.errors[:title]).to  include("を入力してください")
      end

      it 'titleが31文字を超える場合、投稿ができない' do
        user = FactoryBot.build(:user)
        gear = FactoryBot.build(:gear)
        review = FactoryBot.build(:review, title: 'あああああいいいいいうううううえええええおおおおおかかかかかき', user: user, gear: gear)
        review.valid?
        expect(review.errors[:title]).to  include("は30文字以内で入力してください")
      end

      it 'titleが1文字以上の場合、投稿ができる' do
        user = FactoryBot.build(:user)
        gear = FactoryBot.build(:gear)
        review = FactoryBot.build(:review, title: 'あ', user: user, gear: gear)
        review.valid?
        expect(review).to be_valid
      end
    end

    describe 'detailの妥当性確認' do
      it 'detailがnilの場合、登録ができない' do
        user = FactoryBot.build(:user)
        gear = FactoryBot.build(:gear)
        review = FactoryBot.build(:review, detail: nil, user: user, gear: gear)
        review.valid?
        expect(review.errors[:detail]).to  include("を入力してください")
      end

      it 'detailが501文字を超える場合、登録ができない' do
        user = FactoryBot.build(:user)
        gear = FactoryBot.build(:gear)
        review = FactoryBot.build(:review, detail: Faker::Lorem.characters(number: 501))
        review.valid?
        expect(review.errors[:detail]).to  include("は500文字以内で入力してください")
      end
    end

    describe 'cost_performanceの妥当性確認' do
      it 'cost_performanceがnilの場合、登録ができない' do
        user = FactoryBot.build(:user)
        gear = FactoryBot.build(:gear)
        review = FactoryBot.build(:review, cost_performance: nil, user: user, gear: gear)
        review.valid?
        expect(review.errors[:cost_performance]).to  include("を入力してください")
      end
    end

    describe 'soundの妥当性確認' do
      it 'soundがnilの場合、登録ができない' do
        user = FactoryBot.build(:user)
        gear = FactoryBot.build(:gear)
        review = FactoryBot.build(:review, sound: nil, user: user, gear: gear)
        review.valid?
        expect(review.errors[:sound]).to  include("を入力してください")
      end
    end

    describe 'designの妥当性確認' do
      it 'designがnilの場合、登録ができない' do
        user = FactoryBot.build(:user)
        gear = FactoryBot.build(:gear)
        review = FactoryBot.build(:review, design: nil, user: user, gear: gear)
        review.valid?
        expect(review.errors[:design]).to  include("を入力してください")
      end
    end

    describe 'durabilityの妥当性確認' do
      it 'durabilityがnilの場合、登録ができない' do
        user = FactoryBot.build(:user)
        gear = FactoryBot.build(:gear)
        review = FactoryBot.build(:review, durability: nil, user: user, gear: gear)
        review.valid?
        expect(review.errors[:durability]).to  include("を入力してください")
      end
    end

    describe 'satisfaction_levelの妥当性確認' do
      it 'satisfaction_levelがnilの場合、登録ができない' do
        user = FactoryBot.build(:user)
        gear = FactoryBot.build(:gear)
        review = FactoryBot.build(:review, satisfaction_level: nil, user: user, gear: gear)
        review.valid?
        expect(review.errors[:satisfaction_level]).to  include("を入力してください")
      end
    end

    describe 'user(外部キー)の妥当性確認' do
      it 'userがnilの場合、登録ができない' do
        user = FactoryBot.build(:user)
        gear = FactoryBot.build(:gear)
        review = FactoryBot.build(:review, user: nil, gear: gear)
        review.valid?
        expect(review.errors[:user]).to  include("を入力してください")
      end
    end

    describe 'gear(外部キー)の妥当性確認' do
      it 'gearがnilの場合、登録ができない' do
        user = FactoryBot.build(:user)
        gear = FactoryBot.build(:gear)
        review = FactoryBot.build(:review, user: user, gear: nil)
        review.valid?
        expect(review.errors[:gear]).to  include("を入力してください")
      end
    end
  end
end
