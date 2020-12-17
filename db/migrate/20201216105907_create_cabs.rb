class CreateCabs < ActiveRecord::Migration[6.0]
  def change
    create_table :cabs do |t|
      t.string :number
      t.integer :city_id
      t.string :state
      t.datetime :transition_at

      t.timestamps
    end
  end
end
