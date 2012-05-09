class DonatesController < ApplicationController
  include Payment::PaypalHelper

  def index
    @alipay_donate = Donate.new(:currency => 'rmb')
    @paypal_donate = Donate.new(:currency => 'usd')
  end

  def create
    @donate = Donate.new(params[:donate])
    if @donate.valid?
      @donate.number = Guid.new.to_s.gsub('-', '')
      if @donate.currency == "usd"
        redirect_to_paypal_gateway(:item_name => "donatecn", :amount => @donate.amount)
        return
      end
      render :confirm
    else
      render :index
    end
  end
end
