# frozen_string_literal: true

$LOAD_PATH.unshift File.expand_path __dir__
APP_ROOT     = ENV['APP_ROOT']     || File.expand_path(__dir__)
RACK_ENV     = ENV['RACK_ENV']     || :development unless defined? RACK_ENV
DATABASE_URL = ENV['DATABASE_URL'] || "sqlite://#{APP_ROOT}/db/#{RACK_ENV}.db"

require 'rubygems'
require 'bundler'
Bundler.require :default, RACK_ENV

DataMapper.setup :default, DATABASE_URL

require 'app/model'
require 'app/controller'

DataMapper.finalize
DataMapper.auto_upgrade!
