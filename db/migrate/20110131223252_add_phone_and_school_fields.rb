class AddPhoneAndSchoolFields < ActiveRecord::Migration
  def self.up
    add_column :users, :phone, :string, :limit => 18
    add_column :users, :school, :string, :limit => 60
    remove_column :users, :school_id
    drop_table :schools
  end

  def self.down
    remove_column :users, :phone
    remove_column :users, :school
    add_column :users, :school_id, :integer
    create_table :schools do |t|
      t.string :name
    end
  end
end
