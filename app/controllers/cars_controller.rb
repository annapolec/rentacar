class CarsController < ApplicationController
	def new	
		@car = Car.new	
	end

	def create
		@car = Car.create(car_params)
		@car.price = assigned_price(@car.category)
		if @car.save
			flash[:success] = "Car successfullu created."
			redirect_to root_path
		else
			render 'new'
		end
	end

	def index
		@cars = Car.all
	end

	def edit
		@car = Car.find(params[:id])
	end

	def update
		@car = Car.find(params[:id])
		if @car.update_attributes(car_params)
			@car.update_attribute(:price, assigned_price(@car.category))
			flash[:success] = "Car updated."
			redirect_to root_path
		else
			render 'edit'
		end
	end

	def show
		@car = Car.find(params[:id])
	end

	def destroy
		@car = Car.find(params[:id])
		if @car.destroy
			flash[:success] = "Car destroyed"
			redirect_to cars_path
		end
	end

	private
	def car_params
		params.require(:car).permit(:name, :description, :category)
	end

	def assigned_price(category)
		prices = {	"A" => 100, 
								"B" => 75,
								"C" => 50 }
		prices[category]
	end
end

