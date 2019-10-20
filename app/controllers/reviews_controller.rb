class ReviewsController < ApplicationController

  def new
    @review = Review.new
    @gear = Gear.find_by(id: params[:gear_id])
  end

  def create
    review = Review.new(review_params)
    if review.save
      redirect_to root_path
    else
      redirect_to new_gear_review_path, alert: 'レビューの投稿に失敗しました'
    end
  end

  def destroy
  end

  private
    def review_params
      params.require(:review).permit(
        :cost_performance,
        :sound,
        :design,
        :durability,
        :satisfaction_level,
        :title,
        :detail
      ).merge(user_id: current_user.id, gear_id: params[:gear_id])
    end
end
