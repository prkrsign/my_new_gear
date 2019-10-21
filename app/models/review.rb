class Review < ApplicationRecord
  belongs_to :user
  belongs_to :gear

  validates :title,                   presence: true
  validates :detail,                  presence: true
  validates :cost_performance,        presence: true
  validates :sound,                   presence: true
  validates :durability,              presence: true
  validates :design,                  presence: true
  validates :satisfaction_level,      presence: true
end
