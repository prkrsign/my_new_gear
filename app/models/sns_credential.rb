class SnsCredential < ApplicationRecord
  def self.find_or_create_from_auth_hash(auth_hash)
    provider = auth_hash[:provider] #providerはどのサービスで認証したのかを見分けるもの
    uid = auth_hash[:uid]
  end
end
