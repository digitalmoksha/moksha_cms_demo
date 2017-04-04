# This migration comes from dm_event (originally 20130518092324)
class AddRequireAddress < ActiveRecord::Migration
  def change
    add_column    :ems_workshops, :require_account,     :boolean
    add_column    :ems_workshops, :require_address,     :boolean
    add_column    :ems_workshops, :require_photo,       :boolean
  end
end
