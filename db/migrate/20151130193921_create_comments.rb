class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :user_name
      t.string :user_avatar
      t.text :text
      t.integer :idea_id
      t.string :action_id

      t.timestamps null: false
    end
  end
end
