class FinalBusinessPlan < ActiveRecord::Migration
  def self.up
    add_column :plans, :subtitle, :string
    remove_column :plans, :body
    add_column :plans, :target_title, :string
    add_column :plans, :target_body, :string
    add_column :plans, :financial, :string
    add_column :plans, :status, :string
    add_column :plans, :action, :string
    remove_column :plans, :conclusion
  end

  def self.down
    remove_column :plans, :subtitle
    add_column :plans, :body, :string
    remove_column :plans, :target_title
    remove_column :plans, :target_body
    remove_column :plans, :financial
    remove_column :plans, :status
    remove_column :plans, :action
    add_column :plans, :conclusion, :string
  end
end
