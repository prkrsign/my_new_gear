class Gear < ApplicationRecord
    has_many   :likes, dependent: :destroy
    has_many   :reviews

    # スクレイピングによる画像保存のため一度コメントアウト
    # mount_uploader :image, ImageUploader

    # スクレイピングによる保存のため一度コメントアウト
    # extend ActiveHash::Associations::ActiveRecordExtensions
    # belongs_to_active_hash        :category
    # belongs_to_active_hash        :maker
      
    validates :gearname,             presence: true


    def like_user(id)
        likes.find_by(user_id: id)
    end
end
