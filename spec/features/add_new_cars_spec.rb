require 'rails_helper'

RSpec.feature "AddNewCars", type: :feature do
  it "should create a new car with a logged in user" do
    login_as create( :user ), scope: :user
    visit new_car_path
    within "#new_car" do
      fill_in "car_name", with: "Opel"
      fill_in "car_description", with: "Lorem Ipsum"
      select('A', :from => "car_category")
    end

    click_link_or_button "Create Car"

    expect( Car.count ).to eq(1)
    expect( Car.first.name).to eq("Opel")
    expect( Car.first.description).to eq("Lorem Ipsum")
    expect( Car.first.category).to eq("A")
    expect( Car.first.price).to eq(100)

  end

end
