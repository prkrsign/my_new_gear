class Gear < ApplicationRecord
    attr_accessor :points, :review_list, :n
    has_many   :likes, dependent: :destroy
    has_many   :reviews
      
    validates :gearname,             presence: true


    def like_user(id)
        likes.find_by(user_id: id)
    end

    def initialize(gear_id)
      @n = 0
      @points = 0
      @review_list = Review.where(gear_id: gear_id)
    end

    def self.review_count
      gear = Gear.new
      review_list

    end

    # 任意のギアのレビューにおいて、引数で指定したカラムの平均点を計算
    def self.average_point(gear_id, culumn)
      gear = Gear.new(gear_id)
      point_list = gear.review_list.pluck(:"#{culumn}")
      point_list.each do |list|
        gear.points += list
        gear.n += 1
      end
      gear.points / gear.n.to_f
    end


  # スクレイピングによる画像保存のため一度コメントアウト
  # mount_uploader :image, ImageUploader

  # スクレイピングによる保存のため一度コメントアウト
  # extend ActiveHash::Associations::ActiveRecordExtensions
  # belongs_to_active_hash        :category
  # belongs_to_active_hash        :maker
end
