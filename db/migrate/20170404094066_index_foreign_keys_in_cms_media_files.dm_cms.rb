# This migration comes from dm_cms (originally 20160821150109)
class IndexForeignKeysInCmsMediaFiles < ActiveRecord::Migration
  def change
    add_index :cms_media_files, :account_id
    add_index :cms_media_files, :user_id
  end
end
