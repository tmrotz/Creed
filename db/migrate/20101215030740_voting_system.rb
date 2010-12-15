class VotingSystem < ActiveRecord::Migration
  def self.up
    add_column :plans, :votes, :integer, :default => 0
  end

  def self.down
    remove_column :plans, :votes
  end
end
