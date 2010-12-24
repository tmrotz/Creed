class AddSchoolIdToPlans < ActiveRecord::Migration
  def self.up
    add_column :plans, :school_id, :integer
  end

  def self.down
    remove_column :plans, :school_id
  end
end
