class AddPlansColumns < ActiveRecord::Migration
  def self.up
    add_column :plans, :title, :string
    add_column :plans, :body, :text
    add_column :plans, :conclusion, :text
  end

  def self.down
    remove_column :plans, :title
    remove_column :plans, :body
    remove_column :plans, :conclusion
  end
end
