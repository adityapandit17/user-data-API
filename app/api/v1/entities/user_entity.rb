module V1
  module Entities
    class UserEntity < Grape::Entity
      expose :id
      expose :username
      expose :email
    end
  end
end