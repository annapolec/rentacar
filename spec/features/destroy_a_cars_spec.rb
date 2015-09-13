require 'rails_helper'

RSpec.feature "DestroyACars", type: :feature do
  it "should destroy a car with a logged in user" do
    login_as create( :user ), scope: :user
    car = create(:car)
    visit '/cars/1'
        
    click_link_or_button "Destroy"

    expect( Car.count ).to eq(0)
  end
end
