module VictimsHelper
  include Memoizable

  def offenses
    @victim.offenses
  end
  memoize :offenses

  def comments
    @victim.comments
  end
  memoize :comments

  def known_ip_addresses
    offenses.map do |offense|
      unless offense.ip_address.blank?
        link_to(offense.ip_address, offense.trace_ip_address_url, target: '_blank')
      end
    end
  end
  memoize :known_ip_addresses

end
