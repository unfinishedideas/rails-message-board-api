require 'pg'

RSpec.configure do |config|
  # DB = PG.connect({:dbname => 'message_board_test'})
  # config.after(:each) do
  #   DB.exec("DELETE FROM users *;")
  #   DB.exec("DELETE FROM groups *;")
  #   DB.exec("DELETE FROM messages *;")
  # end

  config.expect_with :rspec do |expectations|

    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|

    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups

end
