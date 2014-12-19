class ReviewsController < ApplicationController

  def create
    @restaurant = Restaurant.find_by(params[:id])
    @review = Review.new(review_params)
    @review.restaurant_id = @restaurant.id
    if @review.save
      redirect_to restaurant_path(id: @restaurant.id), notice: "Your review was submitted."
    else
      redirect_to :back, notice: "Your review must be longer than 25 chars."
    end
  end

  def new
    @restaurant = Restaurant.find_by(params[:id])
    @reviews = Review.new
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to :back, notice: "Your review was terminated."
  end

  def review_params
    params.require(:review).permit(:message, :restaurant_id, :rating)
  end
end
