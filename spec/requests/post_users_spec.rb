require 'rails_helper'

describe "post users route", :type => :request do
  before(:each) do
    User.destroy_all
  end

  before do
    post '/users', params: { :user_name => 'Pidget'}
  end


  it 'returns the user' do
    expect(JSON.parse(response.body)['user_name']).to eq('Pidget')
  end

  it 'returns status code 200' do
    expect(response).to have_http_status(:success)
  end
end
