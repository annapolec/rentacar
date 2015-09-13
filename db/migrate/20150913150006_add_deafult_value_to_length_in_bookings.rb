class AddDeafultValueToLengthInBookings < ActiveRecord::Migration
  def change
  	change_column :bookings, :length, :integer, default: 1
  end
end
