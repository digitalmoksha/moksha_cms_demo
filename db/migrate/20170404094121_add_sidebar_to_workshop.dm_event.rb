# This migration comes from dm_event (originally 20130916160033)
class AddSidebarToWorkshop < ActiveRecord::Migration
  def change
    add_column  :ems_workshop_translations, :sidebar, :text
  end
end
