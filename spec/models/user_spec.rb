require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    it "全ての必須項目を入れた場合、アカウント登録ができる" do
      user = build(:user)
      user.valid?
      expect(user).to be_valid
    end

    describe 'ユーザー新規登録(usernameの妥当性確認)' do
      it "usernameが1文字の場合、アカウント登録ができる" do
        user = build(:user, username: 'あ')
        user.valid?
        expect(user).to be_valid
      end

      it "usernameが15文字の場合、アカウント登録ができる" do
        user = build(:user, username: 'あああああいいいいいううううう')
        user.valid?
        expect(user).to be_valid
      end

      it "usernameがnilの場合、アカウント登録ができない" do
        user = build(:user, username: nil)
        user.valid?
        expect(user.errors[:username]).to include("を入力してください")
      end

      it "usernameが16文字以上の場合、アカウント登録ができない" do
        user = build(:user, username: 'あああああいいいいいうううううえ')
        user.valid?
        expect(user.errors[:username]).to include("は15文字以内で入力してください")
      end
    end

    describe 'ユーザー新規登録(emailの妥当性確認)' do
      it "emailがnilの場合、アカウント登録ができない" do
        user = build(:user, email: nil)
        user.valid?
        expect(user.errors[:email]).to include("を入力してください")
      end

      it "emailが重複しているの場合、アカウント登録ができない" do
        user_a = create(:user)
        user_b = build(:user)
        user_b.valid?
        expect(user_b.errors[:email]).to include("はすでに存在します")
      end

      it "emailがフォーマットに準拠していない場合、アカウント登録ができない" do
        user = build(:user, email: 'aaaa')
        user.valid?
        expect(user.errors[:email]).to include("は不正な値です")
      end

      it "@より前に値がない場合、アカウント登録ができない" do
        user = build(:user, email: '@aaaa')
        user.valid?
        expect(user.errors[:email]).to include("は不正な値です")
      end

      it "@より後に値がない場合、アカウント登録ができない" do
        user = build(:user, email: 'aaaa@')
        user.valid?
        expect(user.errors[:email]).to include("は不正な値です")
      end

      it "emailにカナ文字が含まれる場合、アカウント登録できない" do
        user = build(:user, email: "aaあa@aaa")
        user.valid?
        expect(user.errors[:email]).to include("は不正な値です")
      end
    end

    describe 'ユーザー新規登録(passwordの妥当性確認)' do
      it "passwordがnilの場合、登録できない" do
        user = build(:user, password: nil)
        user.valid?
        expect(user.errors[:password]).to include("を入力してください")
      end

      # 確認passwordがnilの場合のバリデーションは存在しないが、passwordではnilを許さないため問題ないと判断する
      it "確認passwordとpasswordが一致しない場合、登録できない" do
        user = build(:user, password_confirmation: 'aaaa')
        user.valid?
        expect(user.errors[:password_confirmation]).to include("とパスワードの入力が一致しません")
      end

      it "passwordが7桁以下の場合、登録できない" do
        user = build(:user, password: 'aaabbb')
        user.valid?
        expect(user.errors[:password]).to include("は7文字以上で入力してください")
      end

      it "passwordが20桁以上の場合、登録できない" do
        user = build(:user, password: 'aaabbbcccdddeeefffggg')
        user.valid?
        expect(user.errors[:password]).to include("は20文字以内で入力してください")
      end
    end

    describe 'ユーザー新規登録(profileの妥当性確認)' do
      it "profileがnilでも、アカウント登録できる" do
        user = build(:user, profile: nil)
        user.valid?
        expect(user).to be_valid
      end

      it "profileが1000文字以内の場合、アカウント登録できる" do
        user = build(:user, profile: Faker::Lorem.characters(number: 1000))
        user.valid?
        expect(user).to be_valid
      end

      it "profileが1001文字以上の場合、アカウント登録できない" do
        user = build(:user, profile: Faker::Lorem.characters(number: 1001))
        user.valid?
        expect(user.errors[:profile]).to include("は1000文字以内で入力してください")
      end
    end

    describe 'ユーザー新規登録(avatarの妥当性確認)' do
      it "avatarがnilでも、アカウント登録できる" do
        user = build(:user, avatar: nil)
        user.valid?
        expect(user).to be_valid
      end
    end
  end

  describe 'SNS認証メソッド' do
    context 'find_oauthメソッドの検証'
  end
end
