class RemovePrimaryKeyColumn < ActiveRecord::Migration
  def self.up
    remove_column :schools, :primary_key
  end

  def self.down
    add_column :schools, :primary_key, :integer
  end
end
