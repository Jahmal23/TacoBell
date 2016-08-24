class CreateTacos < ActiveRecord::Migration
  def change
    create_table :tacos do |t|
      t.string :notes
      t.integer :meat_id

      t.timestamps null: false
    end
  end
end
