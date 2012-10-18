class Spree::TrackersController < Spree::BaseController
  def create
    @order = Spree::Order.find_for_tracking(params[:order_number], params[:email])
    if @order
      session[:tracked_order_id] = @order.try(:id)
      redirect_to "http://localhost:3000/trackers/show"
    else
      flash[:error] = I18n.t('orders_tracker.couldnt_find_order')
      redirect_to "http://localhost:3000/trackers/new"
    end
  end

  def show
    @order = Spree::Order.find_by_id(session[:tracked_order_id])
    redirect_to new_tracker_url and return if @order.nil?
    render :template => "orders/show"
  end

  def destroy
    session[:tracked_order_id] = nil
    redirect_to root_url
  end
end
