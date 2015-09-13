require 'rails_helper'

RSpec.feature "UpdateCars", type: :feature do
  it "should update a car with a logged in user" do
    login_as create( :user ), scope: :user
    car = create(:car)
    visit '/cars/1/edit'
    fill_in "car_name", with: "Toyota"
    fill_in "car_description", with: "Lorem Ipsum"
    select('B', :from => "car_category")    
    
    click_link_or_button "Update Car"

    expect( Car.count ).to eq(1)
    expect( Car.first.name).to eq("Toyota")
    expect( Car.first.description).to eq("Lorem Ipsum")
    expect( Car.first.category).to eq("B")
    expect( Car.first.price).to eq(75)
  end
end
