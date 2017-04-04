# This migration comes from dm_forum (originally 20140423113420)
class AddForumOwner < ActiveRecord::Migration
  def change
    add_column    :fms_forums, :owner_id,    :integer
    add_column    :fms_forums, :owner_type,  :string
  end
end
