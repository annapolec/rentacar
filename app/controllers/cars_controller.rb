class CarsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @cars = Car.all
  end

  def show
    @car = Car.find(params[:id])
    @booking = @car.bookings.build
  end

  def new
    @car = Car.new
  end

  def create
    @car = Car.create(car_params)
    @car.assign_price
    if @car.save
      name = @car.name
      redirect_to cars_path
      flash[:success] = "#{name} created"
    else
      render 'new'
      flash[:error] = "Unable to create car. Please try again"
    end
  end

  def destroy
    @car = Car.find(params[:id])
    @car.destroy
    redirect_to cars_path
  end

  def edit
    @car = Car.find(params[:id])
  end

  def update
    @car = Car.find(params[:id])
    @car.update car_params
    if @car.save
      flash[:success] = "Your car was updated succesfully"
      redirect_to root_path
    else
      render 'edit'
    end
  end

  private

    def car_params
      params.require(:car).permit(:name, :description, :category, :delete)
    end

end
