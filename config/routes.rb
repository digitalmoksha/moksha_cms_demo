Rails.application.routes.draw do

  scope ":locale" do
    devise_for :users, :controllers => { :registrations => "registrations", :confirmations => 'confirmations' }
  end

  #------------------------------------------------------------------------------

  themes_for_rails

  mount DmCore::Engine, :at => '/'
  
  get   '/protected_asset/*asset',  :controller => :protected_assets, :action => :protected_asset, :format => false, :via => :get

  scope ":locale" do
    namespace :admin do 
      #resources :users
    end

    get   '/index',                 :controller => 'dm_cms/pages', :action => :show, :slug => 'index', :as  => :index
  end

  # mount DmEvent::Engine,            :at => '/'
  # mount DmForum::Engine,            :at => '/'
  # mount DmNewsletter::Engine,       :at => '/'
  mount DmCms::Engine,              :at => '/'

  #--- use match instead of root to fix issue where sometimes '?locale=de' is appeneded
  get   '/(:locale)',            :controller => 'dm_cms/pages', :action => :show, :slug => 'index', :as => :root

end
