class GearsController < ApplicationController
    def index 
    end

    def new
        @sample = {'2019-06-01' => 60, '2019-06-02' => 65, '2019-06-03' => 64}
    end
end
