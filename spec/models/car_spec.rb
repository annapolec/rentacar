require 'spec_helper'

describe Car do
	it "has a valid factory" do
    FactoryGirl.create(:car).should be_valid
  end

	it { should validate_presence_of(:name) }
	it { should validate_presence_of(:description) }
	it { should validate_presence_of(:category) }
	it { should validate_presence_of(:price) }
	it { should validate_numericality_of(:price).only_integer }
	it { should validate_numericality_of(:price).is_greater_than(0) }
	it { should validate_inclusion_of(:category).in_array(%w(A B C)) }
	it { should validate_length_of(:name).is_at_most(30) }
	it { should validate_length_of(:description).is_at_most(300) }

	it { should have_many :bookings }

	it "should assign_price correctly" do
		car = FactoryGirl.build(:car, category: "A")
		car.assign_price
		car.price.should == 100
	end
end