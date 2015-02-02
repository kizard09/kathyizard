#------------------------------------------------------------------------
# config.rb
#------------------------------------------------------------------------

# Configuration variables specific to each project
#------------------------------------------------------------------------
# SITE_NAME                      = 'Kathy Izard'
# URL_ROOT                        = 'http://kathyizard.dev.qsfllc.info/'
# AWS_BUCKET                      = 'kathyizard.dev.qsfllc.info'
# AWS_CLOUDFRONT_DISTRIBUTION_ID  = 'xxxxxxxxxxxx'
# #GOOGLE_ANALYTICS_ID            = 'UA-XXXXXXX-X'


# # Common configuration below here, should not need to be changed.
# #------------------------------------------------------------------------


# # Sent in on CLI by rake task
# #------------------------------------------------------------------------
# AWS_ACCESS_KEY                  = ENV['AWS_ACCESS_KEY']
# AWS_SECRET                      = ENV['AWS_SECRET']

###
# Blog settings
###

# Time.zone = "EST"

activate :blog do |blog|
  # This will add a prefix to all links, template references and source paths
  #blog.prefix = "blog"

  blog.permalink = "blog/{title}.html"
  # Matcher for blog source files
  blog.sources = "blog/{year}-{month}-{day}-{title}.html"
  blog.taglink = "blog/tags/{tag}.html"
  blog.layout = "blog_article"
  # blog.summary_separator = /(READMORE)/
  # blog.summary_length = 250
  blog.year_link = "blog/{year}.html"
  blog.month_link = "blog/{year}/{month}.html"
  blog.day_link = "blog/{year}/{month}/{day}.html"
  blog.default_extension = ".markdown"

  blog.tag_template = "tag.html"
  blog.calendar_template = "calendar.html"

  # Enable pagination
  # blog.paginate = true
  # blog.per_page = 10
  # blog.page_link = "page/{num}"
end

page "/feed.xml", layout: false

# LiveReload and pretty URLs
activate :livereload
activate :directory_indexes

# Use relative paths
activate :relative_assets
set :relative_links, false

# Default layout
# page '/*', layout: 'application'
# A path which all have the same layout
# with_layout :blog do
#  page "/blog/*"
# end
# With alternative layout
page "/terms.html", layout: "page"
page "/privacy.html", layout: "page"

# Font Awesome
require "font-awesome-sass"

# Asset paths
set :css_dir, "stylesheets"
set :js_dir, "javascripts"
set :images_dir, "images"


# Haml config
# set :haml, { :attr_wrapper => '"' }

