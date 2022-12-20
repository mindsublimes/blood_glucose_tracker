# frozen_string_literal: true

# RSpec.configure do |config|
# 	config.include Devise::TestHelpers, type: :controller
# end
require_relative './controller_macros'

RSpec.configure do |config|
  config.include Devise::Test::ControllerHelpers, type: :controller do
    config.extend ControllerMacros, type: :controller
  end
end
