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

# Proxy pages (http://middlemanapp.com/basics/dynamic-pages/)
# proxy "/this-page-has-no-template.html", "/template-file.html", :locals => {
#  :which_fake_page => "Rendering a fake page with a local variable" }

###
# Helpers
###

# Automatic image dimensions on image_tag helper
# activate :automatic_image_sizes

# Reload the browser automatically whenever files change
configure :development do
  # activate :livereload
end

# Methods defined in the helpers block are available in templates
helpers do

  # Insert a Bootstrap panel with a 'Note' header
  def note(&block)
    concat_content(
      "<div class='panel panel-default'>" +
        "<div class='panel-heading'>Note</div>" +
        "<div class='panel-body'>" + 
          capture_html(&block) + 
        "</div>" +
      "</div>"
    )
  end

end

set :css_dir, 'css'
set :js_dir, 'js'
set :images_dir, 'img'

# Enable syntax highlighting
activate :syntax

# Enable GitHub-style code blocks in markdown files
set :markdown_engine, :redcarpet
set :markdown, :fenced_code_blocks => true, :smartypants => true

# Use relative URLs
activate :relative_assets
set :relative_links, true

# Build-specific configuration
configure :build do
  # For example, change the Compass output style for deployment
  # activate :minify_css

  # Minify Javascript on build
  # activate :minify_javascript

  # Enable cache buster
  # activate :asset_hash

  # Or use a different image path
  # set :http_prefix, "/Content/images/"
end

# Deploy to GitHub pages
activate :deploy do |deploy|
  deploy.build_before = true
  deploy.method = :git
  deploy.remote = 'git@github.com:m3dev/octoparts.git'
  deploy.branch = 'gh-pages'
end
