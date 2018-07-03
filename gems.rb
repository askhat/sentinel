# frozen_string_literal: true

source 'https://rubygems.org'

gem 'data_mapper'
gem 'dm-sqlite-adapter'
gem 'grape'

group :development do
  gem 'debase'
  gem 'ruby-debug-ide'
  gem 'shotgun'
end
