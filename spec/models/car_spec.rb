require 'spec_helper'

describe Car do
	it { should validate_presence_of(:name) }
	it { should validate_presence_of(:description) }
	it { should validate_presence_of(:category) }
	it { should validate_presence_of(:price) }
	it { should validate_numericality_of(:price).only_integer.greater_than(0) }
	it { should validate_inclusion_of(:category).in_array(%w(A B C)) }
	it { should validate_length_of(:name).is_at_most(30) }
	it { should validate_length_of(:description).is_at_most(300) }
end