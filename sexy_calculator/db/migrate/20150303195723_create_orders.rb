class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :width
      t.integer :depth
      t.integer :height
      t.integer :distance
      t.integer :additional_slack
      t.integer :starting_u
      t.integer :ending_u
      t.integer :racks_crossed
      t.integer :racks_through
      t.integer :aisles

      t.timestamps
    end
  end
end
