# This migration comes from dm_event (originally 20160810081542)
class AddBccContactEmail < ActiveRecord::Migration
  def change
    add_column    :ems_workshops, :bcc_contact_email, :boolean, default: false
  end
end
