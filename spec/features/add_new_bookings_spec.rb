require 'rails_helper'

RSpec.feature "AddNewBookings", type: :feature do
  it "should create a new booking with a logged in user" do
    login_as create(:user), scope: :user
    car = create(:car)
    visit "/cars/1"
    fill_in "booking_client", with: "Smith"
    select Date.tomorrow.year, from: "booking_start_time_1i"
    select Date.tomorrow.strftime("%B"), from: "booking_start_time_2i"
    select Date.tomorrow.day, from: "booking_start_time_3i"    
    fill_in "booking_length", with: 2

    click_link_or_button "Book it"

    expect( Booking.count ).to eq(1)
    expect( car.bookings.first.client).to eq("Smith")
    expect( car.bookings.first.start_time).to eq(Date.tomorrow)
    expect( car.bookings.first.length).to eq(2)
    expect( car.bookings.first.end_time).to eq(Date.tomorrow + 2.days)
  end
end

