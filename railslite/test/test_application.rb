require_relative 'test_helper'

class TestApp < Railslite::Application
end

class RailsliteAppTest < Test::Unit::TestCase
  include Rack::Test::Methods

  def app
    TestApp.new
  end

  def test_requrest
    get '/'

    assert last_response.ok?
    body = last_response.body
    assert body['Hello']
  end
end
