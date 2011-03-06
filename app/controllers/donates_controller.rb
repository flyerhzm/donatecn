class DonatesController < ApplicationController
  def index
    @donate = Donate.new
    @transactions = Transaction.where(:trade_status => "TRADE_SUCCESS").order("notify_time desc")
  end

  def create
    @donate = Donate.new(params[:donate])
    if @donate.valid?
      @donate.number = Guid.new.to_s.gsub('-', '')
      render :confirm
    else
      render :index
    end
  end
end
