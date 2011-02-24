class CreateTransactions < ActiveRecord::Migration
  def self.up
    create_table :transactions do |t|
      t.string :notify_id
      t.float :total_fee
      t.string :trade_status
      t.string :trade_no
      t.datetime :notify_time
      t.text :raw_post

      t.timestamps
    end
  end

  def self.down
    drop_table :transactions
  end
end
