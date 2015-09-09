class RentingsController < ApplicationController
	def new
		@renting = Renting.new
	end

	def create
		@car = Car.find(params[:renting][:car_id])
		@renting = @car.rentings.create(rentings_params)
		@renting.assign_cost
		if @renting.save
			flash[:success] = "Renting created."
			redirect_to root_path
		else
			render 'new'
		end
	end

	def index
		@rentings = Renting.all
	end

	def destroy
		@renting = Renting.find(params[:id])
		if @renting.destroy
			flash[:success] = "Renting canceled"
			redirect_to root_path
		end
	end


	private 
	def rentings_params
		params.require(:renting).permit(:client, :start_date, :finish_date, :car_id)
	end
end
