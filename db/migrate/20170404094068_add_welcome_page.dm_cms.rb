# This migration comes from dm_cms (originally 20170220100817)
class AddWelcomePage < ActiveRecord::Migration
  def change
    add_column        :cms_pages, :welcome_page, :boolean, default: false
  end
end
