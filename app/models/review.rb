class Review < ApplicationRecord
  belongs_to :user
  belongs_to :gear

  validates :title,                   presence: true, length: { minimum: 1, maximum: 30 }
  validates :detail,                  presence: true, length: { minimum: 5, maximum: 500 }
  validates :cost_performance,        presence: true
  validates :sound,                   presence: true
  validates :durability,              presence: true
  validates :design,                  presence: true
  validates :satisfaction_level,      presence: true
end
