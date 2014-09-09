class ConfirmationsController < Devise::ConfirmationsController

protected

  # The path used after confirmation.
  #------------------------------------------------------------------------------
  def after_confirmation_path_for(resource_name, resource)
    dm_cms.showpage_path(:locale => DmCore::Language.locale, :slug => 'confirmation_success')
  end

end