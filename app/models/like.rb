class Like < ApplicationRecord
  belongs_to :user
  belongs_to :review
  
  validates :user_id,       presence: true
  validates :review_id,     presence: true, uniqueness: { scope: [:user_id] } 
end
