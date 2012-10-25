module Spree
  class OrderTracker
    include ActiveModel::Conversion
    include ActiveModel::Validations

    attr_accessor :email, :number

    validates :email,   :format => { :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i },
                         :presence => true
    validates :number, :presence => true

    def initialize(attributes = {})
      attributes.each do |key, value|
        self.send("#{key}=", value)
      end
    end

    def order
      if valid?
        Spree::Order.find_for_tracking(number, email)
      else
        nil
      end
    end

    def persisted?
      false
    end

    def save
      if valid?
        return true
      end
      return false
    end

  end
end
