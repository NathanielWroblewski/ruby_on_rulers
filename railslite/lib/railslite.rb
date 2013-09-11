require "railslite/version"

module Railslite
  class Application
    def call(env)
      [200, {'Content-Type' => 'text/html'},
        ['Hello from Railslite!']]
    end
  end
end
