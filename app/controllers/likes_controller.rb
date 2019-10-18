class LikesController < ApplicationController
    before_action :set_show, only: [:create, :destroy]

    def create
      @like = current_user.likes.create(gear_id: params[:gear_id])
      @gear = Gear.order(created_at: 'DESC').page(params[:page]).per(10)
    end
  
    def destroy
      like = current_user.likes.find_by(gear_id: params[:gear_id])
      like.destroy
      @gear = Gear.order(created_at: 'DESC').page(params[:page]).per(10)
    end

  private
  
    def set_show
      @show = Gear.find(params[:gear_id])
    end
end