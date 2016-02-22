class AddInboxIdToLists < ActiveRecord::Migration
  def change
    add_column :lists, :inbox_id, :string
  end
end
