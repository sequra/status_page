# Use the Dummy Rails Environment for testing
ENV["RAILS_ENV"] = "test"
require File.expand_path("../dummy/config/environment.rb",  __FILE__)
require 'rspec/rails'

module ControllerHacks
  def get(action, parameters = nil, session = nil, flash = nil)
    process_action(action, parameters, session, flash, "GET")
  end

  # Executes a request simulating POST HTTP method and set/volley the response
  def post(action, parameters = nil, session = nil, flash = nil)
    process_action(action, parameters, session, flash, "POST")
  end

  # Executes a request simulating PUT HTTP method and set/volley the response
  def put(action, parameters = nil, session = nil, flash = nil)
    process_action(action, parameters, session, flash, "PUT")
  end

  # Executes a request simulating DELETE HTTP method and set/volley the response
  def delete(action, parameters = nil, session = nil, flash = nil)
    process_action(action, parameters, session, flash, "DELETE")
  end

  private

  def process_action(action, parameters = nil, session = nil, flash = nil, method = "GET")
    parameters ||= {}
    process(action, parameters.merge!(:use_route => :status_page), session, flash, method)
  end
end

RSpec.configure do |config|
  #config.include ControllerHacks, :type => :controller

  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.run_all_when_everything_filtered = true
  config.filter_run :focus

  # Run specs in random order to surface order dependencies. If you find an
  # order dependency and want to debug it, you can fix the order by providing
  # the seed, which is printed after each run.
  #     --seed 1234
  config.order = 'random'
end
