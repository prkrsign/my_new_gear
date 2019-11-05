class SnsCredential < ApplicationRecord
  belongs_to :user

  def self.find_or_create_from_auth_hash(auth_hash)
    provider = auth_hash[:sns][:provider] # providerはどのサービスで認証したのかを見分けるもの
    uid = auth_hash[:sns][:uid]
    username = auth_hash[:user][:username]

    user = User.create(
      username: username,
      email: User.dummy_email(auth_hash),
      password: Devise.friendly_token[0, 20]
    )

    find_or_create_by(provider: provider, uid: uid, user_id: user.id)
  end
end
