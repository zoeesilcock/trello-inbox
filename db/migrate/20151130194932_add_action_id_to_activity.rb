class AddActionIdToActivity < ActiveRecord::Migration
  def change
    add_column :activities, :action_id, :string
  end
end
