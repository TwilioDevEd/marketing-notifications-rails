class CreateSubscribers < ActiveRecord::Migration
  def change
    create_table :subscribers do |t|
      t.string :phone_number
      t.boolean :subscribed, :default => false
      t.timestamps null: false
    end
  end
end
