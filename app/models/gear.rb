class Gear < ApplicationRecord
    mount_uploader :image, ImageUploader

    extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to_active_hash        :category
    belongs_to_active_hash        :maker
      
end
