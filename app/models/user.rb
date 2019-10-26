class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :reviews
  has_many :likes, dependent: :destroy
  
  mount_uploader :avatar, AvatarUploader

  VALID_EMAIL_REGIX = /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i.freeze

  validates :username,             presence: true, length: { minimum: 1, maximum: 15 }
  validates :email,                presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGIX }
  validates :profile,              length: { maximum: 1000 }
  validates :password,             presence: true, length: { minimum: 7, maximum: 20}, confirmation: true    
end
