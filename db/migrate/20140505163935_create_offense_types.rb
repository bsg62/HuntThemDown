class CreateOffenseTypes < ActiveRecord::Migration
  def change
    create_table :offense_types do |t|
      t.timestamps
      t.string :name
      t.string :slug
    end
  end
end
