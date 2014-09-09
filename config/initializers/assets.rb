# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
Rails.application.config.assets.precompile += %w( admin.css admin.js bootstrap_assets.css bootstrap_assets.js )

#--- make sure image/font assets in all asset paths (particularly themes) are precompiled
Rails.application.config.assets.precompile += %w(*.png *.jpg *.jpeg *.gif *.ttf *.eot *.svg *.woff *.swf *.mp3 *.mp4)
