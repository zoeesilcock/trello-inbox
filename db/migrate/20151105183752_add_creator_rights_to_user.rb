class AddCreatorRightsToUser < ActiveRecord::Migration
  def change
    add_column :users, :creator, :boolean, default: false
  end
end
