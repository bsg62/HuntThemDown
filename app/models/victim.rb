class Victim < ActiveRecord::Base
  has_many :comments
  has_many :offenses
end
