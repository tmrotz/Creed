class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :first
      t.string :last
      t.integer :id
      t.string :hashed_password
      t.string :salt
      t.string :paid

      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
