class CreateTacoToSides < ActiveRecord::Migration
  def change
    create_table :taco_to_sides do |t|
      t.integer :taco_id
      t.integer :side_id

      t.timestamps null: false
    end
  end
end
