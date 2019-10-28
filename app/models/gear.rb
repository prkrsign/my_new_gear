class Gear < ApplicationRecord
  attr_accessor :n, :points, :review_list
  # いいね機能一旦停止
  # has_many   :likes, dependent: :destroy
  has_many :reviews

  validates :gearname,      presence: true
  validates :image,         presence: true
  validates :maker,         presence: true
  validates :category,      presence: true

  # いいね機能一旦停止
  # def like_user(id)
  #   likes.find_by(user_id: id)
  # end

  # 任意のギアのレビューにおいて、引数で指定したカラムの平均点を計算
  def self.average_point(gear_id, culumn)
    gear = Gear.new
    gear.n = 0
    gear.points = 0
    gear.review_list = Review.where(gear_id: gear_id)
    point_list = gear.review_list.pluck(:"#{culumn}")
    point_list.each do |list|
      gear.points += list
      gear.n += 1
    end
    gear.points / gear.n.to_f
  end
end
