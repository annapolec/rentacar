require_relative './concerns/bookable'

class Booking < ActiveRecord::Base
  include Bookable
  def assign_cost
  	self.car.price * self.length
  end
  def assign_number_of_days
  	self.length *= 24
  end
end