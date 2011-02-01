class AddSubmittedFieldToPlans < ActiveRecord::Migration
  def self.up
    add_column :users, :submitted, :string, :default => "false"
  end

  def self.down
    remove_column :users, :submitted
  end
end
