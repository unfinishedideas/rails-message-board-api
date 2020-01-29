# spec/integration/pets_spec.rb
require 'swagger_helper'

describe 'Message Board API' do

  path '/groups/' do

    post 'Creates a group' do
      tags 'Message Board'
      consumes 'application/json', 'application/xml'
      parameter name: :group, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string },
        },
        required: [ 'name' ]
      }

      response '201', 'pet created' do
        let(:group) { { name: 'Dodo' } }
        run_test!
      end

      response '422', 'invalid request' do
        let(:group) { { name: 'foo' } }
        run_test!
      end
    end
  end

  path '/groups/{:id}' do

    get 'Retrieves a group' do
      tags 'Message Board'
      produces 'application/json', 'application/xml'
      parameter name: :id, :in => :path, :type => :string

      response '200', 'name found' do
        schema type: :object,
          properties: {
            id: { type: :integer, },
            name: { type: :string },
          },
          required: [ 'id', 'name']

        let(:id) { Group.create(name: 'foo').id }
        run_test!
      end

      response '404', 'pet not found' do
        let(:id) { 'invalid' }
        run_test!
      end
    end
  end
end
