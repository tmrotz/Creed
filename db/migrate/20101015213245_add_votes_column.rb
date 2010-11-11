class AddVotesColumn < ActiveRecord::Migration
  def self.up
    add_column :users, :votes, :integer
  end

  def self.down
    remove_column :users, :votes
  end
end
