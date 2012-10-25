Spree::Shipment.class_eval do
  def tracking_events
    if shipping_method.calculator.respond_to?(:carrier)
      shipping_method.calculator.carrier.find_tracking_info(tracking).shipment_events
    end
  end
end
