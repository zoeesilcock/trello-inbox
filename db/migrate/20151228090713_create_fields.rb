class CreateFields < ActiveRecord::Migration
  def change
    create_table :fields do |t|
      t.string :title
      t.text :description
      t.boolean :required
      t.integer :order
      t.integer :inbox_id

      t.timestamps null: false
    end
  end
end
