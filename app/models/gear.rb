class Gear < ApplicationRecord
    belongs_to :user
    mount_uploader :image, ImageUploader

    extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to_active_hash        :category
    belongs_to_active_hash        :maker
      
end
