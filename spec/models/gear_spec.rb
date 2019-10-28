require 'rails_helper'

RSpec.describe Gear, type: :model do
  describe '機材情報保存機能' do
    it '全ての必須項目を入れた場合に、機材情報が保存される' do
      gear = FactoryBot.build(:gear)
      gear.valid?
      expect(gear).to be_valid
    end

    describe 'gearnameの妥当性確認' do
      it 'gearnameがnilの場合、機材情報が保存されない' do
        gear = FactoryBot.build(:gear, gearname: nil)
        gear.valid?
        expect(gear.errors[:gearname]).to include("を入力してください")
      end
    end

    describe 'imageの妥当性確認' do
      it 'imageがnilの場合、機材情報が保存されない' do
        gear = FactoryBot.build(:gear, image: nil)
        gear.valid?
        expect(gear.errors[:image]).to include("を入力してください")
      end
    end

    describe 'makerの妥当性確認' do
      it 'makerがnilの場合、機材情報が保存されない' do
        gear = FactoryBot.build(:gear, maker: nil)
        gear.valid?
        expect(gear.errors[:maker]).to include("を入力してください")
      end
    end

    describe 'categoryの妥当性確認' do
      it 'categoryがnilの場合、機材情報が保存されない' do
        gear = FactoryBot.build(:gear, category: nil)
        gear.valid?
        expect(gear.errors[:category]).to include("を入力してください")
      end
    end
  end
end
