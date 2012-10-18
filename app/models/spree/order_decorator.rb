Spree::Order.class_eval do
  	def self.find_for_tracking(number=nil, email=nil)
    	return nil if number.blank? or email.blank?
   		find_by_number(number, :include => :bill_address,
                   :conditions => ["spree_orders.email = ?", email])
	end
end