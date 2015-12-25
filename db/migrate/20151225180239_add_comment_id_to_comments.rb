class AddCommentIdToComments < ActiveRecord::Migration
  def change
    add_column :comments, :comment_id, :string
  end
end
