# This migration comes from dm_event (originally 20130914105736)
class AddEnablePayments < ActiveRecord::Migration
  def change
    add_column   :ems_workshops, :payments_enabled,    :boolean
  end
end
