require 'rails_helper'

describe "post groups route", :type => :request do
  before(:each) do
    User.destroy_all
  end

  before do
    post '/groups', params: { :name => 'AwesomeSauce'}
  end


  it 'returns the group' do
    expect(JSON.parse(response.body)['name']).to eq('AwesomeSauce')
  end

  it 'returns status code 200' do
    expect(response).to have_http_status(:success)
  end

end
