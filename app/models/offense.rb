class Offense < ActiveRecord::Base
  belongs_to :victim
  belongs_to :user
  belongs_to :offense_type

  before_save :set_hostname

  def trace_ip_address_url
    unless ip_address.blank?
      "http://www.utrace.de/?query=#{ip_address}"
    end
  end

private

  def set_hostname
    if hostname.blank?
      begin
        self.hostname = Resolv.getname(ip_address) unless ip_address.blank?
      rescue Resolv::ResolvError
        self.hostname = ''
      end
    end
  end
end
