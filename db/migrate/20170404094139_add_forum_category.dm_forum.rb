# This migration comes from dm_forum (originally 20130430084925)
class AddForumCategory < ActiveRecord::Migration

  def change
    add_column    :fms_forums, :forum_category_id, :integer
  end

end
