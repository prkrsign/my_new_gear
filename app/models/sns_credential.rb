class SnsCredential < ApplicationRecord
  belongs_to :user

  def self.find_or_create_from_auth_hash(auth_hash)
    # binding.pry
    provider = auth_hash[:sns][:provider] # providerはどのサービスで認証したのかを見分けるもの
    uid = auth_hash[:sns][:uid]
    username = auth_hash[:user][:username]

    # snsの情報を元にユーザーテーブルにアカウントを作成。emailはダミー、パスワードはトークン
    user = User.create(
      username: username,
      email: User.dummy_email(auth_hash),
      password: Devise.friendly_token[0, 20]
    )

    # sns_credentialテーブルにプロバイダーとuid、user_idが重複しないかチェック。重複しないならcreate
    find_or_create_by(provider: provider, uid: uid, user_id: user.id)

    # ログインするためにuserをメソッド呼び出し元に返す
    return user
  end
end