# Ignore files (e.g. keeps livereload from watching these)
config[:file_watcher_ignore] += [ /.idea\// ]

# Enable
# require "better_errors"

# configure :development do
#  use BetterErrors::Middleware
#  BetterErrors.application_root = __dir__
# end


# https://github.com/jcypret/middleman-title
# activate :title, site: SITE_NAME, separator: ' | '

# https://github.com/Aupajo/middleman-search_engine_sitemap
set :url_root, URL_ROOT
activate :search_engine_sitemap, default_priority: 0.8,
                                  default_change_frequency: "weekly"

# https://github.com/follmann/middleman-favicon-maker
activate :favicon_maker, :icons => {
  "_favicon_template.png" => [
    { icon: "apple-touch-icon-152x152-precomposed.png" },
    { icon: "apple-touch-icon-114x114-precomposed.png" },
    { icon: "apple-touch-icon-72x72-precomposed.png" },
    { icon: "favicon.ico", size: "64x64,32x32,24x24,16x16" },
  ]
}

# Deplyment configurations
#require 'middleman-aws'

# https://github.com/fredjean/middleman-s3_sync
activate :s3_sync do |s3_sync|
  s3_sync.bucket                    = AWS_BUCKET # The name of the S3 bucket you are targeting. This is globally unique.
  # s3_sync.region                    = 'us-east-1'    # The AWS region for your bucket. (S3 no longer requires this, dummy input?)
  s3_sync.aws_access_key_id          = AWS_ACCESS_KEY
  s3_sync.aws_secret_access_key      = AWS_SECRET
  s3_sync.delete                    = false # We delete stray files by default.
  # s3_sync.after_build                = false # We do not chain after the build step by default.
  # s3_sync.prefer_gzip                = true
  # s3_sync.path_style                = true
  # s3_sync.reduced_redundancy_storage = false
  # s3_sync.acl                        = 'public-read'
  # s3_sync.encryption                = false
  # s3_sync.prefix                    = ''
  # s3_sync.version_bucket            = false
end

# https://github.com/andrusha/middleman-cloudfront
# activate :cloudfront do |cf|
#  cf.access_key_id                    = AWS_ACCESS_KEY
#  cf.secret_access_key                = AWS_SECRET
#  cf.distribution_id                  = AWS_CLOUDFRONT_DISTRIBUTION_ID
#  # cf.filter = /\.html$/i
# end

# Build config
configure :build do
  activate :minify_css
  activate :minify_javascript
  activate :asset_hash
  activate :imageoptim do |options|
    # print out skipped images
    options.verbose = false

    # Setting these to true or nil will let options determine them (recommended)
    options.nice = true
    options.threads = true

    # Image extensions to attempt to compress
    options.image_extensions = %w(.png .jpg .gif .svg)

    # compressor worker options, individual optimisers can be disabled by passing
    # false instead of a hash
    options.pngcrush_options  = {:chunks => ['alla'], :fix => false, :brute => false}
    options.pngout_options    = false #{:copy_chunks => false, :strategy => 0}
    options.optipng_options  = {:level => 6, :interlace => false}
    options.advpng_options    = {:level => 4}
    options.jpegoptim_options = {:strip => ['all'], :max_quality => 100}
    options.jpegtran_options  = {:copy_chunks => false, :progressive => true, :jpegrescan => true}
    options.gifsicle_options  = {:interlace => false}
    #options.svgo_options      = false
  end
  # Use relative URLs
  # activate :relative_assets
  # Or use a different image path
  # set :http_prefix, "/Content/images/"
end

# Add bower's directory to sprockets asset path
after_configuration do
  @bower_config = JSON.parse(IO.read("#{root}/.bowerrc"))
  sprockets.append_path File.join "#{root}", @bower_config["directory"]
end

# Automatic image dimensions on image_tag helper
# activate :automatic_image_sizes

# Methods defined in the helpers block are available in templates
# helpers do
#  def some_helper
#    "Helping"
#  end
# end

###
# Compass
###

compass_config do |config|
  # Require any additional compass plugins here.
  config.add_import_path "bower_components/foundation/scss"
  
  # Set this to the root of your project when deployed:
  config.http_path = "/"
  config.css_dir = "stylesheets"
  config.sass_dir = "stylesheets"
  config.images_dir = "images"
  config.javascripts_dir = "javascripts"

  # You can select your preferred output style here (can be overridden via the command line):
  # output_style = :expanded or :nested or :compact or :compressed

  # To enable relative paths to assets via compass helper functions. Uncomment:
  # relative_assets = true

  # To disable debugging comments that display the original location of your selectors. Uncomment:
  # line_comments = false


  # If you prefer the indented syntax, you might want to regenerate this
  # project again passing --syntax sass, or you can uncomment this:
  # preferred_syntax = :sass
  # and then run:
  # sass-convert -R --from scss --to sass sass scss && rm -rf sass && mv scss sass
end

# Change Compass configuration
# compass_config do |config|
#  config.output_style = :compact
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
#  page "/admin/*"
# end

# Proxy pages (http://middlemanapp.com/dynamic-pages/)
# proxy "/this-page-has-no-template.html", "/template-file.html", :locals => {
#  :which_fake_page => "Rendering a fake page with a local variable" }