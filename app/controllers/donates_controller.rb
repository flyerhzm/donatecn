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
        #redirect_to_paypal_gateway(:item_name => "donatecn", :amount => @donate.amount)
        options = {:item_name => "donatecn", :amount => @donate.amount}
        redirect_to URI.encode("https://www.sandbox.paypal.com/cgi-bin/webscr?cmd=_ext-enter&redirect_cmd=_xclick&charset=utf-8&business=#{Payment::CONFIGS["paypal"]["email"]}&currenct_code=USD&item_name=#{options[:item_name]}&amount=#{options[:amount]}")
        return
      end
      render :confirm
    else
      render :index
    end
  end
end
