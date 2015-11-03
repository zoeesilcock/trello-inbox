class AddCardIdToIdeas < ActiveRecord::Migration
  def change
    add_column :ideas, :card_id, :string
  end
end
