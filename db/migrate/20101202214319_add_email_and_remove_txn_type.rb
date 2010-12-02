class AddEmailAndRemoveTxnType < ActiveRecord::Migration
  def self.up
    add_column :users, :email, :string
    remove_column :payment_notifications, :txn_type
  end

  def self.down
    remove_column :users, :email
    add_column :payment_notifications, :txn_type, :string
  end
end
