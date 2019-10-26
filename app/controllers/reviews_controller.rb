class ReviewsController < ApplicationController
  before_action :set_review, only: [:edit, :update, :destroy]
  before_action :set_gear,   only: [:new, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new]

  def new
    @review = Review.new
  end

  def edit; end

  def update
    if @review.update(review_params)
      redirect_to gear_path(@gear.id), notice: 'レビューを更新しました'
    else
      redirect_to edit_gear_review_path(@gear.id, @review.id), alert: 'レビューの更新に失敗しました'
    end
  end

  def create
    review = Review.new(review_params)
    if review.save
      redirect_to root_path, notice: 'レビューを投稿しました'
    else
      redirect_to new_gear_review_path, alert: 'レビューの投稿に失敗しました'
    end
  end

  def destroy
    @review.destroy
    redirect_to gear_path(@gear.id), notice: 'レビューを削除しました'
  end

  def set_review
    @review = Review.find(params[:id])
  end

  def set_gear
    @gear = Gear.find(params[:gear_id])
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
