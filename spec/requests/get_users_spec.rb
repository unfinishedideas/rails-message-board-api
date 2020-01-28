require 'rails_helper'

describe "get all users route", :type => :request do
  before(:each) do
    User.destroy_all
  end
  
  let!(:users) { FactoryBot.create_list(:user, 10)}

  before { get '/users'}

  it 'returns all users' do
    expect(JSON.parse(response.body).size).to eq(10)
  end

  it 'returns status code 200' do
    expect(response).to have_http_status(:success)
  end
end
