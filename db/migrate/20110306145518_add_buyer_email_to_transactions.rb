class AddBuyerEmailToTransactions < ActiveRecord::Migration
  def self.up
    add_column :transactions, :buyer_email, :string

    say_with_time "add buy email" do
      Transaction.all.each do |transaction|
        notification = ActiveMerchant::Billing::Integrations::Alipay::Notification.new(transaction.raw_post)
        transaction.update_attribute(:buyer_email, notification.buyer_email)
      end
    end
  end

  def self.down
    remove_column :transactions, :buyer_email
  end
end
