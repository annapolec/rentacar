class CreateCars < ActiveRecord::Migration
  def change
    create_table :cars do |t|
      t.string :name
      t.text :description
      t.string :category
      t.integer :price

      t.timestamps
    end
  end
end
