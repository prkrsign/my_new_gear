class GearsController < ApplicationController
    def index 
    end

    def new
        @pie_chart = {'金額' =>20 , '耐久性' =>10 , '音' => 40, 'デザイン' => 10, '不満' => 20}
    end
end
