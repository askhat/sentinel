# frozen_string_literal: true

# Auth controller
class Auth < Grape::API
  namespace :account do
    desc 'Check if account with given login exists and password is correct'
    params do
      requires :login,    type: String, desc: 'Account login'
      requires :password, type: String, desc: 'Account password'
    end
    get :check do
      account = Account.first login: params[:login]
      # rubocop:disable EmptyCaseCondition
      case
      # rubocop:enable EmptyCaseCondition
      when account.nil?
        404
      when account[:password] == params[:password]
        201
      else
        401
      end
    end

    desc 'Create new account'
    params do
      requires :login,    type: String, desc: 'Account login'
      requires :password, type: String, desc: 'Account password'
    end
    post :create do
      Account.create declared(params)
    end
  end
end
