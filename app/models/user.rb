class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  # active_hashでgenreIDを紐づける
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :genre

  mount_uploader :avatar, AvatarUploader
end
