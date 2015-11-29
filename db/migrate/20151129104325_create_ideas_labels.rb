class CreateIdeasLabels < ActiveRecord::Migration
  def change
    create_table :ideas_labels do |t|
      t.integer :idea_id
      t.integer :label_id

      t.timestamps null: false
    end
  end
end
