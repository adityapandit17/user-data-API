module V1
  class UsersAPI < API
    resource :users do
      desc 'Retrieve your own data'

      get 'me' do
        present current_user, with: V1::Entities::UserEntity
      end
    end
  end
end