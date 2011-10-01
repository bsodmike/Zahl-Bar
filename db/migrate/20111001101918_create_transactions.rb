class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.integer :customer_id
      t.integer :online_shop_id
      t.integer :amount_cts
      t.datetime :due_date
      t.string :state, :default => "pending"
      t.string :barcode
      

      t.timestamps
    end
  end
end
