class CreateVictims < ActiveRecord::Migration
  def change
    create_table :victims do |t|
      t.timestamps
      t.string :name
    end
  end
end
