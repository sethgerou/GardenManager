class CreateManagers < ActiveRecord::Migration
  def change
    create_table :managers do |t|
      t.string :name
      t.string :key
      t.integer :zipcode
      t.string :mode
      t.integer :roof_open_temp
      t.integer :roof_close_temp
    end
  end
end
