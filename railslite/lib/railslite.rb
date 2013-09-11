require 'railslite/version'
require 'railslite/active_support_array'

module Railslite
  class Application
    def call(env)
      `echo debug > debug.txt`;
        [200, {'Content-Type' => 'text/html'},
          ['Hello from Railslite!']]
    end
  end
end
