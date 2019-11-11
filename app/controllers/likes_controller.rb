class LikesController < ApplicationController
  # いいね機能一旦停止
  # before_action :set_review, only: %i[create destroy]
  before_action :set_gear, only: %i[create destroy]

  def create
    @like = current_user.likes.create(review_id: params[:review_id])
  end

  def destroy
    like = current_user.likes.find_by(review_id: params[:review_id])
    like.destroy
  end

  private

  def set_gear
    @gear = Gear.find(params[:gear_id])
  end
end
