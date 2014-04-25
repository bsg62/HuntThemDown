class CreateVictims < ActiveRecord::Migration
  def change
    create_table :victims do |t|
      t.date :date
      t.string :name
      t.string :reason
      t.string :ip

      t.timestamps
    end
  end
end
