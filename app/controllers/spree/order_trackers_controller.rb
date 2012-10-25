class Spree::OrderTrackersController < Spree::BaseController

  def create
    @tracker = Spree::OrderTracker.new(params[:order_tracker])
    if @tracker.valid? and order = @tracker.order
      session[:tracked_order_id] = order.id
      redirect_to order_tracker_path(order)
    else
      flash[:error] = I18n.t('spree.order_trackers.create.error')
      render :new
    end
  end

  def new
    @tracker = Spree::OrderTracker.new
  end

  def show
    @order = Spree::Order.find_by_id(session[:tracked_order_id])
    unless @order
      redirect_to new_order_tracker_path
    end
  end

  def destroy
    session[:tracked_order_id] = nil
    redirect_to root_path
  end

end
