class GearsController < ApplicationController
    def index 
        @gears = Gear.all
        # @pie = {'コスパ': @gear.cost_performance, '音': @gear.sound, 'デザイン': @gear.design, '耐久性': @gear.durability, '不満': @gear.dissatisfaction} 
    end

    def new
        @pie_chart = {'金額' =>20 , '耐久性' =>10 , '音' => 40, 'デザイン' => 10, '不満' => 20}
    end

    def create
      @gear = Gear.new(gear_params) 
      sum = (@gear.cost_performance.to_i + @gear.sound.to_i + @gear.design.to_i + @gear.durability.to_i + @gear.dissatisfaction.to_i) 
      if  sum == 100
        if @gear.save
          redirect_to root_path, notice: "レビューを投稿しました"
        else
          redirect_to new_gear_path, alert: "投稿に失敗しました"
        end
      else
        redirect_to new_gear_path, alert: "合計が100ポイントになるように評価ください"
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
        :review,
        :title,
        ).merge(user_id: current_user.id)
    end
end
