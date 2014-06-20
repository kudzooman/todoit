class AddToDosToList < ActiveRecord::Migration
  def change
    add_column :lists, :references, :todo
  end
end
