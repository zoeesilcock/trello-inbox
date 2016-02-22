class AddListIdToIdeas < ActiveRecord::Migration
  def change
    add_column :ideas, :list_id, :string
  end
end
