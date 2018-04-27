# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path
  Rails.application.config.assets.paths << Rails.root.join('bower_components')

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Application JavaScript
  Rails.application.config.assets.precompile += %w(
                                                  components/*.js
                                                  dough/assets/js/components/*.js
                                                )

# Vendor JavaScript
  Rails.application.config.assets.precompile += %w(
                                                  requirejs/require.js
                                                )

# Include fonts
  Rails.application.config.assets.paths << Rails.root.join("app", "assets", "fonts")
