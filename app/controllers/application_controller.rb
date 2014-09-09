class ApplicationController < DmCore::ApplicationController
  protect_from_forgery with: :null_session

  helper    :all
  helper    DmCms::RenderHelper
  helper    DmCms::PagesHelper
end
