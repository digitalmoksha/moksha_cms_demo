# This migration comes from dm_event (originally 20140523165342)
class AddWorkshopSummary < ActiveRecord::Migration
  def change
    add_column    :ems_workshop_translations,  :summary,   :text
  end
end
