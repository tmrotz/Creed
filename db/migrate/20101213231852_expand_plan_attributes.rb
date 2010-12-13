class ExpandPlanAttributes < ActiveRecord::Migration
  def self.up
    change_column :plans, :target_body, :string, :limit => 2000
    change_column :plans, :financial, :string, :limit => 2000
    change_column :plans, :status, :string, :limit => 1000
  end

  def self.down
    change_column :plans, :target_body, :string, :limit => 255
    change_column :plans, :financial, :string, :limit => 255
    change_column :plans, :status, :string, :limit => 255
  end
end
