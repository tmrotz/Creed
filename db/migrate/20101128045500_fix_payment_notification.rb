class FixPaymentNotification < ActiveRecord::Migration
  def self.up
    remove_column :payment_notifications, :params
    remove_column :payment_notifications, :cart_id
    remove_column :payment_notifications, :transaction_id

    add_column :payment_notifications, :txn_id, :string
    add_column :payment_notifications, :txn_type, :string
    add_column :payment_notifications, :payer_email, :string
    add_column :payment_notifications, :memo, :string
    add_column :payment_notifications, :payment_date, :string
    add_column :payment_notifications, :payment_type, :string
    add_column :payment_notifications, :quantity, :integer
  end

  def self.down
    add_column :payment_notifications, :params, :string
    add_column :payment_notifications, :cart_id, :integer
    add_column :payment_notifications, :transaction_id, :string

    remove_column :payment_notifications, :txn_id
    remove_column :payment_notifications, :txn_type
    remove_column :payment_notifications, :payer_email
    remove_column :payment_notifications, :memo
    remove_column :payment_notifications, :payment_date
    remove_column :payment_notifications, :payment_type
    remove_column :payment_notifications, :quantity
  end
end
