class CreateOffenseTypes < ActiveRecord::Migration
  def change
    create_table :offense_types do |t|
      t.timestamps
      t.string :name
    end
  end
end
