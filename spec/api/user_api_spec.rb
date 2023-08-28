require 'rails_helper'

RSpec.describe V1::UsersAPI, type: :request do
  # describe 'GET /api/users/me' do
  #   let(:user) { create(:user) }
  #   let(:access_token) { user.doorkeeper_access_tokens.create! }

  #   context 'when authenticated' do
  #     it 'returns the user\'s own data' do
  #       get '/api/users/me', headers: {
  #         'Authorization': "Bearer #{access_token.token}"
  #       }

  #       expect(response).to have_http_status(:success)
  #       response_data = JSON.parse(response.body)
  #       expect(response_data['id']).to eq(user.id)
  #       expect(response_data['username']).to eq(user.username)
  #       expect(response_data['email']).to eq(user.email)
  #     end
  #   end

  #   context 'when not authenticated' do
  #     it 'returns unauthorized' do
  #       get '/api/users/me'
  #       expect(response).to have_http_status(:unauthorized)
  #     end
  #   end
  # end


  describe 'GET /api/users/me' do
    context 'when authenticated' do
      let(:user) { User.create(username: 'testuser', email: 'test@example.com') }
      let(:application) { Doorkeeper::Application.create!(name: 'Test App', redirect_uri: 'https://www.example.com/') }
      let(:access_token) { Doorkeeper::AccessToken.create!(resource_owner_id: user.id, application_id: application.id) }

      it 'returns the user\'s own data' do
        get '/api/v1/users/me', headers: {
          'Authorization': "Bearer #{access_token.token}"
        }

        expect(response).to have_http_status(:success)
      end
    end

    context 'when not authenticated' do
      it 'returns unauthorized' do
        get '/api/v1/users/me'
        expect(response).to have_http_status(:unauthorized)
      end
    end
  end
end