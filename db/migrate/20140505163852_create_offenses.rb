class CreateOffenses < ActiveRecord::Migration
  def change
    create_table :offenses do |t|
      t.timestamps
      t.belongs_to :victim
      t.belongs_to :user
      t.belongs_to :offense_type
      t.string     :name
      t.string     :duration
      t.date       :expires_at
      t.string     :reason
      t.string     :url
      t.string     :ip_address
      t.string     :hostname
    end
  end
end
