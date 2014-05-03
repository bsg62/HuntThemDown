class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.timestamps
      t.belongs_to :user
      t.belongs_to :victim
      t.string :body
    end
  end
end
