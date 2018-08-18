require 'bundler/setup'
require 'fluent/plugin/filter_time'

require 'fluent/test'
require 'fluent/test/filter_test'

Test::Unit::AutoRunner.need_auto_run = false

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = '.rspec_status'

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
