class RestaurantsController < ApplicationController

  def index
    @restaurants = Restaurant.all
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    @reviews = Review.where(restaurant_id: params[:id])

  end

  def destroy
    @restaurant = Restaurant.find(params[:id])
    @restaurant.destroy
    redirect_to restaurants_path, notice: "The restaurant had mice so it was terminated."
  end

  def new
    @restaurants = Restaurant.new
  end

  def create
    @restaurants = Restaurant.new(restaurant_params)
    if @restaurants.save
      redirect_to restaurants_path(@restaurants), notice: "Restaurant Submitted"
    else
      flash.now[:notice]= @restaurants.errors.full_messages
      render :new
    end
  end

  # def edit
  #   @question = Question.find(params[:id])
  # end

  # def update
  #   @question = Question.find(params[:id])
  #   @question.update_attributes(question_params)
  #   redirect_to @question
  # end

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :city, :state, :zipcode, :description, :category)
  end

end
