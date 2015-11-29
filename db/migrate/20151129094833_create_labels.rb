class CreateLabels < ActiveRecord::Migration
  def change
    create_table :labels do |t|
      t.timestamps null: false
      t.string :text
      t.string :color
      t.string :trello_id
    end
  end
end
