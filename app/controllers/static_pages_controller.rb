class StaticPagesController < ApplicationController
	def home		
	end

	def search_results
		if params[:length].empty?
			params[:length] = 1
		end		
		@booking = Booking.new(start_time: params[:start_time], length: params[:length])
		@booking.calculate_end_time
		@cars = Car.all
		render :partial => 'search_results', :content_type => 'text/html'
	end
end
