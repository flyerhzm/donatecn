class DonatesController < ApplicationController
  include Payment::PaypalHelper
  include Payment::AlipayHelper

  def index
    @alipay_donate = Donate.new(:currency => 'rmb')
    @paypal_donate = Donate.new(:currency => 'usd')
  end

  def create
    @donate = Donate.new(params[:donate])
    if @donate.valid?
      @donate.number = Guid.new.to_s.gsub('-', '')
      case @donate.currency
      when "usd"
        redirect_to_paypal_gateway(:item_name => "donatecn", :amount => @donate.amount)
        return
      when "rmb"
        redirect_to_alipay_gateway(:subject => "donatecn", :body => "donatecn", :amount => @donate.amount, :out_trade_no => "123", :notify_url => payment.alipay_transactions_notify_url)
      end
    else
      render :index
    end
  end
end
