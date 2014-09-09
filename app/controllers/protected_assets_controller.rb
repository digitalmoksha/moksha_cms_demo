class ProtectedAssetsController < ApplicationController
    
  # serves an asset from the account's protected_assets directory
  # Expects the protected files to be in #{Rails.root}/protected_assets/#{theme_name}
  # typically symlinked from whereever they are stored (such as in the theme's directory)
  # Note: we check the expanded path against the base path to make sure there 
  # any '..' in the path didn't kick us out of where we're supposed to be.
  #------------------------------------------------------------------------------
  def protected_asset
    #--- expand and make sure we're in the protected_asset directory
    base_path     = File.join(Rails.root, 'protected_assets', account_prefix)
    request_file  = File.expand_path(File.join(base_path, params[:asset]))

    if File.exists?(request_file) && request_file.start_with?(base_path) && user_signed_in?
      #--- for Apache xsendfile, we *might* need to use send_file(File.realpath(request_file)...
      send_file(request_file, :disposition => 'inline',
        :type => Mime::Type.lookup_by_extension(File.extname(request_file)[1..-1]))
    else
      render(:file => 'public/404.html', :status => :not_found, :layout => false)
    end
  end
end