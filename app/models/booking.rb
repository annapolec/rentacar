require_relative './concerns/bookable'

class Booking < ActiveRecord::Base
  include Bookable
  def assign_cost  	
  	self.update_attribute(:cost, self.length*self.car.price)
  end
end