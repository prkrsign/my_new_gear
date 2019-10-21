class GearsController < ApplicationController
  before_action :set_gear, only: [:show]
  before_action :set_search, only: [:index, :show]
  # before_action :authenticate_user!, only: [:new] (削除予定)

    def index
      # @gear = Gear.all.page(params[:page]).per(10)
      # @gear = Gear.order(created_at: 'DESC').page(params[:page]).per(10)
    end

    def search
      @search = Gear.search(search_params)
      @gear = @search.result(distinct: true).order(created_at: 'DESC').page(params[:page]).per(10)
    end

    def show
      gon.sound = Gear.average_point(@gear.id, 'sound')
      gon.cost_performance = Gear.average_point(@gear.id, 'cost_performance')
      gon.durability = Gear.average_point(@gear.id, 'durability')
      gon.design = Gear.average_point(@gear.id, 'design')
      gon.satisfaction_level = Gear.average_point(@gear.id, 'satisfaction_level')
    end

    # 削除予定
    # def new
    #   @gear = Gear.new
    # end

    # 削除予定
    # def create
    #   @gear = Gear.new(gear_params) 
    #   sum = (@gear.cost_performance.to_i + @gear.sound.to_i + @gear.design.to_i + @gear.durability.to_i + @gear.dissatisfaction.to_i) 
    #   if  sum == 100
    #     if @gear.save
    #       redirect_to root_path, notice: "レビューを投稿しました"
    #     else
    #       redirect_to new_gear_path, alert: "投稿に失敗しました"
    #     end
    #   else
    #     redirect_to new_gear_path, alert: "合計が100ポイントになるように評価ください"
    #   end
    # end

    # 削除予定
    # def edit
    # end

    # 削除予定
    # def update
    #   @gear.update(gear_params)
    #   redirect_to  gear_path, notice: 'レビューを編集しました'
    # end

    # 削除予定
    # def destroy
    #   @gear.destroy
    #   redirect_to root_path
    # end

    def set_gear
      @gear = Gear.find(params[:id])
    end

    def set_search
      @search = Gear.ransack(params[:q])
    end

  private

    def gear_params
      params.require(:gear).permit(
        :image,
        :category_id,
        :maker_id,
        :gearname,
        :cost_performance,
        :sound,
        :design,
        :durability,
        :dissatisfaction,
        :review,
        :title,
        ).merge(user_id: current_user.id)
    end

    def search_params
      params.require(:q).permit(:gearname_or_maker_or_category_cont)
    end
end
