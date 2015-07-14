require 'middleman-pry'
require 'pry'
require 'lib/dan_schema'
# Kramdown
set :markdown_engine, :kramdown
set :markdown, :toc_levels => 1..3
set :trailing_slash, true

# Plugins
activate :directory_indexes
activate :i18n, :mount_at_root => :en
activate :livereload
activate :syntax, :line_numbers => false


activate :onthestreet_extension
puts config[:services]

## SETTINGS
set :layout, :page



data.datasets.each_pair do |slug, hsh|
  puts slug
  dataset = DanSchema::Dataset.new(hsh)
  proxy "/datasets/#{slug}", "/templates/dataset.html", :locals => { :dataset => dataset},
  :dynamic_page => {title: dataset.title, description: dataset.description }
end


# Build-specific configuration
configure :build do
  # For example, change the Compass output style for deployment
  # activate :minify_css

  # Minify Javascript on build
  # activate :minify_javascript

  # Enable cache buster
  # activate :asset_hash

  # Use relative URLs
  # activate :relative_assets

  # Or use a different image path
  # set :http_prefix, "/Content/images/"
end




### default boilerplate
###
# Compass
###

# Change Compass configuration
# compass_config do |config|
#   config.output_style = :compact
# end

###
# Page options, layouts, aliases and proxies
###

# Per-page layout changes:
#
# With no layout
# page "/path/to/file.html", :layout => false
#
# With alternative layout
# page "/path/to/file.html", :layout => :otherlayout
#
# A path which all have the same layout
# with_layout :admin do
#   page "/admin/*"
# end

# Proxy pages (https://middlemanapp.com/advanced/dynamic_pages/)
# proxy "/this-page-has-no-template.html", "/template-file.html", :locals => {
#  :which_fake_page => "Rendering a fake page with a local variable" }

###
# Helpers
###

# Automatic image dimensions on image_tag helper
# activate :automatic_image_sizes

# Reload the browser automatically whenever files change
# configure :development do
#   activate :livereload
# end

# Methods defined in the helpers block are available in templates
# helpers do
#   def some_helper
#     "Helping"
#   end
# end
