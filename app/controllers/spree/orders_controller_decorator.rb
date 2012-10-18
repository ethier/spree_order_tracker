#Spree::OrdersController.class_eval do
#  	def self.find_for_tracking(number=nil, zipcode=nil)
#    	return nil if number.blank? or zipcode.blank?
#   		find_by_number(number, :include => :bill_address,
#                   :conditions => ["addresses.zipcode = ?", zipcode])
#	end
#end