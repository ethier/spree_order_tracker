Spree::Order.class_eval do

  def self.find_for_tracking(number=nil, email=nil)
    return nil if number.blank? or email.blank?
    where(email: email, number: number).first
  end

end
