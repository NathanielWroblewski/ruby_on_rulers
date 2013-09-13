require_relative 'test_helper'

class TestController < Railslite::Controller
  def index
    'not rendering a view'
  end
end

class TestApp < Railslite::Application
  def get_controller_and_action(env)
    [TestController, 'index']
  end
end

class RailsliteAppTest < Test::Unit::TestCase
  include Rack::Test::Methods

  def app
    TestApp.new
  end

  def test_request
    get '/test/index'

    assert last_response.ok?
    body = last_response.body
    assert body['view']
  end
end
