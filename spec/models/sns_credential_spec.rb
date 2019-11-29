require 'rails_helper'

RSpec.describe SnsCredential, type: :model do
  describe 'SNS連携新規登録' do
    let(:user) { create(:user) }
    let(:sns_credential) { create(:sns_credential, user: user) } 

    it 'provider,uid,user_idが存在する場合、有効である' do
      expect(sns_credential).to be_valid
    end

    it 'user_idが存在しない場合、無効である' do
      sns_credential.user_id = nil
      sns_credential.valid?
      expect(sns_credential.errors[:user]).to include('を入力してください')
    end

    it 'providerが存在しない場合、無効である' do
      sns_credential.provider = nil
      sns_credential.valid?
      expect(sns_credential.errors[:provider]).to include('を入力してください')
    end

    it 'uidが存在しない場合、無効である' do
      sns_credential.uid = nil
      sns_credential.valid?
      expect(sns_credential.errors[:uid]).to include('を入力してください')
    end
  end
end
