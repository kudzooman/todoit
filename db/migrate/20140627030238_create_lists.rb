class CreateLists < ActiveRecord::Migration
  def change
    create_table :lists do |t|
      t.string :name
      t.timestamps
      t.references :users
    end
  end
end
