class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: %i[twitter]

  has_many :reviews
  has_one  :sns_credential
  has_many :likes, dependent: :destroy

  VALID_EMAIL_REGIX = /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i.freeze

  validates :username,             presence: true, length: { minimum: 1, maximum: 15 }
  validates :email,                presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGIX }
  validates :profile,              length: { maximum: 1000 }
  validates :password,             presence: true, length: { minimum: 7, maximum: 20 }, confirmation: true

  def self.find_oauth(auth)
    uid = auth.uid
    provider = auth.provider
    snscredential = SnsCredential.where(uid: uid, provider: provider).first

    # sns登録のみ完了してるユーザー?
    if snscredential.present?
      user = User.where(id: snscredential.user_id).first
      sns = snscredential

    # sns登録 なし
    else
      user = User.where(email: auth.info.email).first

      user = User.new(
        email: auth.info.email,
        username: auth.info.nickname
      )

      # Snscredentialテーブルにuidとproviderをオブジェクト化。providerはtwitterのこと。uidはprovider側で管理しているidのこと。
      # UserテーブルのIDと紐づけたいのでこの時点ではまだ保存できない。
      sns = SnsCredential.new(
        uid: uid,
        provider: provider,
        user_id: nil
      )

      # 会員登録 済み
      # if user.present?
      #   sns = SnsCredential.new(
      #     uid: uid,
      #     provider: provider,
      #     user_id: user.id
      #   )

      # 会員登録 なし
      # else
      # Userテーブル用の情報として、emailとusernameの値をオブジェクト化。値はSNSから引っ張りだす。まだDBには保存しない。
      # user = User.new(
      #   email: auth.info.email,
      #   username: auth.info.nickname
      # )

      # Snscredentialテーブルにuidとproviderをオブジェクト化。providerはtwitterのこと。uidはprovider側で管理しているidのこと。
      # UserテーブルのIDと紐づけたいのでこの時点ではまだ保存できない。
      # sns = SnsCredential.new(
      #   uid: uid,
      #   provider: provider,
      #   user_id: nil
      # )
      # end
    end
    # hashでuser情報と、snsのidを返り値として保持しておく
    { user: user, sns: sns }
  end

  def self.dummy_email(auth)
    "#{auth[:sns][:uid]}-#{auth[:sns][:provider]}@example.com"
  end
end
