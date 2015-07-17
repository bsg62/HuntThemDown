class AddOtpUseFlagToUsers < ActiveRecord::Migration
  def change
    add_column :users, :use_otp, :boolean, default: false
  end
end
