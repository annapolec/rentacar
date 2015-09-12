class DropTableRentings < ActiveRecord::Migration
  def change
  	drop_table :rentings
  end
end
