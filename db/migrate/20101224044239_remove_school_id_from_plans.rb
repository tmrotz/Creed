class RemoveSchoolIdFromPlans < ActiveRecord::Migration
  def self.up
    remove_column :plans, :school_id
  end

  def self.down
    add_column :plans, :school_id, :integer
  end
end
