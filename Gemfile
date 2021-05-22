source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.2'

gem 'rails', '~> 6.1.3', '>= 6.1.3.1'
gem 'figaro'
gem 'devise'
gem 'omniauth'
gem 'omniauth-facebook'
gem "omniauth-rails_csrf_protection"
gem 'pg', '~> 1.1'
gem 'rails-i18n'
gem 'resque'
gem 'slim-rails'
gem 'mailjet'
gem 'webpacker', '~> 5.0'
gem 'aws-sdk-s3', require: false
gem 'active_storage_validations'
gem 'mini_magick'
gem 'image_processing'

group :development, :test do
  gem 'puma', '~> 5.0'
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem 'rubocop-rails', require: false
  gem 'capistrano', require: false
  gem 'capistrano-rails', require: false
  gem 'capistrano-rbenv', require: false
  gem 'capistrano-bundler', require: false
  gem 'capistrano-resque', require: false
end
