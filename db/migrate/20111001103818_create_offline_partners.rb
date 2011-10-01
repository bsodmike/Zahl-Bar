class CreateOfflinePartners < ActiveRecord::Migration
  def change
    create_table :offline_partners do |t|
      t.string :name

      t.timestamps
    end
  end
end
