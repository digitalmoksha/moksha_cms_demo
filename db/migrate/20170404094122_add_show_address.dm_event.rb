# This migration comes from dm_event (originally 20130917161700)
class AddShowAddress < ActiveRecord::Migration
  def change
    add_column   :ems_workshops, :show_address, :boolean
  end
end
