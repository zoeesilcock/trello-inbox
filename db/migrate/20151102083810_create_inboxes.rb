class CreateInboxes < ActiveRecord::Migration
  def change
    create_table :inboxes do |t|
      t.timestamps null: false
      t.string :title
      t.string :board_id
    end
  end
end
