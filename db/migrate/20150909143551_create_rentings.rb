class CreateRentings < ActiveRecord::Migration
  def change
    create_table :rentings do |t|
      t.string :client
      t.date :start_date
      t.date :finish_date
      t.integer :car_id, index: true
      t.integer :cost

      t.timestamps
    end
  end
end
