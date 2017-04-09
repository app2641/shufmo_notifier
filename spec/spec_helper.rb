require 'byebug'
require 'webmock/rspec'
require_relative '../lib/shufmo_notifier'

RSpec.configure do |config|
  original_stderr = $stderr
  original_stdout = $stdout
end
