class AddUserVictimAssociations < ActiveRecord::Migration
  def change
    change_table :victims do |v|
      v.belongs_to :user
    end
  end
end
