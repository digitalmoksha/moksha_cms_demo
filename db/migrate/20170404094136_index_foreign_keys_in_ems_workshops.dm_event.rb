# This migration comes from dm_event (originally 20160821150124)
class IndexForeignKeysInEmsWorkshops < ActiveRecord::Migration
  def change
    add_index :ems_workshops, :account_id
    add_index :ems_workshops, :country_id
  end
end
