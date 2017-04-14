class CreateLogs < ActiveRecord::Migration
  def change
    create_table :logs do |t|
      t.integer :temp
      t.integer :humidity
      t.integer :light
      t.string :actuator_state
      t.integer :manager_id
    end
  end
end
