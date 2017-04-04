# This migration comes from dm_event (originally 20160821150121)
class IndexForeignKeysInEmsWorkshopPriceTranslations < ActiveRecord::Migration
  def change
    add_index :ems_workshop_price_translations, :ems_workshop_price_id
  end
end
