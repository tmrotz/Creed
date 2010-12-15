class ConnectUserPlan < ActiveRecord::Migration
  def self.up
    add_column :plans, :user_id, :integer
  end

  def self.down
    remove_column :plans, :user_id
  end
end
