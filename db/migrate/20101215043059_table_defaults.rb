class TableDefaults < ActiveRecord::Migration
  def self.up
    change_column :users, :paid, :string, :default => "false"
    change_column :users, :votes, :integer, :default => 0
  end

  def self.down
    change_column :users, :paid, :string, :null => true
    change_column :users, :votes, :integer, :null => true
  end
end
