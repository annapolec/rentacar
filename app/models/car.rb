class Car < ActiveRecord::Base
	has_many :rentings

	validates :name, :description, :category, :price, presence: true
	validates :name, length: { maximum: 30 }
	validates :description, length: { maximum: 300 }
	validates :category, inclusion: { in: ["A", "B", "C"] }
	validates :price, numericality: { only_integer: true, greater_than: 0 }


	def assign_price
		prices = {	"A" => 100, 
								"B" => 75,
								"C" => 50 }
		self.price = prices[self.category]
	end

	def history_of_rentings
<<<<<<< HEAD
		self.rentings.order(:start_date)
=======
		self.rentings
>>>>>>> Validations
	end
end
