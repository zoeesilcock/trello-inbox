class AddDescriptionToInboxes < ActiveRecord::Migration
  def change
    add_column :inboxes, :description, :text
  end
end
