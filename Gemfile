source 'https://rubygems.org'
ruby '2.0.0'

gem 'rails',                '4.0.0'
gem 'pg',                   '0.17.0'
gem 'zurb-foundation',      '4.3.2'
gem 'sass-rails',           '4.0.1'
gem 'uglifier',             '2.2.1'
gem 'coffee-rails',         '4.0.1'
gem 'jquery-rails',         '3.0.4'
gem 'paperclip',            '3.5.1'
gem 'aws-sdk',              '~> 1.5.7' # required by paperclip
gem 'capistrano',           '2.15.0'

group :development do
  gem 'better_errors',      '1.0.1'
end

group :test do
  gem 'shoulda-matchers',   '2.4.0'
  gem 'simplecov',          '0.7.1', require: false
end

group :development, :test do
  gem 'rspec-rails',        '2.14.0'
  gem 'factory_girl_rails', '4.2.1'
  gem 'pry-rails',          '0.3.2'
  gem 'dotenv-rails',       '0.9.0'
  gem 'awesome_print',      '1.2.0'
end

group :production do
  gem 'therubyracer'
end
