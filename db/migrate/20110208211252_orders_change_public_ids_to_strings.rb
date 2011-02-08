class OrdersChangePublicIdsToStrings < ActiveRecord::Migration
  def self.up
    remove_column :orders, :public_id
    add_column :orders, :public_id, :string, :limit => 10
    add_column :orders, :is_active, :boolean
  end

  def self.down
    remove_column :orders, :public_id
    add_column :orders, :public_id, :integer
    remove_column :orders, :is_active
  end
end
