class AddIdeaToActivity < ActiveRecord::Migration
  def change
    add_column :activities, :idea_id, :integer
  end
end
