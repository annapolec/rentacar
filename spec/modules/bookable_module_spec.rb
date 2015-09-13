require 'rails_helper'
describe Bookable do
	let(:including_class) { Class.new { include Bookable } }
end