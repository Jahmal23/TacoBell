class AddForeignKeys < ActiveRecord::Migration
  def change
    add_foreign_key :tacos, :meats
    add_foreign_key :taco_to_sides, :tacos
    add_foreign_key :taco_to_sides, :sides
  end
end
