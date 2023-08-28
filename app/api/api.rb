require 'doorkeeper/grape/helpers'

class API < Grape::API
  prefix 'api'
  version 'v1', using: :path

  format :json

  helpers Doorkeeper::Grape::Helpers

  before do
    doorkeeper_authorize!  # Authenticate using Doorkeeper
  end

  helpers do
    def current_user
      @current_user ||= User.find_by(id: doorkeeper_token.resource_owner_id)
    end
  end

  mount V1::UsersAPI
end