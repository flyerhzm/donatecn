class CreatePaymentTransactions < ActiveRecord::Migration
  def change
    create_table :payment_transactions do |t|
      t.string :type
      t.string :transaction_id
      t.string :transaction_type
      t.string :payment_status
      t.datetime :payment_date
      t.integer :gross
      t.string :raw_post

      t.timestamps
    end
  end
end
