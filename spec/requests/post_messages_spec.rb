require 'rails_helper'
require 'pry'

describe "post messages route", :type => :request do
  before(:each) do
    User.destroy_all
    Group.destroy_all
  end

  # let!(:groups) { FactoryBot.create_list(:group, 1)}
  # let!(:users) { FactoryBot.create_list(:user, 1)}

  before do
    group = FactoryBot.create(:group)
    user = FactoryBot.create(:user)
    post '/groups/61/messages', params: {
      :title => 'Titley', :content => 'Great googly moogly',
      :user_id => user.id, :group_id => group.id
    }
  end


  it 'returns the messsage' do
    expect(JSON.parse(response.body)['title']).to eq('Titley')
  end

  it 'returns status code 200' do
    expect(response).to have_http_status(:success)
  end
end


# RAKE_ENV=test rake db:migrate:reset db:test:prepare
