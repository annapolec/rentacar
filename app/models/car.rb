class Car < ActiveRecord::Base
	has_many :rentings

	def assign_price
		prices = {	"A" => 100, 
								"B" => 75,
								"C" => 50 }
		self.price = prices[self.category]
	end

	def history_of_rentings
		self.rentings.order(:start_date)
	end
end
