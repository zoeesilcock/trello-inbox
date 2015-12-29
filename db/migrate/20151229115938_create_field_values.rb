class CreateFieldValues < ActiveRecord::Migration
  def change
    create_table :field_values do |t|
      t.integer :field_id
      t.integer :idea_id
      t.text :value

      t.timestamps null: false
    end
  end
end
