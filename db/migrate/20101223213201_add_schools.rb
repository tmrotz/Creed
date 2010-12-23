class AddSchools < ActiveRecord::Migration
  def self.up
    create_table :schools do |t|
      t.string :name
      t.integer :id, :primary_key
    end

    add_column :users, :school, :integer
  end

  def self.down
    drop_table :schools

    drop_column :users, :school
  end
end
