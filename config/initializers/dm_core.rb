DmCore.configure do |config|
  config.default_locale = :en

  #--- list possible locales
  config.locales        = [:en, :de, :ja, :cs, :fi, :at, :fr]

  #--- enable theme support
  config.enable_themes  = true
end
Rails.application.config.i18n.available_locales = DmCore.config.locales