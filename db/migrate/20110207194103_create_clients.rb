class CreateClients < ActiveRecord::Migration
  def self.up
    create_table :clients do |t|
      t.string :company_name
      t.string :phone
      t.string :fax
      t.string :email
      t.string :representative_name
      t.text :comments
      t.timestamps
    end

    add_index :clients, :company_name
  end

  def self.down
    drop_table :clients
  end
end
