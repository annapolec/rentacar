require 'rails_helper'

RSpec.feature "CancelBookings", type: :feature do
  it "should cancel a booking with a logged in user" do
    login_as create( :user ), scope: :user
    car = create(:car)
    booking = create(:booking)
    visit '/cars/1/bookings/1'
        
    click_link_or_button "Cancel"

    expect( Booking.count ).to eq(0)
  end
end
