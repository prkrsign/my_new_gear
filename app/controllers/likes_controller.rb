class LikesController < ApplicationController
  # いいね機能一旦停止
  before_action :set_show, only: %i[create destroy]
  before_action :set_gear, only: %i[create destroy]

  def create
    @like = current_user.likes.create(gear_id: params[:gear_id])
  end

  def destroy
    like = current_user.likes.find_by(gear_id: params[:gear_id])
    like.destroy
  end

  private

  def set_show
    @show = Gear.find(params[:gear_id])
  end
end
