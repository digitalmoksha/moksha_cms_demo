# This migration comes from dm_event (originally 20130516124327)
class AddLocaleToRegistration < ActiveRecord::Migration
  def change
    add_column    :ems_registrations,   :registered_locale, :string, :limit => 5
  end
end
