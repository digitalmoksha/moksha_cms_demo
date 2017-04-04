# This migration comes from dm_cms (originally 20160821150110)
class IndexForeignKeysInCmsPosts < ActiveRecord::Migration
  def change
    add_index :cms_posts, :account_id
    add_index :cms_posts, :cms_blog_id
  end
end
