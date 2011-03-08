class DonatesController < ApplicationController
  def index
    @donate = Donate.new
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
