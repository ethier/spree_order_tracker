require 'spec_helper'

describe Spree::Tracker do

  it_should_behave_like 'ActiveModel'

  describe "Validations" do

    it {should validate_presence_of(:email)}
    it {should validate_presence_of(:number)}

  end

  describe 'Methods' do

    before do
      @order = create(:order)
      # Set after create otherwise its setting to another email.
      @order.update_attribute(:email, 'Valid@Email.com')
    end

    describe '#order' do

      it 'should return nil if tracker is invalid or order not found' do
        tracker = Spree::Tracker.new(:email => "Valid@Email.com", :number => "")
        tracker.order.should be_nil
      end

      it 'should return order if valid' do
        tracker = Spree::Tracker.new(:email => "Valid@Email.com", :number => @order.number)
        tracker.order.should eql(@order)
      end

    end

    describe '#save' do

      it 'should return false if records invalid' do
        tracker = Spree::Tracker.new(:email => "Valid@Email.com", :number => "")
        tracker.save.should eql(false)
      end

      it 'should return true if records valid' do
        tracker = Spree::Tracker.new(:email => "Valid@Email.com", :number => @order.number)
        tracker.save.should eql(true)
      end

    end

    describe '#to_key' do
      it { subject.should respond_to(:to_key) }
    end

  end

end
