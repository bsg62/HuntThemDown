class CreateVictims < ActiveRecord::Migration
  def change
    create_table :victims do |t|
      t.timestamps
      t.belongs_to :user
      t.string :name
      t.string :reason
      t.string :url
      t.string :ip_address
      t.string :hostname
    end
  end
end
