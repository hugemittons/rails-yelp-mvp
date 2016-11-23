class ReviewsController < ApplicationController
  def index
    @reviews = Review.all
  end

  def show
  end

  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
  end

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new(review_params)
    @review.restaurant = @restaurant
    if @review.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review.update(review_params)
    if @review.update
      redirect_to restaurant_path(@restaurant)
    else
      render :edit
    end
  end

  def destroy
  end

  private
  def review_params
    params.require(:review).permit(:content, :rating)
  end

  def set_review
    @review = Review.find(params[:id])
  end
end
