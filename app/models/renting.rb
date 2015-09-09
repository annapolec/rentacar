class Renting < ActiveRecord::Base
	belongs_to :car

	def assign_cost
		self.cost = (self.finish_date - self.start_date).to_i*self.car.price
	end
end
