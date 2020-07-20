require 'rails_helper'

RSpec.describe 'Vehicles', type: :request do
  describe 'index' do
    it 'returns a paginated list of vehicles' do
      create_list(:vehicle, 11)
      headers = { 'ACCEPT' => 'application/json' }
      get '/vehicles', headers: headers
      expect(json_data['data'].count).to eq 10
    end
  end

  def json_data
    JSON.parse(response.body)
  end
end
