class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.string :client 
      t.datetime :start_time
      t.datetime :end_time
      t.integer :length
      t.integer :cost
      t.belongs_to :car, index: true
    end
  end
end
