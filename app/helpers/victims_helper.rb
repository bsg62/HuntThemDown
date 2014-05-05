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

end
