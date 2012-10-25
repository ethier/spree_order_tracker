require 'spec_helper'

describe Spree::TrackersController do

  before(:each) do
    @order = create(:order)
    # Set after create otherwise its setting to another email.
    @order.update_attribute(:email, 'Valid@Email.com')
  end

  context 'create' do
    it "should redirect to show path when valid" do
      spree_post :create, :tracker => {:email => 'Valid@Email.com', :number => @order.number}
      response.should redirect_to(spree.tracker_path(@order))
    end

    it 'should render new again and set flash error when invalid' do
      spree_post :create, :tracker => {:email => 'invalid@email.com', :number => @order.number}
      flash[:error].should == I18n.t('spree_order_tracker.couldnt_find_order')
      response.should render_template(:new)
    end
  end

end
