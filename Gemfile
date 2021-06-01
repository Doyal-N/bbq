# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.2'

gem 'active_storage_validations'
gem 'aws-sdk-s3', require: false
gem 'devise'
gem 'figaro'
gem 'image_processing'
gem 'mailjet'
gem 'mini_magick'
gem 'omniauth'
gem 'omniauth-facebook'
gem 'omniauth-rails_csrf_protection'
gem 'omniauth-vkontakte'
gem 'pg', '~> 1.1'
gem 'rails', '~> 6.1.3', '>= 6.1.3.1'
gem 'pundit'
gem 'rails-i18n'
gem 'resque'
gem 'slim-rails'
gem 'webpacker', '~> 5.0'

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'puma', '~> 5.0'
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'rspec-rails'
  gem 'factory_bot_rails'
end

group :development do
  gem 'capistrano', require: false
  gem 'capistrano-bundler', require: false
  gem 'capistrano-rails', require: false
  gem 'capistrano-rbenv', require: false
  gem 'capistrano-resque', require: false
  gem 'rubocop-rails', require: false
end
