# This migration comes from dm_forum (originally 20160821150127)
class IndexForeignKeysInFmsForums < ActiveRecord::Migration
  def change
    add_index :fms_forums, :forum_category_id
    add_index :fms_forums, :forum_site_id
    add_index :fms_forums, :owner_id
  end
end
