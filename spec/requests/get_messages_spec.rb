require 'rails_helper'

describe "get all messages route", :type => :request do
  let!(:messages) { FactoryBot.create_list(:message, 10)}
  before { get '/groups/1/messages'}

  it 'returns all messages to a specific group' do
    expect(JSON.parse(response.body).size).to eq(10)
  end

  it 'returns status code 200' do
    expect(response).to have_http_status(:success)
  end

end
