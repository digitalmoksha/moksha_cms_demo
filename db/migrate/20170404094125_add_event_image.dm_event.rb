# This migration comes from dm_event (originally 20140122204702)
class AddEventImage < ActiveRecord::Migration
  def change
    add_column    :ems_workshops, :image, :string
  end
end
