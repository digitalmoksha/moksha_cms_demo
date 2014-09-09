class RegistrationsController < Devise::RegistrationsController

protected

  # Redirect to the signup_success page
  #------------------------------------------------------------------------------
  def after_inactive_sign_up_path_for(resource)
    dm_cms.showpage_path(:locale => DmCore::Language.locale, :slug => 'signup_success')
  end

end