###
# Page options, layouts, aliases and proxies
###

###
# Helpers
###

# Reload the browser automatically whenever files change
activate :livereload

###
# Assets
###

set :js_dir, 'assets/js'
set :css_dir, 'assets/css'
set :images_dir, 'assets/img'
set :fonts_dir, 'assets/fonts'
set :relative_links, true

###
# Environments
###

# Build-specific configuration
configure :build do
  # cache
  activate :minify_css
  activate :minify_javascript
  # others
  activate :cache_buster
  activate :relative_assets
end
