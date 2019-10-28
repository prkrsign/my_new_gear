class LikesController < ApplicationController
  before_action :set_show, only: %i[create destroy]
  before_action :set_gear, only: %i[create destroy]

  def create
    @like = current_user.likes.create(gear_id: params[:gear_id])
  end

  def destroy
    like = current_user.likes.find_by(gear_id: params[:gear_id])
    like.destroy
  end

  def set_gear
    @gear = Gear.order(created_at: 'DESC').page(params[:page]).per(10)
  end

  private

  def set_show
    @show = Gear.find(params[:gear_id])
  end
end
