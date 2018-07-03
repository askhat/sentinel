# frozen_string_literal: true

# The single model
class Account
  include DataMapper::Resource

  property :id,         Serial
  property :login,      String
  property :password,   String
  property :created_at, DateTime
  property :updated_at, DateTime
end
