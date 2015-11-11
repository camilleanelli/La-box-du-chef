class RestaurantsController < ApplicationController

  before_action :authenticate_user!
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_restaurant, only: [:show, :edit, :update, :destroy]

  def index
    @restaurants = Restaurant.all
  end

  def new
    @restaurant = Restaurant.new
  end

  def create

    @restaurant = Restaurant.new(params_restaurant)
    @restaurant.user_id = current_user.id
      if @restaurant.save
        redirect_to root_path
      else
        render :new
      end
  end

  def edit

  end

  def update

    @restaurant.update(params_restaurant)
    if @restaurant.save
    redirect_to restaurants_path #provisoire,à rediriger
    else
    render :edit
    end

  end



  def show
  end


  def delete
  end

private

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

  def params_restaurant
    params.require(:restaurant).permit(:name,:user_id, :category, :address, :locality, :postal_code, :picture, :phone_number,
     :iban, :address, :picture, :latitude, :longitude)
  end



end
