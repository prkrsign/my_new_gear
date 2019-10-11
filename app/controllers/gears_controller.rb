class GearsController < ApplicationController
    def index 
        @gears = Gear.all
        # @pie = {'コスパ': @gear.cost_performance, '音': @gear.sound, 'デザイン': @gear.design, '耐久性': @gear.durability, '不満': @gear.dissatisfaction} 
    end

    def new
        @pie_chart = {'金額' =>20 , '耐久性' =>10 , '音' => 40, 'デザイン' => 10, '不満' => 20}
    end

    def create
      # binding.pry
      @gear = Gear.new(gear_params)
      if @gear.save
        redirect_to root_path, notice: "レビューを投稿しました"
      else
        redirect_to new_gear_path, notice: "投稿に失敗しました"
      end
    end

    private

    def gear_params
      params.permit(
        :image,
        :category_id,
        :maker_id,
        :gearname,
        :cost_performance,
        :sound,
        :design,
        :durability,
        :dissatisfaction,
        :review
        ).merge(user_id: current_user.id)
    end
end
