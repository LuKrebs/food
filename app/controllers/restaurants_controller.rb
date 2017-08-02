class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: [:show, :edit, :update, :destroy, :chef]

  def index
    @restaurants = Restaurant.all
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    # byebug
    if @restaurant.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new
    end

  end

  def destroy       # DELETE /restaurants/:id
    @restaurant.destroy

    redirect_to restaurants_path
  end

  def edit
  end

  def show
    @reviews = Review.where(restaurant_id: @restaurant.id)
  end

  def chef
  end

  def update
    if @restaurant.update(restaurant_params)
      redirect_to restaurant_path(@restaurant)
    else
      render :edit
    end
  end

  def top
    @restaurants = Restaurant.where(stars: 3)
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :stars, :address)
  end

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

end
