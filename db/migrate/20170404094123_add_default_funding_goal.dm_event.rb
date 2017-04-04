# This migration comes from dm_event (originally 20131116180719)
class AddDefaultFundingGoal < ActiveRecord::Migration
  def up
    change_column :ems_workshops, :funding_goal_cents, :integer, :default => 0
  end

  def down
  end
end
