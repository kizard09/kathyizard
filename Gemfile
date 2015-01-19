# If you have OpenSSL installed, we recommend updating
# the following line to use "https"
source "https://rubygems.org"

# ruby "2.1.3"

# For feed.xml.builder
gem "builder", "~> 3.0"
gem "sass", "3.4.5" # Sass 3.4.6 is broken, so using 3.4.5
gem "font-awesome-sass"

gem "middleman", "3.2.2" # Middleman 3.3.x all have issues, so using 3.2.2, the latest before 3.3.0
gem "middleman-livereload"
gem "middleman-search_engine_sitemap"
gem "middleman-favicon-maker", "~> 3.7"
gem "middleman-imageoptim", "~> 0.1.4"
gem "middleman-blog"
#gem "middleman-title"

gem "nokogiri"
gem "rake"
gem 'rack-contrib'
gem 'puma'

# For faster file watcher updates on Windows:
gem "wdm", "~> 0.1.0", :platforms => [:mswin, :mingw]
# Windows does not come with time zone data
gem "tzinfo-data", platforms: [:mswin, :mingw]

# group :development do
#  gem "better_errors"
# end


#------------------------------------------------------------------------
# Deployment - requires additional configuration.  See links below
gem 'middleman-aws'        # https://github.com/alienfast/middleman-aws
gem 'middleman-s3_sync'    # https://github.com/fredjean/middleman-s3_sync
gem 'middleman-cloudfront'  # https://github.com/andrusha/middleman-cloudfront
