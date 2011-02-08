class CreateOrders < ActiveRecord::Migration
  def self.up
    create_table :orders do |t|
      t.integer :public_id
      t.text :device_description
      t.integer :device_count
      t.text :comments
      t.integer :client_id
      t.text :task_description

      t.timestamps
    end
  end

  def self.down
    drop_table :orders
  end
end
