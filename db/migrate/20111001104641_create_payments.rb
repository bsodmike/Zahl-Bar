class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.integer :offline_partner_id
      t.integer :transaction_id

      t.timestamps
    end
  end
end
