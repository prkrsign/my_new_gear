class Review < ApplicationRecord
  belongs_to :user
  belongs_to :gear

  # 一つの機材に対して、ユーザーは一つのレビューしか投稿できないバリデーション。うまく動かないので一旦保留
  # def prevent_duplicate_user?
  #   if Review.find_by(user_id: user.id, gear_id: gear.id).present?
  #     errors.add(:user_id, "ああああ")
  #   end
  # end

  validates  :title,                   presence: true, length: { minimum: 1, maximum: 30 }
  validates  :detail,                  presence: true, length: { minimum: 5, maximum: 500 }
  validates  :cost_performance,        presence: true
  validates  :sound,                   presence: true
  validates  :durability,              presence: true
  validates  :design,                  presence: true
  validates  :satisfaction_level,      presence: true
  validates  :user_id,                 presence: true
  validates  :gear_id,                 presence: true
end
