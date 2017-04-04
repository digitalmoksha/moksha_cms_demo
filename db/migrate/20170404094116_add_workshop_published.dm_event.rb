# This migration comes from dm_event (originally 20130609145812)
class AddWorkshopPublished < ActiveRecord::Migration
  def change
    rename_column :ems_workshops, :is_closed, :published
  end
end
