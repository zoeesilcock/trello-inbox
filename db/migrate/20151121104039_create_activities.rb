class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.string :user_name
      t.string :user_avatar
      t.integer :action
      t.integer :target
      t.text :data

      t.timestamps null: false
    end
  end
end
