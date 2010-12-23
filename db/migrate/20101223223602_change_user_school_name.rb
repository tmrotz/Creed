class ChangeUserSchoolName < ActiveRecord::Migration
  def self.up
    remove_column :users, :school
    add_column :users, :school_id, :integer
  end

  def self.down
    add_column :users, :school, :integer
    remove_column :users, :school_id
  end
end
