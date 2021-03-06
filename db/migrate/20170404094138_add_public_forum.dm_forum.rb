# This migration comes from dm_forum (originally 20130424125513)
class AddPublicForum < ActiveRecord::Migration
  def up
    add_column    :fms_forums,     :is_public, :boolean, :default => false
    add_column    :fms_forums,     :requires_login, :boolean, :default => false
    remove_column :fms_forums,     :state
  end
  
  def down
    remove_column :fms_forums,     :is_public
    remove_column :fms_forums,     :requires_login
    add_column    :fms_forums,     :state, :string, :default => 'public'
  end
end
