class Transaction < ActiveRecord::Base
  scope :histories, where(:trade_status => "TRADE_SUCCESS").order("notify_time desc")
end
