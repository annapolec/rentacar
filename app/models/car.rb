class Car < ActiveRecord::Base
	has_many :rentings
	has_many :bookings

	def assign_price
		prices = {	"A" => 100, 
								"B" => 75,
								"C" => 50 }
		self.price = prices[self.category]
	end
end
