class GearsController < ApplicationController
  before_action :set_gear, only: [:show]
  before_action :set_search, only: %i[index show]
  before_action :set_reviews, only: %i[show]

  def index
    @gear = Gear.all.page(params[:page]).per(12)
    @increments = Gear.where('gearname LIKE(?)', "#{params[:keyword]}%")
    respond_to do |format|
      format.html
      format.json
    end
  end

  def search
    @search = Gear.search(search_params)
    @gear = @search.result(distinct: true).page(params[:page]).per(12)
  end

  def show
    gon.sound = Gear.average_point(@gear.id, 'sound')
    gon.cost_performance = Gear.average_point(@gear.id, 'cost_performance')
    gon.durability = Gear.average_point(@gear.id, 'durability')
    gon.design = Gear.average_point(@gear.id, 'design')
    gon.satisfaction_level = Gear.average_point(@gear.id, 'satisfaction_level')
  end

  def set_gear
    @gear = Gear.find(params[:id])
  end

  def set_reviews
    @reviews = Review.where(gear_id: params[:id])
  end

  def set_search
    @search = Gear.ransack(params[:q])
  end

  private

  def search_params
    params.require(:q).permit(:gearname_or_maker_or_category_cont)
  end
end
