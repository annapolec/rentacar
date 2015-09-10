class Renting < ActiveRecord::Base
	belongs_to :car

	validates :client, :start_date, :finish_date, :car_id, :cost, presence: true
	validates :client, length: { maximum: 30 }
	validates :car_id, numericality: { only_integer: true , greater_than: 0}
	validates :cost, numericality: { only_integer: true , greater_than: 0}
	validates :start_date, date: { after_or_equal_to: Proc.new { Date.today } } 
	validates :finish_date, date: { after: :start_date }

	def assign_cost
		self.cost = (self.finish_date - self.start_date).to_i*self.car.price
	end
end

