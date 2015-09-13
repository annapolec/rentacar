require 'spec_helper'

describe Booking do	
	it { should validate_presence_of(:start_time) }
	it { should validate_presence_of(:length) }
	it { should validate_presence_of(:client) }
	it { should validate_numericality_of(:length).only_integer.is_greater_than(1) }	
	it { should_not allow_value(Date.yesterday).for(:start_time) }	
	
	it { should belong_to(:car) }
end