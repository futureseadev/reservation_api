require 'rails_helper'

RSpec.describe 'Users', type: :request do
  it 'allows a user to register' do
    user_params = attributes_for(:user)
    headers = { 'ACCEPT' => 'application/json' }
    post '/users', params: { user: user_params }, headers: headers
    expect(response).to have_http_status(:created)
  end

  it 'fails when password doesn`t match' do
    user_params = attributes_for(:user)
    user_params[:password_confirmation] = user_params[:password].reverse
    headers = { 'ACCEPT' => 'application/json' }
    post '/users', params: { user: user_params }, headers: headers
    expect(response).to have_http_status(:unprocessable_entity)
  end

  it 'fails when email is missing' do
    user_params = attributes_for(:user)
    user_params[:email] = nil
    headers = { 'ACCEPT' => 'application/json' }
    post '/users', params: { user: user_params }, headers: headers
    expect(response).to have_http_status(:unprocessable_entity)
  end

  it 'allows user to register without setting a login' do
    user_params = attributes_for(:user)
    user_params[:login] = nil
    headers = { 'ACCEPT' => 'application/json' }
    post '/users', params: { user: user_params }, headers: headers
    expect(response).to have_http_status(:created)
  end
end
