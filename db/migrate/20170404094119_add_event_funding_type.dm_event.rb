# This migration comes from dm_event (originally 20130913083529)
class AddEventFundingType < ActiveRecord::Migration
  def change
    add_column   :ems_workshops, :event_style,          :string,  :default => 'workshop'
    add_column   :ems_workshops, :funding_goal_cents,   :integer
  end
end
