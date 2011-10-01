class CreateOnlineShops < ActiveRecord::Migration
  def change
    create_table :online_shops do |t|
      t.string :name

      t.timestamps
    end
  end
end
