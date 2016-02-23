require "sinatra/reloader" if development?

require 'sass/plugin/rack'

# set up the app to use SASS
Sass::Plugin.options[:style] = :compact
use Sass::Plugin::Rack

# set up the asset pipeline
register Sinatra::AssetPack
assets do 
  js :application, [
  '/js/app.js'
  ]
  css :application, [
  '/bower_components/pure/pure-min.css',
  '/stylesheets/style.css'
  ]
js_compression :jsmin     # :jsmin | :yui | :closure | :uglify
css_compression :simple   # :simple | :sass | :yui | :sqwish
end


# Some helper constants for path-centric logic
APP_ROOT = Pathname.new(File.expand_path('../../', __FILE__))
APP_NAME = APP_ROOT.basename.to_s

# Set the views directory
configure do
  set :views, File.join(APP_ROOT, "app", "views")
end

# Set up the models, controllers and helpers
["models", "controllers", "helpers"].each do |folder|
  Dir[APP_ROOT.join('app', folder, '*.rb')].each { |file| require file }
end