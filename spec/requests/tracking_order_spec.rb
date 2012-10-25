require 'spec_helper'

describe 'Tracking Page' do

  context "Submitting the form" do

    before do
      @order = create(:order, state: 'canceled')
      @order.update_attribute(:email, 'test@example.com')
      visit spree.new_order_tracker_path
    end

    context "when valid" do
      before do
        fill_in 'Email', :with => 'test@example.com'
        fill_in 'Number', :with => @order.number
        click_button I18n.t('spree.order_trackers.new.track_your_order')
      end

      it "I should be redirected to tracker page with order info" do
        current_path.should == spree.order_tracker_path(@order)
      end
    end

    context "when invalid" do
      context "Email and message are invalid" do
        before do
          fill_in 'Email', :with => 'a@a.com'
          fill_in 'Number', :with => ''
          click_button I18n.t('spree.order_trackers.new.track_your_order')
        end

        it "I should see error messages" do
          within '#errorExplanation' do
            page.should have_content "Number can't be blank"
          end
        end
      end
    end
  end

end
