class Spree::TrackersController < Spree::BaseController

  def create
    @tracker = Spree::Tracker.new(params[:tracker])
    if @tracker.valid? and order = @tracker.order
      session[:tracked_order_id] = order.id
      redirect_to tracker_path(order)
    else
      flash[:error] = I18n.t('spree_order_tracker.couldnt_find_order')
      render :new
    end
  end

  def new
    @tracker = Spree::Tracker.new
  end

  def show
    @order = Spree::Order.find_by_id(session[:tracked_order_id])
    unless @order
      redirect_to new_tracker_path
    end
  end

  def destroy
    session[:tracked_order_id] = nil
    redirect_to root_path
  end

end
