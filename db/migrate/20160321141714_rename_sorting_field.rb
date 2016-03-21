class RenameSortingField < ActiveRecord::Migration
  def change
    rename_column :fields, :order, :sorting
  end
end
