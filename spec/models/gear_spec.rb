require 'rails_helper'

RSpec.describe Gear, type: :model do
  describe '機材情報保存機能' do
    let(:gear) { create(:gear) }

    it '全ての必須項目を入れた場合に、機材情報が保存される' do
      gear.valid?
      expect(gear).to be_valid
    end

    describe 'gearnameの妥当性確認' do
      it 'gearnameがnilの場合、機材情報が保存されない' do
        gear.gearname = nil
        gear.valid?
        expect(gear.errors[:gearname]).to include("を入力してください")
      end
    end

    describe 'imageの妥当性確認' do
      it 'imageがnilの場合、機材情報が保存されない' do
        gear.image = nil
        gear.valid?
        expect(gear.errors[:image]).to include("を入力してください")
      end
    end

    describe 'makerの妥当性確認' do
      it 'makerがnilの場合、機材情報が保存されない' do
        gear.maker = nil
        gear.valid?
        expect(gear.errors[:maker]).to include("を入力してください")
      end
    end

    describe 'categoryの妥当性確認' do
      it 'categoryがnilの場合、機材情報が保存されない' do
        gear.category = nil
        gear.valid?
        expect(gear.errors[:category]).to include("を入力してください")
      end
    end
  end

  describe 'average_pointメソッド' do
    let(:gear) { create(:gear) }
    let(:user) { create(:user) }
    let(:review) { create_list(:review, 5, gear: gear, user: user) }

    before do
      review
    end

    it "cost_performanceの平均値を出力する" do
      expect(Gear.average_point(gear.id, 'cost_performance')).to eq 1
    end

    it "soundの平均値を出力する" do
      expect(Gear.average_point(gear.id, 'sound')).to eq 2
    end

    it "designの平均値を出力する" do
      expect(Gear.average_point(gear.id, 'design')).to eq 3
    end

    it "durabilityの平均値を出力する" do
      expect(Gear.average_point(gear.id, 'durability')).to eq 4
    end

    it "satisfaction_levelの平均値を出力する" do
      expect(Gear.average_point(gear.id, 'satisfaction_level')).to eq 5
    end
  end
end
