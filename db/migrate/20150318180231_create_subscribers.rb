class CreateSubscribers < ActiveRecord::Migration[5.0]
  def change
    create_table :subscribers do |t|
      t.string :phone_number
      t.boolean :subscribed, :default => false
      t.timestamps null: false
    end
  end
end
