class Victim < ActiveRecord::Base
  belongs_to :user

  before_save :set_hostname

private

  def set_hostname
    begin
      self.hostname = Resolv.getname(ip_address) unless ip_address.blank?
    rescue Resolv::ResolvError
      self.hostname = ''
    end
  end

end
