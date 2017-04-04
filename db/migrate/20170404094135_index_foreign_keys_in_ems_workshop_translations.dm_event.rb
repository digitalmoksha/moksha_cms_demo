# This migration comes from dm_event (originally 20160821150123)
class IndexForeignKeysInEmsWorkshopTranslations < ActiveRecord::Migration
  def change
    add_index :ems_workshop_translations, :ems_workshop_id
  end
end
