source 'https://rubygems.org'

ruby '2.2.4'
gem 'rails', '4.2.3'
gem 'pg' # PostgreSQL
gem 'rails_12factor', group: :production
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.1.0'

gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 2.0'
gem 'sdoc', '~> 0.4.0', group: :doc

# Makes shit look pretty
gem 'bootstrap-sass', '~> 3.2.0'
gem 'bootswatch-rails'
gem 'autoprefixer-rails'

gem 'coffee-script'
gem 'ruby-filemagic'

# User signin registration
gem 'devise'

# Uploaded files
# Try paperclip
gem 'paperclip', '~> 4.3.1', github:'thoughtbot/paperclip'

# TODO remove refile. 
# Somewhere there is a reference to it that breaks the server.
gem 'refile', require: 'refile/rails'
#gem 'refile-mini_magick'
#gem 'refile-s3'
gem 'aws-sdk', '~> 2.2.27'
gem 'mini_magick', '~> 4.4'

# Image manipulation

# Comments with threading
# gem 'acts_as_commentable_with_threading', '~> 2.0', '>= 2.0.1'

# For voting 
gem 'acts_as_votable', '~> 0.10.0'

# Helps with forms
gem 'simple_form', '~> 3.0.2'

# mime type detection
gem 'mimemagic'
group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
  gem 'better_errors'

  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end

gem 'puma'
