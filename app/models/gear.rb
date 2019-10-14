class Gear < ApplicationRecord
    belongs_to :user
    has_many   :likes, dependent: :destroy

    mount_uploader :image, ImageUploader

    extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to_active_hash        :category
    belongs_to_active_hash        :maker
      

    def like_user(id)
        likes.find_by(user_id: id)
    end
end
