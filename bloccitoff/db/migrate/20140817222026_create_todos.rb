class CreateTodos < ActiveRecord::Migration
  def change
    create_table :todos do |t|
      t.text :description
      t.integer :days_left
      t.boolean :complete

      t.timestamps
    end
  end
end
