class RemoveDescriptionFromIdeas < ActiveRecord::Migration
  def change
    remove_column :ideas, :description
  end
end
