# This migration comes from dm_event (originally 20140707152124)
class AddRegistrationCommentCount < ActiveRecord::Migration
  def change
    add_column    :ems_registrations,   :comments_count,  :integer
  end
end
