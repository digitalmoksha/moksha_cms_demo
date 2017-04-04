# This migration comes from dm_forum (originally 20160821150125)
class IndexForeignKeysInFmsForumSites < ActiveRecord::Migration
  def change
    add_index :fms_forum_sites, :account_id
  end
end
